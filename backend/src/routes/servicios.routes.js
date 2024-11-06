const { Router } = require('express');
const { getAllServicios, getServicio, updateServicio, createServicio } = require('../controllers/servicios.controller')


const router = Router();

router.get('/getservicios', getAllServicios);

router.get('/getservicio/:idServicio', getServicio);

router.post('/createServicio', createServicio);

router.put('/updateServicio/:idServicio', updateServicio);



module.exports = router;