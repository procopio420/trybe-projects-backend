const express = require('express');
const app = express();
const db = require('./queries');

app.use(express.json({ limit: '50mb' }));

app.get('/:repository', db.getDuplas);
app.post('/:repository', db.createDupla);
app.post('/create/:repository', db.createTable);

app.listen(8000, () => {
  console.log('Server started!');
});

