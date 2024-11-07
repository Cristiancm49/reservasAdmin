const { Router } = require('express')
const { 
    createEstablecimiento, 
    getEstablecimiento, 
    updateEstablecimiento
 } = require('../controllers/establecimientos.controller');


 const routes = Router();

 routes.get('/getEstablecimiento/:idEstablecimiento', getEstablecimiento);

 routes.post('/createEstablecimiento', createEstablecimiento);

 routes.put('/updateEstablecimiento/:idEstablecimiento', updateEstablecimiento);

 module.exports = routes;

