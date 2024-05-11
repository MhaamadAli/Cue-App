import { Controller, HttpException, HttpStatus } from '@nestjs/common';
import { ChatGptService } from './openai.service';

@Controller('openai')
export class OpenAIController {
  constructor(private readonly chatGptService: ChatGptService) {}
}
