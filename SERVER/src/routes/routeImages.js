const express = require('express');
const router = express.Router();
var path = require('path');

// '/api/images/.....' 


router.get('/portada-basquet', async (req, res) => {
	try{
		res.sendFile(path.resolve('src/img/basquetbol.jpg'));		
	}catch(ex){
		console.log(ex);
	}
});

router.get('/portada-futbol', async (req, res) => {
	try{
		res.sendFile(path.resolve('src/img/futlbol.jpg'));		
	}catch(ex){
		console.log(ex);
	}
});

router.get('/portada-futbol2', async (req, res) => {
	try{
		res.sendFile(path.resolve('src/img/futbol2.jpg'));		
	}catch(ex){
		console.log(ex);
	}
});

router.get('/portada-natacion', async (req, res) => {
	try{
		res.sendFile(path.resolve('src/img/natacion.jpg'));		
	}catch(ex){
		console.log(ex);
	}
});


//------------------
router.get('/:foto', async (req, res) => {
	const {foto} = req.params;

	console.log();

	try{
		res.sendFile(path.resolve('src/img/'+foto));		
	}catch(ex){
		console.log(ex);
	}
});

module.exports = router;