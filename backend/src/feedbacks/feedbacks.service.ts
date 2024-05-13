import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class FeedbacksService {
  constructor(private readonly prismaService: PrismaService) {}
  create(createFeedbackDto: Prisma.FeedbackCreateInput) {
    return this.prismaService.feedback.create({
      data: createFeedbackDto,
    });
  }
}
