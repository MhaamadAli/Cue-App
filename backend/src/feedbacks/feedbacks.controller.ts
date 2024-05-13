import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { FeedbacksService } from './feedbacks.service';
import { JwtAuthGuard } from 'src/authentication/auth.guard';
import { Prisma } from '@prisma/client';

@Controller('feedbacks')
export class FeedbacksController {
  constructor(private readonly feedbacksService: FeedbacksService) {}

  @Post()
  @UseGuards(JwtAuthGuard)
  create(@Body() createFeedbackDto: Prisma.FeedbackCreateInput) {
    return this.feedbacksService.create(createFeedbackDto);
  }

}
