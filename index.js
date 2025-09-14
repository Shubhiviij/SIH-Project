const express = require('express');
const bodyParser = require('body-parser');
const pool = require('./db');  // Assuming you already set up db.js

const app = express();
app.use(bodyParser.json());

// Test route to check if server is running
app.get('/', (req, res) => {
  res.send('Server is running');
});

// Example route to register user
app.post('/users/register', async (req, res) => {
  const { name, email, phone, role, password_hash, address } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO users (name, email, phone, role, password_hash, address)
       VALUES ($1, $2, $3, $4, $5, $6) RETURNING user_id`,
      [name, email, phone, role, password_hash, address]
    );
    res.json({ user_id: result.rows[0].user_id });
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
});

// Listen on port 3000
app.listen(3000, () => {
  console.log('Server running on port 3000');
});
