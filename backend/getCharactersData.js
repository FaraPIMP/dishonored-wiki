const pool = require('./db');

const charactersData = {
    find: async (callback) => {
        try {
            const result = await pool.query('SELECT * FROM characters ORDER BY name');
            callback(null, result.rows);
        } catch (err) {
            callback(err, null);
        }
    },

    findOne: async (query, callback) => {
        try {
            const name = query.name;
            const result = await pool.query(
                'SELECT * FROM characters WHERE LOWER(name) = LOWER($1)',
                [name]
            );
            callback(null, result.rows[0]);
        } catch (err) {
            callback(err, null);
        }
    }
};

module.exports = charactersData;
