const express = require('express');
const router = express.Router();

const IngredienteController = require('../controllers/IngredienteController');

router.get('/', IngredienteController.getIngredientes);

module.exports = router;//Informa que ao chamar esse arquivo o módulo é exportado