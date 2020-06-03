const Pool = require('pg').Pool;
const fetch = require('node-fetch');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  }
});

const getClassId = async (request, response) => {
  const { class_name } = request.params;

  const getClassIdQuery = `SELECT class_id FROM class WHERE class = '${class_name}'`;

  try {
    const result = await pool.query(getClassIdQuery);
    return response.status(200).json(result.rows[0]);
  } catch (err) {
    return response.status(500).json({ ok: false });
  }
};

const createClass = async (request, response) => {
  const { class_name } = request.body;

  const insertClassQuery = `INSERT INTO class (class) VALUES ($1)`;
  const getClassIdQuery = `SELECT class_id FROM class WHERE class = '${class_name}'`;
  const getClassesAlreadyThereQuery = `SELECT class FROM class WHERE class = '${class_name}'`;

  try {
    const classesAlreadyThere = await pool.query(getClassesAlreadyThereQuery);
    if (classesAlreadyThere.rows.length === 0) {
      await pool.query(insertClassQuery, [class_name]);
    }

    const result = await pool.query(getClassIdQuery);
    return response.status(200).json(result.rows[0]);
  } catch (err) {
    return response.status(500).json({ ok: false });
  }
};

const createRepository = async (request, response) => {
  const {
    project_name,
    repository_url,
    repository_github_id,
    class_id,
  } = request.body;

  const insertRepositoryQuery = `INSERT INTO repository (project_name, repo_url, github_repo_id, class_id) VALUES ($1, $2, $3, $4)`;
  const getRepositoryIdQuery = `SELECT repository_id FROM repository WHERE project_name = '${project_name}'`;
  const getRepositoriesAlreadyThereQuery = `SELECT project_name FROM repository WHERE project_name = '${project_name}'`;

  try {
    const repositoriesAlreadyThere = await pool.query(
      getRepositoriesAlreadyThereQuery,
    );
    if (repositoriesAlreadyThere.rows.length === 0) {
      await pool.query(insertRepositoryQuery, [
        project_name,
        repository_url,
        repository_github_id,
        class_id,
      ]);
    }

    const result = await pool.query(getRepositoryIdQuery);
    return response.status(200).json(result.rows[0]);
  } catch (err) {
    return response.status(500).json({ ok: false });
  }
};

const getCodeReviewPair = async (request, response) => {
  const { repository_id } = request.params;

  const getPairsQuery = `SELECT student1, student2, url_student_2, avatar_student_1, avatar_student_2, reviewers_student_2, code_review_done FROM code_review_pair WHERE repository_id = ${repository_id}`;

  try {
    const result = await pool.query(getPairsQuery);
    return response.status(200).json(result.rows);
  } catch (err) {
    return response.status(500).json({ ok: false });
  }
};

const updateCodeReviewDone = async (request, response) => {
  const { repository_id } = request.params;

  const selectAllPairs = `SELECT * FROM code_review_pair WHERE repository_id = ${repository_id}`;

  const results = await pool.query(selectAllPairs);

  results.rows.forEach(pair => {
    const updateTrueCodeReviewDoneQuery = `UPDATE code_review_pair SET code_review_done = true WHERE student1 = '${pair.student1}' AND student2 = '${pair.student2}' AND repository_id = ${repository_id}`;
    const updateFalseCodeReviewDoneQuery = `UPDATE code_review_pair SET code_review_done = false WHERE student1 = '${pair.student1}' AND student2 = '${pair.student2}' AND repository_id = ${repository_id}`;
    fetch(pair.reviewers_student_2, {
      headers: {
        Authorization: 'token 63c9af36681217adabd04c9eb5ae4d7e466e12b6',
      },
    })
      .then(res => res.json())
      .then(async res => {
        if (res.length) {
          if (res.some(comment => comment.user.login === pair.student1)) {
            await pool.query(updateTrueCodeReviewDoneQuery);
          } else {
            await pool.query(updateFalseCodeReviewDoneQuery);
          }
        } else {
          await pool.query(updateFalseCodeReviewDoneQuery);
        }
      });
  });

  return response.status(200).json(results.rows);
};

const createCodeReviewPair = (request, response) => {
  const { data, repository_id } = request.body;

  const insertPairQuery =
    'INSERT INTO code_review_pair (student1, student2, repository_id, url_student_2, avatar_student_1, avatar_student_2, reviewers_student_2, code_review_done) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)';

  function shuffle(arrayOrdenado) {
    let arrayAleatorio = [];
    for (let i = 0; i < arrayOrdenado.length; i++) {
      let indexAleatorio = Math.floor(Math.random() * arrayOrdenado.length);
      while (
        arrayAleatorio.find(
          elemento => elemento === arrayOrdenado[indexAleatorio],
        )
      ) {
        indexAleatorio = Math.floor(Math.random() * arrayOrdenado.length);
      }
      arrayAleatorio.push(arrayOrdenado[indexAleatorio]);
    }

    return arrayAleatorio;
  }

  let randomStudents = [];
  let thereIsAlonePairs = true;
  while (thereIsAlonePairs) {
    thereIsAlonePairs = false;
    randomStudents = shuffle(data);
    for (let i = 0; i < randomStudents.length; i++) {
      if (data[i] === randomStudents[i]) {
        thereIsAlonePairs = true;
        break;
      }
    }
  }

  try {
    data.forEach(async (student, index) => {
      const student1 = student;
      const student2 = randomStudents[index];
      const getStudents1AlreadyThereQuery = `SELECT student1 FROM code_review_pair WHERE student1 = '${student1.student}' AND repository_id = ${repository_id}`;
      const getStudents2AlreadyThereQuery = `SELECT student2 FROM code_review_pair WHERE student2 = '${student2.student}' AND repository_id = ${repository_id}`;

      const students1AlreadyThere = await pool.query(
        getStudents1AlreadyThereQuery,
      );
      const students2AlreadyThere = await pool.query(
        getStudents2AlreadyThereQuery,
      );
      if (
        !students1AlreadyThere.rows.length &&
        !students2AlreadyThere.rows.length
      ) {
        await pool.query(insertPairQuery, [
          student1.student,
          student2.student,
          repository_id,
          student2.url,
          student1.avatar,
          student2.avatar,
          student2.review_url,
          false,
        ]);
      }
    });

    return response.status(200).json({ ok: true });
  } catch (err) {
    return response.status(500).json({ ok: false });
  }
};

module.exports = {
  getClassId,
  createClass,
  createRepository,
  getCodeReviewPair,
  createCodeReviewPair,
  updateCodeReviewDone,
};
