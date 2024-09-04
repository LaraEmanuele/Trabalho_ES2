const http = require('http'); //Importa os protocolos http
const app = require('./app');//Não necessita informar que é um js porque o compilador consegue determinar isso
const port = process.env.PORT || 3000; //Armazena a porta local da máquina
const server = http.createServer(app); //Cria o servidor

server.listen(port);//Identifica qual serciço será procurado