const express = require("express");
const router = express.Router();

const empleadosControlador = require('../controllers/empleadosControlador');


router.get('/', empleadosControlador.list);
router.post('/add', empleadosControlador.save);
router.get('/delete/:id', empleadosControlador.delete);

module.exports = router;