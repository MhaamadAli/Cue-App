import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class TasksService {
  constructor(private readonly prismaService: PrismaService) {}

  async create(createTaskDto: Prisma.TaskCreateInput) {
    return this.prismaService.task.create({
      data: createTaskDto,
    });
  }

  async findAll(userId: number) {
    return this.prismaService.task.findMany({
      where: {
        userId,
      },
    });
  }

  async findOne(id: number) {
    return this.prismaService.task.findUnique({
      where: {
        id,
      },
    });
  }

  async update(id: number, updateTaskDto: Prisma.TaskUpdateInput) {
    return this.prismaService.task.update({
      where: {
        id,
      },
      data: updateTaskDto,
    });
  }

  remove(id: number) {
    return this.prismaService.task.delete({
      where: {
        id,
      },
    });
  }
}
