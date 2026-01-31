const pool = require('./db');

const itemsData = {
    find: async (callback) => {
        try {
            const result = await pool.query('SELECT * FROM items ORDER BY title');
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findOne: async (query, callback) => {
        try {
            const title = query.title;
            const result = await pool.query(
                'SELECT * FROM items WHERE LOWER(title) = LOWER($1)',
                [title]
            );
            callback(null, result.rows[0]);
        } catch (err) {
            callback(err, null);
        }
    },

    findByGame: async (game, callback) => {
        try {
            const result = await pool.query(
                'SELECT * FROM items WHERE LOWER(game) = LOWER($1) ORDER BY category, rarity',
                [game]
            );
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    }
};

module.exports = itemsData;
