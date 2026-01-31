require('dotenv').config();
const express = require('express');
let cors = require('cors');
const bodyParser = require('body-parser');
const logger = require('morgan');
const pool = require('./db');
const charactersData = require('./getCharactersData');
const gamesData = require('./getGamesData');
const powersData = require('./getPowersData');
const itemsData = require('./getItemsData');
const locationsData = require('./getLocationsData');
const factionsData = require('./getFactionsData');
const mechanicsData = require('./getMechanicsData');

const API_PORT = 3001;
const app = express();
app.use(cors());
const router = express.Router();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(logger('dev'));

// ===== GAMES ENDPOINTS =====
router.get('/getGamesData', (req, res) => {
    gamesData.find((err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getGamesData/:title', (req, res) => {
    gamesData.findOne({title:((req.params?.title).replace(':', '')).split('_').join(' ')}, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

// ===== CHARACTERS ENDPOINTS =====
router.get('/getCharactersData', (req, res) => {
    charactersData.find((err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getCharactersData/:name', (req, res) => {
    charactersData.findOne({name:((req.params?.name).replace(':', '')).split('_').join(' ')}, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

// ===== POWERS ENDPOINTS =====
router.get('/getPowersData', (req, res) => {
    powersData.find((err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getPowersData/:title', (req, res) => {
    powersData.findOne({title:((req.params?.title).replace(':', '')).split('_').join(' ')}, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

// ===== ITEMS ENDPOINTS =====
router.get('/getItemsData', (req, res) => {
    itemsData.find((err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getItemsData/game/:game', (req, res) => {
    const game = req.params.game.split('_').join(' ');
    itemsData.findByGame(game, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getItemsData/:title', (req, res) => {
    itemsData.findOne({title:((req.params?.title).replace(':', '')).split('_').join(' ')}, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

// ===== LOCATIONS ENDPOINTS =====
router.get('/getLocationsData', (req, res) => {
    locationsData.find((err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getLocationsData/game/:game', (req, res) => {
    const game = req.params?.game.replace(':', '').split('_').join(' ');
    locationsData.findByGame(game, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getLocationsData/:name', (req, res) => {
    locationsData.findOne({name:((req.params?.name).replace(':', '')).split('_').join(' ')}, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

// ===== FACTIONS ENDPOINTS =====
router.get('/getFactionsData', (req, res) => {
    factionsData.find((err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getFactionsData/game/:game', (req, res) => {
    const game = req.params?.game.replace(':', '').split('_').join(' ');
    factionsData.findByGame(game, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

// ===== MECHANICS ENDPOINTS =====
router.get('/getMechanicsData', (req, res) => {
    mechanicsData.find((err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getMechanicsData/game/:game', (req, res) => {
    const game = req.params?.game.replace(':', '').split('_').join(' ');
    mechanicsData.findByGame(game, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

router.get('/getMechanicsData/category/:category', (req, res) => {
    mechanicsData.findByCategory(req.params?.category, (err, data) => {
        if (err) return res.json({ success: false, error: err });
        return res.json({ success: true, data: data });
    });
});

app.use('/api', router);

app.listen(API_PORT, () => console.log(`⚡ Сервер запущен на порту ${API_PORT}`));
