//constantes para ejecutar express
const express = require('express')
const app = express();

//configuraciones del servidor 
app.set('port', process.env.PORT || 3000);

//inicializar el servidor
app.listen(app.get('port'), () => {
    console.log('server on port 3000');
});