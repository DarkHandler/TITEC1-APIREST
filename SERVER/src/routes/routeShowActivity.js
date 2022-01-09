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
    		const data = await pool.query('Select codigo_actividad, nombre_actividad, modalidad, area, fecha_inicio FROM all_talleres');
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


router.get('/detalles/:cod', async (req, res) => {
	try{
		const {cod} = req.params;
    		const data = await pool.query('select actividades.codigo_actividad, actividades.rut_responsable, actividades.cupos, actividades.direccion, actividades.nombre_actividad, actividades.estado_actividad, actividades.descripción, actividades.fecha_inicio, actividades.fecha_termino, actividades.modalidad, actividades.requisitos, actividades.area, persona.nombres, persona.apellidos, persona.numero_contacto from actividades join persona on  actividades.codigo_actividad = ? and actividades.rut_responsable=persona.rut',[cod]);
    		const data2 = await pool.query('select correo.correo from correo join actividades on correo.rut=actividades.rut_responsable and actividades.codigo_actividad=?', [cod]);
		for(var z in data){
			var fecha_ini = data[z].fecha_inicio.toISOString().substring(0, 10);
			var fecha_ter = data[z].fecha_termino.toISOString().substring(0, 10);
			if(data[z]){
				data[z]['fecha_inicio'] = fecha_ini;
				data[z]['fecha_termino'] = fecha_ter;
			}
			
		}
		var arrayCorreos = [];
		for (var x in data2){
			arrayCorreos.push(data2[x].correo)
			
		}
		data.map(function(row) {
        			row['correos'] = arrayCorreos;
    			});
		res.send(data);
		
	}catch(ex){
		console.log(ex);
	}
});



module.exports = router;
