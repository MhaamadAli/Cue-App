import { Test, TestingModule } from '@nestjs/testing';
import { UsersService } from './users.service';
import { PrismaService } from '../prisma/prisma.service';
import { Role, Prisma } from '@prisma/client';

describe('UsersService', () => {
  let service: UsersService;
  let prisma: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UsersService,
        {
          provide: PrismaService,
          useValue: {
            user: {
              findMany: jest.fn(),
              findUnique: jest.fn(),
              update: jest.fn(),
              delete: jest.fn(),
            },
          },
        },
      ],
    }).compile();

    service = module.get<UsersService>(UsersService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('findAll', () => {
    it('should return an array of users', async () => {
      const result = [
        {
          id: 1,
          username: 'test',
          email: 'test@example.com',
          password_hash: 'hashedpassword',
          role: Role.USER,
        },
      ];
      jest.spyOn(prisma.user, 'findMany').mockResolvedValue(result);

      expect(await service.findAll()).toBe(result);
    });
  });

  describe('findOne', () => {
    it('should return a single user', async () => {
      const result = {
        id: 1,
        username: 'test',
        email: 'test@example.com',
        password_hash: 'hashedpassword',
        role: Role.USER,
        tasks: [],
        meetings: [],
        locations: [],
      };
      jest.spyOn(prisma.user, 'findUnique').mockResolvedValue(result);

      expect(await service.findOne(1)).toBe(result);
    });
  });

  describe('update', () => {
    it('should update a user', async () => {
      const updateUserDto: Prisma.UserUpdateInput = { username: 'updated' };
      const result = {
        id: 1,
        username: 'updated',
        email: 'test@example.com',
        password_hash: 'hashedpassword',
        role: Role.USER,
      };
      jest.spyOn(prisma.user, 'update').mockResolvedValue(result);

      expect(await service.update(1, updateUserDto)).toBe(result);
    });
  });

  describe('remove', () => {
    it('should remove a user', async () => {
      const result = {
        id: 1,
        username: 'test',
        email: 'test@example.com',
        password_hash: 'hashedpassword',
        role: Role.USER,
      };
      jest.spyOn(prisma.user, 'delete').mockResolvedValue(result);

      expect(await service.remove(1)).toBe(result);
    });
  });
});
