import {
  Controller,
  Post,
  Body,
  HttpException,
  HttpStatus,
  UseGuards,
  Req,
} from '@nestjs/common';
import { ChatGptService } from './openai.service';
import { Message } from './dto/message.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { JwtAuthGuard } from 'src/authentication/auth.guard';

@Controller('openai')
export class OpenAIController {
  constructor(
    private readonly chatGptService: ChatGptService,
    private readonly prismaService: PrismaService,
  ) {}

  @Post('chat')
  @UseGuards(JwtAuthGuard)
  async getChatResponse(
    @Body() body: { prompt: string; messages: Message[] },
    @Req() req,
  ) {
    try {
      const userId = req.user['userId'];
      const response = await this.chatGptService.chatGptRequest(
        body.prompt,
        body.messages,
      );
      let jsonObject = { response: JSON.parse(response.object.description) };
      if (jsonObject.response.type == 'task') {
        const taskCreationResponse = await this.prismaService.task.create({
          data: {
            title: jsonObject.response.object.title,
            description: jsonObject.response.object.description,
            isChecked: false,
            bannerColor: 'ORANGE',
            userId: userId,
          },
        });
        return taskCreationResponse;
      } else if (jsonObject.response.type == 'meeting') {
        const meetingCreationResponse = await this.prismaService.meeting.create(
          {
            data: {
              title: jsonObject.response.title,
              description: jsonObject.response.description,
              date: new Date().toISOString(),
              userId: userId,
            },
          },
        );
        return meetingCreationResponse;
      }
    } catch (error) {
      throw new HttpException(
        `Service unavailable: ${error.message}`,
        HttpStatus.SERVICE_UNAVAILABLE,
      );
    }
  }
}
