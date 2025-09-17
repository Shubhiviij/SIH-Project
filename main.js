const express = require("express");
const app = express();
const issueRoutes = require("./routes/issues"); // path to your issues.js

app.use(express.json());
app.use("/api/issues", issueRoutes);

app.listen(5000, () => {
  console.log("Server is running on port 5000");
});
