const express = require('express');
const cors = require('cors');
const app = express();
const db = require('./queries');

app.use(cors());
app.use(express.json({ limit: '50mb' }));

app.get('/getClassId/:class_name', db.getClassId)
app.get('/:repository_id', db.getCodeReviewPair);

app.post('/createClass', db.createClass);
app.post('/createRepository', db.createRepository);
app.post('/createPair', db.createCodeReviewPair);

app.listen(process.env.PORT || 8000, () => {
  console.log('Server started!');
});
