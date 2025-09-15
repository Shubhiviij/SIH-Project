const express = require("express");
const pool = require("../db");
const authMiddleware = require("../middleware/authMiddleware");

const router = express.Router();

// Add comment
router.post("/:issueId", authMiddleware, async (req, res) => {
  try {
    const result = await pool.query(
      `INSERT INTO comments (issue_id, user_id, comment_text)
       VALUES ($1,$2,$3) RETURNING *`,
      [req.params.issueId, req.user.user_id, req.body.comment_text]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Get comments for issue
router.get("/:issueId", async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT c.*, u.name FROM comments c
       JOIN users u ON c.user_id = u.user_id
       WHERE issue_id = $1 ORDER BY created_at ASC`,
      [req.params.issueId]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
