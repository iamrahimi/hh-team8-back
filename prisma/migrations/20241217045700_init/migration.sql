-- CreateTable
CREATE TABLE "User" (
    "user_id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role_id" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_id")
);
