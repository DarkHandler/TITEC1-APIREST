const express = require('express');
const router = express.Router();
var path = require('path');

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
    	const data2 = await pool.query('Select codigo_actividad, direccion_archivo from direccion_multimedia');
    	
		for(var z in data){
			var fecha_ini = data[z].fecha_inicio.toISOString().substring(0, 10);
			//var fecha_ter = data[z].fecha_termino.toISOString().substring(0, 10);
			if(data[z]){
				data[z]['fecha_inicio'] = fecha_ini;
				//data[z]['fecha_termino'] = fecha_ter;
			}
			arrayMultimedia = [];
			for(var h in data2){
				if(data[z]['codigo_actividad']==data2[h]['codigo_actividad']){
					arrayMultimedia.push(data2[h].direccion_archivo);
					data[z]['fotos'] = arrayMultimedia;

				}

			}

			if(arrayMultimedia==''){
				arrayMultimedia.push("SIN FOTOS");
				data[z]['fotos']= arrayMultimedia;
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
    		const data = await pool.query('select a.codigo_actividad, a.rut_responsable, a.cupos, a.direccion, a.nombre_actividad, a.estado_actividad, a.descripción, a.fecha_inicio, a.fecha_termino, a.modalidad, a.requisitos, a.area, p.nombres, p.apellidos, p.numero_contacto from actividades as a join persona as p on  a.codigo_actividad = ? and a.rut_responsable=p.rut',[cod]);
    		const data2 = await pool.query('select correo.correo from correo join actividades on correo.rut=actividades.rut_responsable and actividades.codigo_actividad=?', [cod]);
			const data3 = await pool.query('Select codigo_actividad, direccion_archivo from direccion_multimedia where codigo_actividad=?',[cod]);
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
			arrayCorreos.push(data2[x].correo);
		}

		var arrayMultimedia = [];
		for (var x in data3){
			arrayMultimedia.push(data3[x].direccion_archivo);
		}
		if(arrayMultimedia == ''){
			arrayMultimedia.push("SIN FOTOS");
		}

		data.map(function(row) {
        			row['correos'] = arrayCorreos;
					row['fotos'] = arrayMultimedia;
    			});
		res.send(data);
		
	}catch(ex){
		console.log(ex);
	}
});


module.exports = router;

