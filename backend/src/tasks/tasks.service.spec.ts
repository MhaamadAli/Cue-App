import { Test, TestingModule } from '@nestjs/testing';
import { TasksService } from './tasks.service';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';

describe('TasksService', () => {
  let service: TasksService;
  let prisma: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        TasksService,
        {
          provide: PrismaService,
          useValue: {
            task: {
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

    service = module.get<TasksService>(TasksService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('create', () => {
    it('should create a task', async () => {
      const createTaskDto: Prisma.TaskCreateInput = {
        title: 'Test task',
        user: {
          connect: { id: 1 },
        },
      };
      const result = { id: 1, ...createTaskDto, userId: 1 };
      jest.spyOn(prisma.task, 'create').mockResolvedValue(result as any);

      expect(await service.create(createTaskDto)).toBe(result);
    });
  });

});
