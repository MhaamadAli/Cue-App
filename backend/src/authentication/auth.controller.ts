import {
  Controller,
  Post,
  Body,
  HttpCode,
  HttpStatus,
  UnauthorizedException,
  HttpException,
} from '@nestjs/common';
import { AuthService } from './authentication.service';
import { Prisma } from '@prisma/client';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('signup')
  @HttpCode(HttpStatus.OK)
  async create(@Body() createUserDto: Prisma.UserCreateInput) {
    const result = await this.authService.create(createUserDto);
    if (!result) {
      throw new HttpException('Signup failed', HttpStatus.BAD_REQUEST);
    }
    return result;
  }

  @Post('login')
  @HttpCode(HttpStatus.OK)
  async login(@Body() body: { email: string; password: string }) {
    const user = await this.authService.validateUser(body.email, body.password);
    if (!user) {
      throw new UnauthorizedException('Invalid email or password');
    }
    return this.authService.login(user);
  }
}
