/*
  Warnings:

  - You are about to drop the column `end_datetime` on the `Meeting` table. All the data in the column will be lost.
  - You are about to drop the column `start_datetime` on the `Meeting` table. All the data in the column will be lost.
  - Added the required column `date` to the `Meeting` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Meeting" DROP COLUMN "end_datetime",
DROP COLUMN "start_datetime",
ADD COLUMN     "date" TIMESTAMP(3) NOT NULL;
