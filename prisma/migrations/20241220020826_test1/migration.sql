/*
  Warnings:

  - You are about to drop the column `constraint` on the `likes` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_id]` on the table `likes` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[project_id]` on the table `likes` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `tags` to the `projects` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password_hash` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "likes_constraint_key";

-- AlterTable
ALTER TABLE "comments" ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "likes" DROP COLUMN "constraint",
ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "projects" ADD COLUMN     "tags" TEXT NOT NULL,
ALTER COLUMN "create_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "password",
ADD COLUMN     "password_hash" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "likes_user_id_key" ON "likes"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "likes_project_id_key" ON "likes"("project_id");
