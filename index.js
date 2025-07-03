const express = require('express');
const app = express();

const port = process.env.PORT || 5000;


app.get('/node', (req, res) => {
  res.send('Hello from node app update from pipline ');
});

// Start the server and listen on all network interfaces
app.listen(port, '0.0.0.0', () => {
  console.log(`App listening on port ${port}`);
});
