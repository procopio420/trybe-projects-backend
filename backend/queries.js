const Pool = require('pg').Pool;
const pool = new Pool({
  user: 'qfljtqnxswvymy',
  host: 'ec2-54-81-37-115.compute-1.amazonaws.com',
  database: 'dembn23rtham5b',
  password: '55c8f2f1b3db6d8db643999dbe15e1658c9e806a3e60b43ebdb59df3ada8a252',
  port: 5432,
  ssl: { rejectUnauthorized: false }
});

const getDuplas = (request, response) => {
  const { repository } = request.params;
  try {
    pool.query(`SELECT * FROM sd${repository}`, (error, results) => {
      if (error) {
        throw error;
      }
      return response.status(200).json(results.rows);
    });
  } catch (err) {
    console.log(err);
    return response.status(500);
  }
};

const createDupla = (request, response) => {
  const nomes = request.body;
  const { repository } = request.params;
  function shuffle(arrayOrdenado) {
    console.log('SHUFFLING...');
    let arrayAleatorio = [];
    for (let i = 0; i < arrayOrdenado.length; i++) {
      let indexAleatorio = Math.floor(Math.random() * arrayOrdenado.length);
      while (
        arrayAleatorio.find(
          (elemento) => elemento === arrayOrdenado[indexAleatorio]
        )
      ) {
        indexAleatorio = Math.floor(Math.random() * arrayOrdenado.length);
      }
      arrayAleatorio.push(arrayOrdenado[indexAleatorio]);
    }

    return arrayAleatorio;
  }
  let duplas = [];
  let flag = false;
  while (!flag) {
    console.log('VALIDATING...');
    flag = true;
    duplas = shuffle(nomes);
    for (let i = 0; i < duplas.length; i++) {
      if (nomes[i] === duplas[i]) {
        flag = false;
      }
    }
  }

  try {
    pool.query(
      `SELECT * FROM sd${repository}`,
      (errorDuplasExistentes, resultsDuplasExistentes) => {
        if (errorDuplasExistentes) {
          throw errorDuplasExistentes;
        }
        const nomesQueJaForam = resultsDuplasExistentes.rows.map(
          (dupla) => dupla.dupla1
        );
        nomes.forEach((nome, index) => {
          if (
            !nomesQueJaForam.find((n) => n === nome) &&
            !nomesQueJaForam.find((n) => n === duplas[index])
          ) {
            pool.query(
              `INSERT INTO sd${repository} (dupla1, dupla2) VALUES ($1, $2)`,
              [nome, duplas[index]],
              (error, results) => {
                if (error) {
                  throw error;
                }
                console.log('> ', index + 1, ' - POSTING...');
                console.log(results.rows);
              }
            );
          }
        });
      }
    );
    return response.status(200).json({ ok: true });
  } catch (err) {
    console.log(err);
    return response.status(500);
  }
};

const createTable = async (request, response) => {
  const { repository } = request.params;
  try {
    await pool.query(
      `CREATE TABLE sd${repository}(dupla1 VARCHAR (255) NOT NULL,dupla2 VARCHAR (255) NOT NULL)`
    );
    return response.status(200).json({ ok: true });
  } catch (err) {
    if (err.code === '42P07') {
      response.status(500);
    } else {
      console.log(err);
      return response.status(500);
    }
  }
};

module.exports = {
  getDuplas,
  createTable,
  createDupla,
};
