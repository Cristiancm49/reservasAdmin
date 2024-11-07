const { Router } = require('express');
const { createReserva, getReservasPorEstablecimiento, getReservasPorTurista, getReserva } = require('../controllers/reservas.controller');

const router = Router();

router.post('/createReserva', createReserva);

router.get('/reservasPorEstablecimiento/:idEstablecimiento', getReservasPorEstablecimiento);

router.get('/reservasPorTuristas/:idTurista', getReservasPorTurista);

router.get('/reserva/:idReserva', getReserva)


module.exports = router;