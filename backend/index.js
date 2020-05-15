const express = require('express');
const cors = require('cors');
const app = express();
const db = require('./queries');

app.use(cors());
app.use(express.json({ limit: '50mb' }));

app.get('/:repository', db.getDuplas);
app.post('/:repository', db.createDupla);
app.post('/create/:repository', db.createTable);

app.listen(process.env.PORT || 8000, () => {
  console.log('Server started!');
});
