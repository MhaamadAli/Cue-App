/*
  Warnings:

  - You are about to drop the column `due_datetime` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `Task` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "BannerColor" AS ENUM ('RED', 'ORANGE', 'GREEN');

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "due_datetime",
DROP COLUMN "status",
ADD COLUMN     "bannerColor" "BannerColor" NOT NULL DEFAULT 'ORANGE',
ADD COLUMN     "isChecked" BOOLEAN NOT NULL DEFAULT false;
