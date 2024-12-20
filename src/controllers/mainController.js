const mainController = {};
const bcrypt = require('bcryptjs')

const { PrismaClient } = require ("@prisma/client");
const { Public } = require('@prisma/client/runtime/library');
const prisma = new PrismaClient();

 mainController.get = async (req, res) => {

    // const user = await prisma.users.create({data:{
    //     username: "Mickle",
    //     email: "mike@team8.com",
    //     password:"alskjdflkajlaksdfwa8alsa;ldfsas",
    //     role_id:12
    // }})
    password =  await hashPassword('Password')
    return res.json({
        data: 'This is a full stack app!',
        password_hashed: password

    });
};


async function hashPassword(password) {
    const salt = await bcrypt.genSalt(10)
    password = await bcrypt.hash(password, salt)
    console.log(password);
    return password;
}
  

module.exports = mainController;