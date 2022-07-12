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
  authenticate: function (req, res) {
    User.findOne(
      {
        name: req.body.name,
      },
      function (err, user) {
        if (err) throw err;
        if (!user) {
          res.status(403).send({ success: false, msg: "Auth failed" });
        } else {
          user.comparePassword(req.body.password, function (err, isMatch) {
            if (isMatch && !err) {
              var token = jwt.encode(user, config.secret);
              res.json({ success: true, token: token });
            } else {
              return res
                .status(403)
                .send({ success: false, msg: "auth failed" });
            }
          });
        }
      }
    );
  },
};

module.exports = functions;
