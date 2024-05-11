import { Injectable } from '@nestjs/common';
import OpenAIApi from 'openai';

@Injectable()
export class ChatGptService {
  private openai: OpenAIApi;

  constructor() {
    this.openai = new OpenAIApi({
      apiKey: process.env.OPEN_AI_SECRET_KEY,
    });
  }
}
