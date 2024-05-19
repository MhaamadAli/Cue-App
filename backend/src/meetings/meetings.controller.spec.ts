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
  
  describe('create', () => {
    it('should create a meeting', async () => {
      const createMeetingDto: Prisma.MeetingCreateInput = {
        title: 'Test meeting',
        user: {
          connect: { id: 1 },
        },
      };
      const result = { id: 1, ...createMeetingDto, userId: 1 };
      jest.spyOn(service, 'create').mockResolvedValue(result as any);

      expect(await controller.create(createMeetingDto)).toBe(result);
    });
  });

});
