import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from '../users/users.service';
import { PrismaService } from '../prisma/prisma.service';
import * as bcrypt from 'bcrypt';
import { Prisma } from '@prisma/client';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
    private prismaService: PrismaService,
  ) {}

  async validateUser(email: string, password: string): Promise<any> {
    try {
      const user = await this.prismaService.user.findUnique({
        where: { email },
      });
      if (user && (await bcrypt.compare(password, user.password_hash))) {
        const { password_hash, ...result } = user;
        return result;
      }
      return null;
    } catch (error) {
      console.error('Error validating user:', error);
      return null;
    }
  }

  async create(createUserDto: Prisma.UserCreateInput) {
    const hashedPassword = await bcrypt.hash(createUserDto.password_hash, 10);
    const userWithHashedPassword = {
      ...createUserDto,
      password_hash: hashedPassword,
    };

    return this.prismaService.user.create({
      data: userWithHashedPassword,
    });
  }
}
