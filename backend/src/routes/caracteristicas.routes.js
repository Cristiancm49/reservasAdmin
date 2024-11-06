const { Router } = require('express');
const { getAllCategorias,getAllmPagos, getAllTiposDocumentos, getAllMunicipios } = require('../controllers/caracteristicas.controller')

const router = Router();

router.get('/getCategorias', getAllCategorias);

router.get('/getMetodoPagos', getAllmPagos);

router.get('/getTipoDocumentos', getAllTiposDocumentos);

router.get('/getMunicipios', getAllMunicipios);

module.exports = router;