import { Module } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';
import { AuthenticationService } from './authentication.service';

@Module({
  imports: [PassportModule],
  providers: [AuthenticationService],
  exports: [AuthenticationService],
})
export class AuthenticationModule {}
