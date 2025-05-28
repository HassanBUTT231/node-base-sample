const express = require('express');
const app = express();

const port = process.env.PORT || 5000;


app.get('/', (req, res) => {
  res.send('Hello from Node.js App deployed on EC2 using CodeDeploy and Docker!');
});

// Start the server and listen on all network interfaces
app.listen(port, '0.0.0.0', () => {
  console.log(`App listening on port ${port}`);
});
