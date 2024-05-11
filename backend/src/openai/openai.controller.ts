import { Controller, HttpException, HttpStatus } from '@nestjs/common';
import { ChatGptService } from './openai.service';
import { Post, Body } from '@nestjs/common';
import { Message } from './dto/message.dto';

@Controller('openai')
export class OpenAIController {
  constructor(private readonly chatGptService: ChatGptService) {}

  @Post('chat')
  async getChatResponse(@Body() body: { prompt: string; messages: Message[] }) {
    const response = await this.chatGptService.chatGptRequest(
      body.prompt,
      body.messages,
    );
    return { response };
  }
}
