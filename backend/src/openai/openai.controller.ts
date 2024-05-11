import {
  Controller,
  Post,
  Body,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import { ChatGptService } from './openai.service';
import { Message } from './dto/message.dto';

@Controller('openai')
export class OpenAIController {
  constructor(private readonly chatGptService: ChatGptService) {}

  @Post('chat')
  async getChatResponse(@Body() body: { prompt: string; messages: Message[] }) {
    try {
      const response = await this.chatGptService.chatGptRequest(
        body.prompt,
        body.messages,
      );
      return { response: JSON.parse(response.object.description) };
    } catch (error) {
      throw new HttpException(
        'Service unavailable',
        HttpStatus.SERVICE_UNAVAILABLE,
      );
    }
  }
}
