import { Test, TestingModule } from '@nestjs/testing';
import { TasksController } from './tasks.controller';
import { TasksService } from './tasks.service';
import { JwtAuthGuard } from '../authentication/auth.guard';
import { Prisma } from '@prisma/client';

describe('TasksController', () => {
  let controller: TasksController;
  let service: TasksService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TasksController],
      providers: [
        {
          provide: TasksService,
          useValue: {
            create: jest.fn(),
            findAll: jest.fn(),
            getNotDone: jest.fn(),
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

    controller = module.get<TasksController>(TasksController);
    service = module.get<TasksService>(TasksService);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  describe('create', () => {
    it('should create a task', async () => {
      const createTaskDto: Prisma.TaskCreateInput = {
        title: 'Test task',
        user: {
          connect: { id: 1 },
        },
      };
      const result = { id: 1, ...createTaskDto, userId: 1, locationId: null };
      jest.spyOn(service, 'create').mockResolvedValue(result as any);

      expect(await controller.create(createTaskDto)).toBe(result);
    });
  });

  describe('findAll', () => {
    it('should return an array of tasks', async () => {
      const result = [
        { id: 1, title: 'Test task', userId: 1, locationId: null },
      ];
      jest.spyOn(service, 'findAll').mockResolvedValue(result as any);

      expect(await controller.findAll({ user: { userId: 1 } } as any)).toBe(
        result,
      );
    });
  });

  describe('getNotDone', () => {
    it('should return an array of tasks that are not done', async () => {
      const result = [
        {
          id: 1,
          title: 'Test task',
          userId: 1,
          isChecked: false,
          locationId: null,
        },
      ];
      jest.spyOn(service, 'getNotDone').mockResolvedValue(result as any);

      expect(await controller.getNotDone({ user: { userId: 1 } } as any)).toBe(
        result,
      );
    });
  });
});
