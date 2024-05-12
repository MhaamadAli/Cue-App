import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { MeetingsService } from './meetings.service';
import { Prisma } from '@prisma/client';
import { JwtAuthGuard } from 'src/authentication/auth.guard';
import { Request } from 'express';
@Controller('meetings')
export class MeetingsController {
  constructor(private readonly meetingsService: MeetingsService) {}

  @Post()
  @UseGuards(JwtAuthGuard)
  create(@Body() createMeetingDto: Prisma.MeetingCreateInput) {
    return this.meetingsService.create(createMeetingDto);
  }

  @Get()
  @UseGuards(JwtAuthGuard)
  findAll(@Req() req: Request) {
    const userId = req.user['userId'];
    return this.meetingsService.findAll(userId);
  }

  @Get(':id')
  @UseGuards(JwtAuthGuard)
  findOne(@Param('id') id: string) {
    return this.meetingsService.findOne(+id);
  }

  @Patch(':id')
  @UseGuards(JwtAuthGuard)
  update(
    @Req() req: Request,
    @Param('id') id: string,
    @Body() updateMeetingDto: Prisma.MeetingUpdateInput,
  ) {
    const userId = req.user['userId'];
    return this.meetingsService.update(userId, +id, updateMeetingDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.meetingsService.remove(+id);
  }
}
