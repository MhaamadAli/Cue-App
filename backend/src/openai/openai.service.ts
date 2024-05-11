import { Injectable, ServiceUnavailableException } from '@nestjs/common';
import OpenAIApi from 'openai';
import { ChatCompletion, ChatCompletionMessageParam } from 'openai/resources';
import { Message } from './dto/message.dto';

@Injectable()
export class ChatGptService {
  private openai: OpenAIApi;

  constructor() {
    this.openai = new OpenAIApi({
      apiKey: process.env.OPEN_AI_SECRET_KEY,
    });
  }

  async chatGptRequest(prompt: string, messages: Message[]): Promise<any> {
    try {
      const history = messages.map(
        (message): ChatCompletionMessageParam => ({
          role: message.ai ? 'assistant' : 'user',
          content: message.text,
        }),
      );

      const completion: ChatCompletion =
        await this.openai.chat.completions.create({
          model: 'gpt-4',
          messages: [
            {
              role: 'system',
              content: prompt,
            },
            ...history,
          ],
          temperature: 0.5,
          max_tokens: 1000,
        });

      const choice = completion.choices[0];
      if (!choice.message) {
        return { error: 'No response from GPT-3' };
      }
      const content = choice.message.content;

      if (
        content.toLowerCase().includes('reminder') ||
        content.toLowerCase().includes('task')
      ) {
        return {
          type: 'task',
          object: {
            title: prompt,
            description: content,
          },
        };
      }
      return { error: 'Response not relevant to tasks' };
    } catch (e) {
      console.error(e);
      throw new ServiceUnavailableException('Failed request to ChatGPT');
    }
  }
}
