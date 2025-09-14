const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'civic_issues',
  password: 'sqlshubhi',
  port: 5432
});

module.exports = pool;
