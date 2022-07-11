const express = require("express");
const router = express.Router();
const actions = require("../methods/actions");

router.get("/", (req, res) => {
  res.send("Hello world");
});

router.get("/dash", (req, res) => {
  res.send("Dash");
});

router.post("/addUser", actions.addNew);

module.exports = router;
