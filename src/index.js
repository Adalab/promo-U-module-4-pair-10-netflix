const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

// create and config server
const server = express();
server.use(cors());
server.use(express.json({ limit: '25mb' }));

// conexión a la base de datos
async function getConnection() {
  const connection = await mysql.createConnection({
    host: 'sql.freedb.tech',
    user: 'freedb_pairAdmin',
    password: '3@3V@qU322p$?fJ',
    database: 'freedb_pairNetflix',
  });

  connection.connect;
  return connection;
}

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

server.get('/movies', async (req, res) => {
  // (req, res): Require: para cuando envíen datos | Response: enviar desde el server datos al front
  const genreFilterParam = req.query.genre;
  const sortFilterParam = req.query.sort;
  let queryMovies = '';

  // obtener los datos de la bbdd
  // 1.- obtener la conexión
  const conn = await getConnection();
  // 2.- consulta de la bbdd: obtener todas las alumnas
  if (genreFilterParam === '') {
    queryMovies = 'SELECT * FROM movies';
  } else if (genreFilterParam === 'Biográfico') {
    queryMovies = "SELECT * FROM movies WHERE genre='Biográfico'";
  } else if (genreFilterParam === 'Crimen') {
    queryMovies = "SELECT * FROM movies WHERE genre='Crimen'";
  } else if (genreFilterParam === 'Comedia') {
    queryMovies = "SELECT * FROM movies WHERE genre='Comedia'";
  }

  if (sortFilterParam === 'asc') {
    queryMovies = 'SELECT * FROM movies order by title asc';
  } else if (sortFilterParam === 'desc') {
    queryMovies = 'SELECT * FROM movies order by title desc';
  }

  // 3.- ejecutar la consulta
  const [results] = await conn.query(queryMovies);
  // [results] <- con [] porque de todo lo que trae, dame solo los resultados
  console.log(results);
  /* res.json(results); */
  console.log('genre: ' + req.query.genre);
  res.json({
    success: true,
    movies: results,
  });
});

//servidor de estáticos
const pathServerStatic = './public_html';
server.use(express.static(pathServerStatic));
