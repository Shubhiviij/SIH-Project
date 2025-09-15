const express = require("express");
const pool = require("../db");
const authMiddleware = require("../middleware/authMiddleware");

const router = express.Router();

// Get user profile
router.get("/:id", authMiddleware, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT user_id, name, email, phone, role, address, created_at FROM users WHERE user_id=$1`,
      [req.params.id]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Update user profile
router.put("/:id", authMiddleware, async (req, res) => {
  try {
    const { name, phone, address } = req.body;
    const result = await pool.query(
      `UPDATE users SET name=$1, phone=$2, address=$3 WHERE user_id=$4 RETURNING *`,
      [name, phone, address, req.params.id]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
