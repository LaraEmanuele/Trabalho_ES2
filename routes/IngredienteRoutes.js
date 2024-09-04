const express = require('express');
const IngredienteController = require('../controllers/IngredienteController');


class IngredienteRoutes{
    constructor(){
        this.ingredienteController = new IngredienteController();
        this.router = express.Router();
        this.get();
    }

    get(){
    
        this.router.get('/', this.ingredienteController.show.bind(this.ingredienteController));
        
    }

}

module.exports = new IngredienteRoutes().router