const { Router } = require('express');
const { createReserva, getReservasPorEstablecimiento, getReservasPorTurista, getReserva, updateReserva } = require('../controllers/reservas.controller');

const router = Router();

router.post('/createReserva', createReserva);

router.get('/reservasPorEstablecimiento/:idEstablecimiento', getReservasPorEstablecimiento);

router.get('/reservasPorTuristas/:idTurista', getReservasPorTurista);

router.get('/reserva/:idReserva', getReserva);

router.put('/updateReserva/:idReserva', updateReserva);


module.exports = router;