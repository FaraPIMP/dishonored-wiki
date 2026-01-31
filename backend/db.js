const { Pool } = require('pg');

// Настройки подключения к PostgreSQL
const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

// Проверка подключения
pool.connect((err, client, release) => {
    if (err) {
        console.error('✗ Ошибка подключения к PostgreSQL:', err.stack);
    } else {
        console.log('✓ Подключение к PostgreSQL успешно');
        release();
    }
});

module.exports = pool;
