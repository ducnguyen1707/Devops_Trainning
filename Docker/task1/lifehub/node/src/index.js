const express = require('express');
const app = express();



app.get('/', (req, res) => {
  res.send(`Hello from Node.js running on port ${process.env.NODE_PORT}`);
});

app.listen(process.env.NODE_PORT, () => {
  console.log(`Listen on port: ${process.env.NODE_PORT}`); // listen on port 5000
});