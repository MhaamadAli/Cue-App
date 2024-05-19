import { Test, TestingModule } from '@nestjs/testing';
import { MeetingsService } from './meetings.service';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';

describe('MeetingsService', () => {
  let service: MeetingsService;
  let prisma: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        MeetingsService,
        {
          provide: PrismaService,
          useValue: {
            meeting: {
              create: jest.fn(),
              findMany: jest.fn(),
              findUnique: jest.fn(),
              update: jest.fn(),
              delete: jest.fn(),
            },
          },
        },
      ],
    }).compile();

    service = module.get<MeetingsService>(MeetingsService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
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
      jest.spyOn(prisma.meeting, 'create').mockResolvedValue(result as any);

      expect(await service.create(createMeetingDto)).toBe(result);
    });
  });
describe('findAll', () => {
  it('should return an array of meetings', async () => {
    const result = [{ id: 1, title: 'Test meeting', userId: 1 }];
    jest.spyOn(prisma.meeting, 'findMany').mockResolvedValue(result as any);

    expect(await service.findAll(1)).toBe(result);
  });
});

describe('findOne', () => {
  it('should return a single meeting', async () => {
    const result = { id: 1, title: 'Test meeting', userId: 1 };
    jest.spyOn(prisma.meeting, 'findUnique').mockResolvedValue(result as any);

    expect(await service.findOne(1)).toBe(result);
  });
});
describe('update', () => {
  it('should update a meeting', async () => {
    const updateMeetingDto: Prisma.MeetingUpdateInput = {
      title: 'Updated meeting',
    };
    const result = { id: 1, title: 'Updated meeting', userId: 1 };
    jest.spyOn(prisma.meeting, 'update').mockResolvedValue(result as any);

    expect(await service.update(1, 1, updateMeetingDto)).toBe(result);
  });
});

describe('remove', () => {
  it('should remove a meeting', async () => {
    const result = { id: 1, title: 'Test meeting', userId: 1 };
    jest.spyOn(prisma.meeting, 'delete').mockResolvedValue(result as any);

    expect(await service.remove(1)).toBe(result);
  });
});

});
