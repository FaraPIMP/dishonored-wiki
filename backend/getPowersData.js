const pool = require('./db');

const powersData = {
    find: async (callback) => {
        try {
            const result = await pool.query('SELECT * FROM powers ORDER BY title');
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findOne: async (query, callback) => {
        try {
            const title = query.title;
            const result = await pool.query(
                'SELECT * FROM powers WHERE LOWER(title) = LOWER($1)',
                [title]
            );
            callback(null, result.rows[0]);
        } catch (err) {
            callback(err, null);
        }
    }
};

module.exports = powersData;
