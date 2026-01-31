const pool = require('./db');

const locationsData = {
    find: async (callback) => {
        try {
            const result = await pool.query('SELECT * FROM locations ORDER BY name');
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findByGame: async (game, callback) => {
        try {
            const result = await pool.query(
                'SELECT * FROM locations WHERE LOWER(game) = LOWER($1) ORDER BY name',
                [game]
            );
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findOne: async (query, callback) => {
        try {
            const name = query.name;
            const result = await pool.query(
                'SELECT * FROM locations WHERE LOWER(name) = LOWER($1)',
                [name]
            );
            callback(null, result.rows[0]);
        } catch (err) {
            callback(err, null);
        }
    }
};

module.exports = locationsData;
