const pool = require('./db');

const gamesData = {
    find: async (callback) => {
        try {
            const result = await pool.query('SELECT * FROM games ORDER BY release_date');
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findOne: async (query, callback) => {
        try {
            const title = query.title;
            const result = await pool.query(
                'SELECT * FROM games WHERE LOWER(title) = LOWER($1)',
                [title]
            );
            callback(null, result.rows[0]);
        } catch (err) {
            callback(err, null);
        }
    }
};

module.exports = gamesData;
