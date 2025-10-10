const express = require('express');
const app = express();
const port = 5000;

app.get('/', (req, res) => {
  res.send('Hello from Node.js running on port 5000!');
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Node.js server listening at http://0.0.0.0:${port}`);
});