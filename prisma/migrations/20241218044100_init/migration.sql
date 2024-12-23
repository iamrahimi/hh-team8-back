/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "user_id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role_id" INTEGER NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "roles" (
    "role_id" SERIAL NOT NULL,
    "role_name" TEXT NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "user_role" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,

    CONSTRAINT "user_role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "projects" (
    "project_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "github_link" TEXT,
    "youtube_link" TEXT,
    "is_public" BOOLEAN NOT NULL,
    "created_by" INTEGER NOT NULL,
    "create_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "projects_pkey" PRIMARY KEY ("project_id")
);

-- CreateTable
CREATE TABLE "comments" (
    "comment_id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "update_at" TIMESTAMP(3) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "project_id" INTEGER NOT NULL,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id")
);

-- CreateTable
CREATE TABLE "likes" (
    "like_id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "constraint" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "project_id" INTEGER NOT NULL,

    CONSTRAINT "likes_pkey" PRIMARY KEY ("like_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "likes_constraint_key" ON "likes"("constraint");

-- AddForeignKey
ALTER TABLE "user_role" ADD CONSTRAINT "user_role_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_role" ADD CONSTRAINT "user_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("project_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("project_id") ON DELETE RESTRICT ON UPDATE CASCADE;
