const { Router } = require('express');

const { 
    loginUsuarios, 
    updateUsuario,
    createUsuario
 } = require('../controllers/usuarios.controller');


const router = Router();

router.get('/login', loginUsuarios);

router.put('/editPassword/:idUsuario', updateUsuario);

router.post('/createUsuario', createUsuario)

module.exports = router;