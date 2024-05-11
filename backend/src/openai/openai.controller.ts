import {
  Controller,
  Post,
  Body,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import { ChatGptService } from './openai.service';
import { Message } from './dto/message.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Controller('openai')
export class OpenAIController {
  constructor(
    private readonly chatGptService: ChatGptService,
    private readonly prismaService: PrismaService,
  ) {}

  @Post('chat')
  async getChatResponse(@Body() body: { prompt: string; messages: Message[] }) {
    try {
      const response = await this.chatGptService.chatGptRequest(
        body.prompt,
        body.messages,
      );
      let JSONTask = { response: JSON.parse(response.object.description) };
      if (JSONTask.response.type == 'task') {
        const taskCreationResponse = await this.prismaService.task.create({
          data: {
            title: JSONTask.response.object.title,
            description: JSONTask.response.object.description,
            status: "TODO",
            userId: 3
          },
        });
        return taskCreationResponse;
      }
    } catch (error) {
      throw new HttpException(
        'Service unavailable',
        HttpStatus.SERVICE_UNAVAILABLE,
      );
    }
  }
}
