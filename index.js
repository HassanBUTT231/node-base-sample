const express = require('express');
const app = express();

const port = process.env.PORT || 3000;


app.get('/', (req, res) => {
  res.send('Hello from Hassan , i am doing at jenkins');
});

// Start the server and listen on all network interfaces
app.listen(port, '0.0.0.0', () => {
  console.log(`App listening on port ${port}`);
});
