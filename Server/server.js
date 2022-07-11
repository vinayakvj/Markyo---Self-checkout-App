const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const connectDb = require("./config/db");
const passport = require("passport");
const bodyparser = require("body-parser");
const { application } = require("express");
const routes = require("./routes/route");

connectDb();

const app = express();

app.use(cors());
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());
app.use(routes);

if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

const PORT = process.env.PORT || 3000;

app.listen(PORT, console.log("server started at 3000"));
