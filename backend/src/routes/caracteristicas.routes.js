const { Router } = require('express');
const { 
    getAllCategorias,
    getAllmPagos, 
    getAllTiposDocumentos, 
    getAllMunicipios, 
    getAllAuditoriaResevas 
} = require('../controllers/caracteristicas.controller')

const router = Router();

router.get('/getCategorias', getAllCategorias);

router.get('/getMetodoPagos', getAllmPagos);

router.get('/getTipoDocumentos', getAllTiposDocumentos);

router.get('/getMunicipios', getAllMunicipios);

router.get('/getAllAuditoria', getAllAuditoriaResevas)

module.exports = router;