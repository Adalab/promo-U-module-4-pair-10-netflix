CREATE DATABASE netflix;

USE netflix;

CREATE TABLE
    movies(
        idMovies int not null AUTO_INCREMENT primary key,
        title varchar(45) not null,
        genre varchar(45) not null,
        image varchar(1000) not null,
        category varchar(45) not null,
        year int
    );

CREATE TABLE
    users(
        idUser int not null AUTO_INCREMENT primary key,
        user varchar(45) not null,
        password varchar(45) not null,
        name varchar(45) not null,
        email varchar(45) not null,
        plan_details varchar(45) not null
    );

CREATE TABLE
    actors(
        idActor int not null AUTO_INCREMENT primary key,
        name varchar(45) not null,
        lastname varchar(45) not null,
        country varchar(45) not null,
        birthday date
    );

INSERT INTO
    movies (
        title,
        genre,
        image,
        category,
        year
    )
VALUES (
        'Pulp Fiction',
        'Crimen',
        'https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg',
        'Top 10',
        '1994'
    ), (
        'La vita è bella',
        'Comedia',
        'https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg',
        'Top 10',
        '1996'
    ), (
        'Forrest Gump',
        'Comedia',
        'https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg',
        'Top 10',
        '1994'
    ), (
        'Oppenheimer',
        'Biográfico',
        'https://www.filmaffinity.com/es/film294474.html',
        'Top 10',
        '2023'
    );

INSERT INTO
    users (
        idUser,
        user,
        password,
        name,
        email,
        plan_details
    )
VALUES (
        'laura_dev',
        'laura',
        'Laura',
        'laura@gmail.com',
        'Standard'
    ), (
        'maria_dev',
        'maria',
        'Maria',
        'maria@gmail.com',
        'Standard'
    ), (
        'ester_dev',
        'ester',
        'Ester',
        'ester@gmail.com',
        'Standard'
    ), (
        'diana_dev',
        'diana',
        'Diana',
        'diana@gmail.com',
        'Standard'
    ), (
        'rachel_dev',
        'rachel',
        'Rachel',
        'rachel@gmail.com',
        'Standard'
    );

INSERT INTO
    actors (
        idActor,
        name,
        lastname,
        country,
        birthday
    )
VALUES (
        'Tom',
        'Hanks',
        'Estados Unidos',
        '1956-07-09'
    ), (
        'Roberto',
        'Benigni',
        'Italia',
        '1952-10-27'
    ), (
        'John',
        'Travolta',
        'Estados Unidos',
        '1954-02-18'
    ), (
        'Cillian ',
        'Murphy',
        'Irlanda',
        '1976-05-25'
    );

USE netflix;

-- para ver movies:

SELECT * FROM movies;

SELECT title, genre FROM movies WHERE year>1995;

SELECT * FROM movies WHERE category='Top 10';

UPDATE movies SET year=1997 WHERE title='La vita è bella';

SELECT
    name,
    lastname,
    birthday
FROM actors
WHERE
    birthday BETWEEN '1950-01-01' AND '1960-01-01';

SELECT name, lastname FROM actors WHERE country='Estados Unidos';

SELECT * FROM users WHERE plan_details='Standard';

DELETE FROM users WHERE user like 'M%';

-- para ver users:

SELECT * FROM users;

-- Modificado por Diana // Bonus del viernes pasado:

UPDATE movies
SET
    image = 'https://pics.filmaffinity.com/oppenheimer-828933592-mmed.jpg'
WHERE title = 'Oppenheimer';

ALTER TABLE actors ADD COLUMN imgActor varchar(1000);

-- UPDATE en lugar de INSERT INTO porque INSERT INTO crearía una fila nueva y lo que queremos es modificar las filas que ya hay /!\

UPDATE actors
SET
    imgActor = 'https://pics.filmaffinity.com/tom_hanks-217077860751094-nm_200.jpg'
WHERE
    name = 'Tom'
    AND lastname = 'Hanks';

UPDATE actors
SET
    imgActor = 'https://pics.filmaffinity.com/roberto_benigni-191379476823315-nm_200.jpg'
WHERE
    name = 'Roberto'
    AND lastname = 'Benigni';

UPDATE actors
SET
    imgActor = 'https://pics.filmaffinity.com/john_travolta-215026180777265-nm_200.jpg'
WHERE
    name = 'John'
    AND lastname = 'Travolta';

UPDATE actors
SET
    imgActor = 'https://pics.filmaffinity.com/cillian_murphy-117743568573693-nm_200.jpg'
WHERE
    name = 'Cillian'
    AND lastname = 'Murphy';

-- para ver actors:

SELECT * FROM actors;

UPDATE actors SET name='Cillian' WHERE name='Cillian ';

-- (Había un espacio después de Cillian y no me cogía la imagen)

-- del día 30 de octubre: 4.3 Diagramas y relaciones MySQL

SELECT * FROM netflix.users;

SELECT
    users.idUser,
    users.name,
    movies.idMovies,
    movies.title
FROM users
    INNER JOIN users_has_movies ON users.idUser = users_has_movies.users_idUser
    INNER JOIN movies ON movies.idMovies = users_has_movies.movies_idMovies;