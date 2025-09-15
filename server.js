const express = require("express");
const pool = require("./db");
const app = express();

app.use(express.json());

/* ================================
   ISSUE ROUTES
   ================================ */

// 1️⃣ Create a new issue
app.post("/api/issues", async (req, res) => {
  const { title, description, category, latitude, longitude, address, image_url, reported_by } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO issues 
        (title, description, category, latitude, longitude, address, image_url, reported_by, status, created_at, updated_at) 
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,'pending',NOW(),NOW()) 
       RETURNING *`,
      [title, description, category, latitude, longitude, address, image_url, reported_by]
    );
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// 2️⃣ Get all issues
app.get("/api/issues", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM issues ORDER BY created_at DESC");
    res.json(result.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// 3️⃣ Get issue by ID
app.get("/api/issues/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query("SELECT * FROM issues WHERE issue_id=$1", [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: "Issue not found" });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// 4️⃣ Update issue (status/details)
app.put("/api/issues/:id", async (req, res) => {
  const { id } = req.params;
  const { status, title, description, category, latitude, longitude, address, image_url } = req.body;
  try {
    const result = await pool.query(
      `UPDATE issues 
       SET title=COALESCE($1,title), 
           description=COALESCE($2,description), 
           category=COALESCE($3,category), 
           latitude=COALESCE($4,latitude), 
           longitude=COALESCE($5,longitude), 
           address=COALESCE($6,address), 
           image_url=COALESCE($7,image_url), 
           status=COALESCE($8,status), 
           updated_at=NOW()
       WHERE issue_id=$9 RETURNING *`,
      [title, description, category, latitude, longitude, address, image_url, status, id]
    );
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: "Issue not found" });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// 5️⃣ Delete issue
app.delete("/api/issues/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query("DELETE FROM issues WHERE issue_id=$1 RETURNING *", [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: "Issue not found" });
    }
    res.json({ msg: "Issue deleted successfully" });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

/* ================================
   START SERVER
   ================================ */
app.listen(process.env.PORT || 5000, () => {
  console.log(`Server running on http://localhost:${process.env.PORT || 5000}`);
});
