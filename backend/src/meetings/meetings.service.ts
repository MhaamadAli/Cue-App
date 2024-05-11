import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class MeetingsService {
  constructor(private readonly prismaService: PrismaService) {}
  async create(createMeetingDto: Prisma.MeetingCreateInput) {
    return this.prismaService.meeting.create({
      data: createMeetingDto,
    });
  }

  async findAll(userId: number) {
    return this.prismaService.meeting.findMany({
      where: {
        userId,
      }
    });
  }

  async findOne(id: number) {
    return this.prismaService.meeting.findUnique({
      where: {
        id,
      },
    });
  }

  async update(id: number, updateMeetingDto: Prisma.MeetingUpdateInput) {
    return this.prismaService.meeting.update({
      where: {
        id,
      },
      data: updateMeetingDto,
    });
  }

  remove(id: number) {
    return this.prismaService.meeting.delete({
      where: {
        id,
      },
    });
  }
}
