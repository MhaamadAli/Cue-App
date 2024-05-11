import { Global, Module } from '@nestjs/common';
import { ChatGptService } from './openai.service';
import { OpenAIController } from './openai.controller';

@Global()
@Module({
  providers: [ChatGptService],
  controllers: [OpenAIController],
  exports: [ChatGptService],
})
export class OpenAIModule {}
