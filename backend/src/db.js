const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: '1518',
    host: 'localhost',
    port: 5432,
    database: 'reservas'
})

module.exports = pool;