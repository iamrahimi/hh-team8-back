const { PORT = 8000 } = process.env;
const app = require("./app");

// require('./db/connect');

const connectDB = require("./db/connect");

connectDB(); // This will execute the connection string to connect to the database.

const listener = () => console.log(`Listening on Port ${PORT}!`);
app.listen(PORT, listener);