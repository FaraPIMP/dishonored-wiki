const pool = require('./db');

const mechanicsData = {
    find: async (callback) => {
        try {
            const result = await pool.query('SELECT * FROM game_mechanics ORDER BY category, title');
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findByCategory: async (category, callback) => {
        try {
            const result = await pool.query(
                'SELECT * FROM game_mechanics WHERE LOWER(category) = LOWER($1) ORDER BY title',
                [category]
            );
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findByGame: async (game, callback) => {
        try {
            const result = await pool.query(
                'SELECT * FROM game_mechanics WHERE LOWER(game) = LOWER($1) ORDER BY category, title',
                [game]
            );
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findOne: async (query, callback) => {
        try {
            const title = query.title;
            const result = await pool.query(
                'SELECT * FROM game_mechanics WHERE LOWER(title) = LOWER($1)',
                [title]
            );
            callback(null, result.rows[0]);
        } catch (err) {
            callback(err, null);
        }
    }
};

module.exports = mechanicsData;
