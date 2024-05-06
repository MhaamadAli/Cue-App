import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { MeetingsModule } from './meetings/meetings.module';
import { TasksModule } from './tasks/tasks.module';
import { NotificationsModule } from './notifications/notifications.module';
import { FeedbacksModule } from './feedbacks/feedbacks.module';
import { AuthenticationModule } from './authentication/authentication.module';
import { PrismaService } from './prisma/prisma.service';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [
    UsersModule,
    MeetingsModule,
    TasksModule,
    NotificationsModule,
    FeedbacksModule,
    AuthenticationModule,
    PrismaModule,
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
