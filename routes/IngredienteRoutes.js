const express = require('express');
const IngredienteController = require('../controllers/IngredienteController');


class IngredienteRoutes{
    constructor(){
        this.ingredienteController = new IngredienteController();
        this.router = express.Router();
        this.getAll();
        this.post();
        this.getOne();
        this.patch();
        this.delete();
    }
    //Retorna todos os ingredientes
    getAll(){
    
        this.router.get('/ingrediente', this.ingredienteController.showAll.bind(this.ingredienteController));
        
    }

    //Insere ingrediente
    post(){
        this.router.post('/ingrediente', this.ingredienteController.write.bind(this.ingredienteController));
    }

    //Busca um ingrediente
    getOne(){
        this.router.get('/ingrediente/:id_ingrediente', this.ingredienteController.showOne.bind(this.ingredienteController));
    }

    //Atualiza um ingrediente
    patch(){
        this.router.patch('/ingrediente/:id_ingrediente', this.ingredienteController.update.bind(this.ingredienteController));
    }
    //Exclui um ingrediente
    delete(){
        this.router.delete('/ingrediente', this.ingredienteController.delete.bind(this.ingredienteController));
    }

}

module.exports = new IngredienteRoutes().router