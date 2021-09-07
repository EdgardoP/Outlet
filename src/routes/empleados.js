const express = require("express");
const router = express.Router();

const empleadosControlaor = require('../controllers/empleadosControlador');


router.get('/', empleadosControlaor.list)

module.exports = router;