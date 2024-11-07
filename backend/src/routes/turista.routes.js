const { Router } = require('express');
const { 
    createTurista,
    getTurista,
    updateTurista
 } = require('../controllers/turista.controller')

const router = Router();

router.get('/getTurista/:idTurista', getTurista);

router.post('/createTurista', createTurista);

router.put('/updateTurista/:idTurista', updateTurista);


module.exports = router