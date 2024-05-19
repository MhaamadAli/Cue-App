import { Test, TestingModule } from '@nestjs/testing';
import { MeetingsController } from './meetings.controller';
import { MeetingsService } from './meetings.service';
import { Prisma } from '@prisma/client';
import { JwtAuthGuard } from '../authentication/auth.guard';

describe('MeetingsController', () => {
  let controller: MeetingsController;
  let service: MeetingsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [MeetingsController],
      providers: [
        {
          provide: MeetingsService,
          useValue: {
            create: jest.fn(),
            findAll: jest.fn(),
            findOne: jest.fn(),
            update: jest.fn(),
            remove: jest.fn(),
          },
        },
      ],
    })
      .overrideGuard(JwtAuthGuard)
      .useValue({
        canActivate: jest.fn(() => true),
      })
      .compile();

    controller = module.get<MeetingsController>(MeetingsController);
    service = module.get<MeetingsService>(MeetingsService);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
