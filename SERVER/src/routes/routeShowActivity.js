const express = require('express');
const router = express.Router();

const pool = require('../database'); // Buscando el archivo de conf de la base de datos

router.get('/personas', async (req, res) => {
	try{
    		const data = await pool.query('Select * FROM persona;');
		console.log(data);
		res.send(data);
	}catch(ex){
		console.log(ex);
	}
});

router.get('/talleres', async (req, res) => {
	try{
    		const data = await pool.query('Select codigo_actividad, nombre_actividad, modalidad, area, fecha_inicio FROM all_talleres;');
		console.log(data);
		console.log("esta es la fecha inicio");
		for(var z in data){
			var fecha_ini = data[z].fecha_inicio.toISOString().substring(0, 10);
			//var fecha_ter = data[z].fecha_termino.toISOString().substring(0, 10);
			if(data[z]){
				data[z]['fecha_inicio'] = fecha_ini;
				//data[z]['fecha_termino'] = fecha_ter;
			}
			
		}
		
		res.send(data);
	}catch(ex){
		console.log(ex);
	}
});



module.exports = router;
