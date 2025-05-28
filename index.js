const express = require('express');
const app = express();

const port = process.env.PORT || 5000;


app.get('/', (req, res) => {
  res.send('Hello from Hassan , i am intern at YAP PAKISTAN ');
});

// Start the server and listen on all network interfaces
app.listen(port, '0.0.0.0', () => {
  console.log(`App listening on port ${port}`);
});
