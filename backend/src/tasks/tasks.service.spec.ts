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

  describe('findAll', () => {
    it('should return an array of tasks', async () => {
      const result = [{ id: 1, title: 'Test task', userId: 1 }];
      jest.spyOn(prisma.task, 'findMany').mockResolvedValue(result as any);

      expect(await service.findAll(1)).toBe(result);
    });
  });

  describe('getNotDone', () => {
    it('should return an array of tasks that are not done', async () => {
      const result = [
        { id: 1, title: 'Test task', userId: 1, isChecked: false },
      ];
      jest.spyOn(prisma.task, 'findMany').mockResolvedValue(result as any);

      expect(await service.getNotDone(1)).toBe(result);
    });
  });
  describe('findOne', () => {
    it('should return a single task', async () => {
      const result = { id: 1, title: 'Test task', userId: 1 };
      jest.spyOn(prisma.task, 'findUnique').mockResolvedValue(result as any);

      expect(await service.findOne(1)).toBe(result);
    });
  });

  describe('update', () => {
    it('should update a task', async () => {
      const updateTaskDto: Prisma.TaskUpdateInput = { title: 'Updated task' };
      const result = { id: 1, title: 'Updated task', userId: 1 };
      jest.spyOn(prisma.task, 'update').mockResolvedValue(result as any);

      expect(await service.update(1, 1, updateTaskDto)).toBe(result);
    });
  });

  describe('remove', () => {
    it('should remove a task', async () => {
      const result = { id: 1, title: 'Test task', userId: 1 };
      jest.spyOn(prisma.task, 'delete').mockResolvedValue(result as any);

      expect(await service.remove(1)).toBe(result);
    });
  });
});
