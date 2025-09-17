const express = require("express");
const cors = require("cors");
const pool = require("./db"); // PostgreSQL connection

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// ✅ Test route
app.get("/", (req, res) => {
  res.send("Backend is running ✅");
});

/* ------------------ USERS ROUTES ------------------ */

// Signup
app.post("/api/register", async (req, res) => {
  const { name, email, password} = req.body;
    // Validate input
  if (!name || !email || !password) {
    return res.status(400).json({ message: "❌ All fields are required" });
  }
  try {
    const existingUser = await pool.query("SELECT * FROM users WHERE email = $1", [email]);
    if (existingUser.rows.length > 0) {
      return res.status(400).json({ message: "❌ Email already registered" });
    }
    //Insert new user into database
    const result = await pool.query(
      `INSERT INTO users (name, email, password_hash) 
       VALUES ($1, $2, $3) 
       RETURNING user_id, name, email,created_at`,
      [name, email, password]
    );
    res.status(201).json({ message: "✅ User registered", user: result.rows[0] });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// Login
// ------------------ LOGIN API ------------------
app.post("/api/login", async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "❌ All fields are required" });
  }

  try {
    const result = await pool.query(
      "SELECT user_id, name, email FROM users WHERE email = $1 AND password_hash = $2",
      [email, password]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({ message: "❌ Invalid email or password" });
    }

    res.json({ message: "✅ Login successful", user: result.rows[0] });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Server error" });
  }
});


// Get user by email
app.get("/api/user/:email", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM users WHERE email = $1", [req.params.email]);
    if (result.rows.length === 0) return res.status(404).json({ message: "❌ User not found" });
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// Get all users
app.get("/api/users", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT user_id, name, email,  created_at FROM users ORDER BY created_at DESC"
    );
    res.json(result.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

/* ------------------ ISSUES ROUTES ------------------ */

// Create issue
app.post("/api/issues", async (req, res) => {
  const { user_id, title, description, category, latitude, longitude, address, image_url } = req.body;
  try {
    const result = await pool.query(
  `INSERT INTO issues (title, description, category, latitude, longitude, address, image_url, reported_by) 
   VALUES ($1, $2, $3, $4, $5, $6, $7, $8) 
   RETURNING *`,
        [title, description, category, latitude, longitude, address, image_url, user_id]
    );
    res.status(201).json({ message: "✅ Issue reported", issue: result.rows[0] });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// Get all issues
app.get("/api/issues", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM issues ORDER BY created_at DESC");
    res.json(result.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

/* ------------------ COMMENTS ROUTES ------------------ */

// Add comment
app.post("/api/comments", async (req, res) => {
  const { user_id, issue_id, comment_text } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO comments (user_id, issue_id, comment_text) 
       VALUES ($1, $2, $3) 
       RETURNING *`,
      [user_id, issue_id, comment_text]
    );
    res.status(201).json({ message: "✅ Comment added", comment: result.rows[0] });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// Get comments for an issue
app.get("/api/comments/:issue_id", async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT c.comment_id, c.comment_text, c.created_at, u.name AS user_name
       FROM comments c
       JOIN users u ON c.user_id = u.user_id
       WHERE c.issue_id = $1
       ORDER BY c.created_at DESC`,
      [req.params.issue_id]
    );
    res.json(result.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

/* ------------------ START SERVER ------------------ */
app.listen(PORT, "0.0.0.0", () => {
  console.log(`✅ Server running at http://0.0.0.0:${PORT}`);
});
