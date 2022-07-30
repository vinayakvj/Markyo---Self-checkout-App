const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const connectDb = require("./config/db");
const passport = require("passport");
const bodyparser = require("body-parser");
const { application } = require("express");
const routes = require("./routes/route");

const dotenv = require("dotenv");

dotenv.config();

connectDb();

const app = express();

app.use(cors());
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());
app.use(routes);

if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

app.listen(process.env.PORT || 3000, function () {
  console.log(
    "Express server listening on port %d in %s mode",
    this.address().port,
    app.settings.env
  );
});
