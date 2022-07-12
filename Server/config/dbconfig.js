const dotenv = require("dotenv");

dotenv.config();

module.exports = {
  secret: "yoursecret",
  database: `mongodb+srv://${process.env.DB_USER}:${process.env.DB_PASS}@cluster0.3ktlj.mongodb.net/?retryWrites=true&w=majority`,
};
