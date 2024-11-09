const { Router } = require('express');
const { 
    getAllCategorias,
    getAllmPagos, 
    getAllTiposDocumentos, 
    getAllMunicipios, 
    getAllAuditoriaResevas, 
    getAllPromociones, 
    getAllTiposServicios
    
} = require('../controllers/caracteristicas.controller')

const router = Router();

router.get('/getCategorias', getAllCategorias);

router.get('/getMetodoPagos', getAllmPagos);

router.get('/getTipoDocumentos', getAllTiposDocumentos);

router.get('/getMunicipios', getAllMunicipios);

router.get('/getAllAuditoria', getAllAuditoriaResevas);

router.get('/getPromociones', getAllPromociones);

router.get('/getTipos', getAllTiposServicios);
module.exports = router;