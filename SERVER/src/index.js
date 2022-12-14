const express = require('express');
const app = express();
const path = require('path');
const pool = require('./database');
const morgan = require('morgan');

// Configuración
app.set('port', process.env.PORT || 3002);
app.use(express.json()); //Transfomar a formato JSON 
app.use(morgan('dev')); //para mostrar un determinado tipo de mensaje en consola

// Rutas (URL)
app.use('/api',require('./routes/routeShowActivity.js'));
app.use('/api/images',require('./routes/routeImages.js'));


// Iniciando Servidor
app.listen(app.get('port'), () => {
     console.log('Servidor en puerto ',app.get('port'))
});

