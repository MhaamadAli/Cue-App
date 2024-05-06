import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class UsersService {
  constructor(private readonly prismaService: PrismaService) {}
  async create(createUserDto: Prisma.UserCreateInput) {
    return this.prismaService.user.create({
      data: createUserDto,
    });
  }

  async findAll() {
    return this.prismaService.user.findMany({});
  }

  async findOne(id: number) {
    return this.prismaService.user.findUnique({
      where: {
        id,
      }
    })
  }

  async update(id: number, updateUserDto: Prisma.UserUpdateInput) {
    return this.prismaService.user.update({
      where: {
        id,
      },
      data: updateUserDto,
    });
  }

  remove(id: number) {
    return this.prismaService.user.delete({
      where: {
        id,
      }
    });
  }
}
