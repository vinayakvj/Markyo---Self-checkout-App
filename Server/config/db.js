const mongoose = require("mongoose");
const dbconfig = require("./dbconfig");

const connectDb = async () => {
  try {
    const conn = await mongoose.connect(dbconfig.database);
    console.log("mongo Connected.");
  } catch (err) {
    console.log(err);
    process.exit(1);
  }
};

module.exports = connectDb;
