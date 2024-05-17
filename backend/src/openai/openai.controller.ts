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
  async getChatResponse(@Body() body: { messages: Message[] }, @Req() req) {
    try {
      const userId = req.user['userId'];
      const currentDate = new Date().toISOString();

      const promptTemplate = `
        act like a personal assistant that is responsible for creating tasks and scheduling meetings, return responses in parsable JSON format. 
        Basically, I will be requesting to create one of two things, task or meeting. 
        When I say something like 'create a task to remind me to buy groceries tomorrow' you will return a JSON object that has a type having a value 'task', 
        'object' having the value as { 'title': 'buy groceries', 'description': 'don't forget to buy groceries from the groceries store' } 
        while when I say something like 'schedule a meeting with Chris for tomorrow at 3pm' you will return a JSON object that has a type of 'meeting' 
        a title 'meeting with Chris' and a description: 'you have a meeting with Chris at 3pm' and a date and time field with the appropriate date and time. 
        The current date is: ${currentDate}
      `;

      const userMessage = body.messages[0].text;

      const fullPrompt = `${promptTemplate}\nUser message: ${userMessage}`;

      const response = await this.chatGptService.chatGptRequest(
        fullPrompt,
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
        const meetingDate = new Date(jsonObject.response.date);
        const meetingCreationResponse = await this.prismaService.meeting.create(
          {
            data: {
              title: jsonObject.response.title,
              description: jsonObject.response.description,
              date: meetingDate.toISOString(),
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
