const User = require("../models/user");
const jwt = require("jwt-simple");
const config = require("../config/dbconfig");

var functions = {
  addNew: function (req, res) {
    if (!req.body.name || !req.body.password) {
      req.json({ success: false, msg: "Enter all fields" });
    } else {
      var newUser = User({
        name: req.body.name,
        password: req.body.password,
      });
      newUser.save(function (err, newUser) {
        if (err) {
          console.log(err);
          res.json({ success: false, msg: "failed to save" });
        } else {
          res.json({ success: true, msg: "Success saved." });
        }
      });
    }
  },
};

module.exports = functions;
