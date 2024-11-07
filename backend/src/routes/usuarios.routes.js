const { Router } = require('express');

const { loginUsuarios } = require('../controllers/usuarios.controller');

const router = Router();

router.get('/login', loginUsuarios);

module.exports = router;