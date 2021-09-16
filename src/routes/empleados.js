const express = require("express");
const router = express.Router();

const empleadosControlador = require('../controllers/empleadosControlador');


router.get('/empleados', empleadosControlador.list);
router.post('/add', empleadosControlador.save);
router.get('/delete/:id', empleadosControlador.delete);

router.get('/update/:id', empleadosControlador.edit)
router.post('/update/:id', empleadosControlador.update)
module.exports = router;