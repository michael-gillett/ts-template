import express from 'express';

const app = express();
const port = 8080;

app.get('/', (_req, res) => {
  res.send('Hi!');
});

app.listen(port, () => {
  console.log(`server started at http://localhost:${port}`);
});
