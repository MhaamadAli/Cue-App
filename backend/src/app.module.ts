import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { MeetingsModule } from './meetings/meetings.module';
import { TasksModule } from './tasks/tasks.module';
import { NotificationsModule } from './notifications/notifications.module';
import { FeedbacksModule } from './feedbacks/feedbacks.module';
import { AuthenticationModule } from './authentication/authentication.module';

@Module({
  imports: [UsersModule, MeetingsModule, TasksModule, NotificationsModule, FeedbacksModule, AuthenticationModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}