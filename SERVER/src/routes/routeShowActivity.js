const express = require('express');
const router = express.Router();
var path = require('path');

const pool = require('../database'); // Buscando el archivo de conf de la base de datos

router.get('/personas', async (req, res) => {
	try {
		const data = await pool.query('Select * FROM persona;');
		console.log(data);
		res.send(data);
	} catch (ex) {
		console.log(ex);
	}
});

router.get('/talleres', async (req, res) => {
	try {
		const data = await pool.query('Select codigo_Taller, nombre_taller, modalidad, area, fecha_inicio FROM taller');
		const data2 = await pool.query('Select codigo_Taller, direccion_archivo_taller from direccion_multimedia_taller');

		for (var z in data) {
			var fecha_ini = data[z].fecha_inicio.toISOString().substring(0, 10);
			//var fecha_ter = data[z].fecha_termino.toISOString().substring(0, 10);
			if (data[z]) {
				data[z]['fecha_inicio'] = fecha_ini;
				//data[z]['fecha_termino'] = fecha_ter;
			}
			arrayMultimedia = [];
			for (var h in data2) {
				if (data[z]['codigo_Taller'] == data2[h]['codigo_Taller']) {
					arrayMultimedia.push(data2[h].direccion_archivo_taller);
					data[z]['fotos'] = arrayMultimedia;

				}

			}

			if (arrayMultimedia == '') {
				arrayMultimedia.push("SIN FOTOS");
				data[z]['fotos'] = arrayMultimedia;
			}


		}

		res.send(data);
	} catch (ex) {
		console.log(ex);
	}
});


router.get('/detalles/:cod', async (req, res) => {
	try {
		const { cod } = req.params;
		const data = await pool.query('select a.codigo_actividad, a.rut_responsable, a.cupos, a.direccion, a.nombre_actividad, a.estado_actividad, a.descripción, a.fecha_inicio, a.fecha_termino, a.modalidad, a.requisitos, a.area, a.edad_minima, p.nombres, p.apellidos, p.numero_contacto from actividades as a join persona as p on  a.codigo_actividad = ? and a.rut_responsable=p.rut', [cod]);
		const data2 = await pool.query('select correo.correo from correo join actividades on correo.rut=actividades.rut_responsable and actividades.codigo_actividad=?', [cod]);
		const data3 = await pool.query('Select codigo_actividad, direccion_archivo from direccion_multimedia where codigo_actividad=?', [cod]);
		const data4 = await pool.query('select count(*) as personas_aceptadas from solicitud_deportiva where estado="aceptada" and codigo_actividad=?',[cod]);
		const data5 = await pool.query('select horario from horarios where codigo_actividad=?',[cod]);

		for (var z in data) {
			var fecha_ini = data[z].fecha_inicio.toISOString().substring(0, 10);
			var fecha_ter = data[z].fecha_termino.toISOString().substring(0, 10);
			if (data[z]) {
				data[z]['fecha_inicio'] = fecha_ini;
				data[z]['fecha_termino'] = fecha_ter;
			}
		}

		var arrayCorreos = [];
		for (var x in data2) {
			arrayCorreos.push(data2[x].correo);
		}

		var arrayMultimedia = [];
		for (var x in data3) {
			arrayMultimedia.push(data3[x].direccion_archivo);
		}

		var personas_aceptadas = 0;
		for(var x in data4){
			personas_aceptadas = data4[x].personas_aceptadas;
		}
		
		var arrayHorarios = [];
		for(var x in data5){
			arrayHorarios.push(data5[x].horario);
		}

		if(arrayHorarios == ''){
			arrayHorarios.push("DE MOMENTO, NO HAY HORARIOS DISPONIBLES");
		}

		if (arrayMultimedia == '') {
			arrayMultimedia.push("SIN FOTOS");
		}

		data.map(function (row) {
			row['correos'] = arrayCorreos;
			row['fotos'] = arrayMultimedia;
			row['personas_aceptadas'] = personas_aceptadas;
			row['horarios'] = arrayHorarios;			
		});
		res.send(data);

	} catch (ex) {
		console.log(ex);
	}
});

router.post('/postulacion', async (req, res) => {
	const datos = req.body;
	console.log(datos);
	var resultado = {};
	//necesitamos: persona, direccion, solicitud_deportiva, correo

	// current timestamp in milliseconds
	let ts = Date.now();
	let date_ob = new Date(ts);
	let date = date_ob.getDate();
	let month = date_ob.getMonth() + 1;
	let year = date_ob.getFullYear();

	var fecha_inscripcion = year + "-" + month + "-" + date;

	
	try {
		var rut_existente = await pool.query('select rut_postulante from solicitud_deportiva where rut_postulante=? AND codigo_actividad=?', [datos.rut, datos.codigo_actividad]);
		if(rut_existente.length > 0){
			resultado = {res:"rut postulado"};
			return res.send(resultado);
		}
		var insert_persona = {};
		insert_persona.rut = datos.rut;
		insert_persona.nombres = datos.nombres;
		insert_persona.apellidos = datos.apellidos;
		insert_persona.numero_contacto = datos.numero_contacto_final;
		insert_persona.fecha_nacimiento = datos.fecha_nac;
		insert_persona.prevision = datos.previsionChecked;

		var rut_duplicado = await pool.query('select rut from persona where rut=?', datos.rut);
		if(rut_duplicado.length > 0){
			await pool.query('update persona set ? where rut = ?', [insert_persona, datos.rut]);
		}else{
			await pool.query('insert into persona(rut, nombres, apellidos, numero_contacto, fecha_nacimiento, prevision) values(?,?,?,?,?,?) ',[datos.rut, datos.nombres, datos.apellidos, datos.numero_contacto_final, datos.fecha_nac, datos.previsionChecked]);
		}
	
	} catch (err) {
		return res.status(505).send({errmsj:err.sqlMessage, errno: err.errno});
	}
	//aqui ingresamos correos
	
	try {
		if(datos.arrayCorreos.length>0){
		datos.arrayCorreos.map( async (correo) => {
			var correo_duplicado = await pool.query('select correo from correo where rut=? and correo=?', [datos.rut, correo]);
			if(correo_duplicado.length == 0){
				await pool.query('insert into correo(rut, correo) values(?,?)',[datos.rut, correo]);
			}
	 	});
		}
	 } catch (error) {
		return res.status(505).send({errmsj:err.sqlMessage, errno: err.errno});
	}

	try {
		var direccion_duplicada = await pool.query('select * from direccion where rut = ?', [datos.rut]);
		if(direccion_duplicada.length == 0){
			await pool.query('insert into direccion(rut, localidad, numero, poblacion_o_villa, calle) values(?,?,?,?,?)',[datos.rut, datos.distritoChecked, parseInt(datos.numeroNuevoDepaCasa), datos.poblacion, datos.calle]);
		}
	} catch (error) {
		console.log("error en insert direccion");
		console.log(error);
		resultado = {res:"en insert direccion"};
	}

	try {
		await pool.query('insert into solicitud_deportiva(rut_postulante, codigo_actividad, fecha_inscripcion) values(?,?,?)',[datos.rut, datos.codigo_actividad, fecha_inscripcion]);
	} catch (error) {
		console.log("error en insert solcicitud_deportiva");
		console.log(error);
		resultado = {res:"en insert solcicitud_deportiva"};
	}
	if(resultado!=0){
		resultado = {res: "concretado"};
	}
	res.send(resultado);
});

module.exports = router;

