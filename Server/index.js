require('dotenv').config();

const express = require('express');
const app = express();
const credsRoutes = require('./routes/credsRoutes'); // Import creds routes

app.use(express.json()); // Middleware for JSON

// Use routes
app.use('/api/creds', credsRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});