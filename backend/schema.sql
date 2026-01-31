-- SQL СХЕМА для Dishonored Wiki
-- PostgreSQL 12+
-- Кодировка: UTF-8

SET client_encoding TO 'UTF8';

-- ============================================
-- ТАБЛИЦА ИГР
-- ============================================
CREATE TABLE IF NOT EXISTS games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    release_date DATE,
    description TEXT,
    img VARCHAR(500),
    video VARCHAR(500),
    audio VARCHAR(500),
    info TEXT,
    developer VARCHAR(255),
    publisher VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_games_title ON games(title);

-- ============================================
-- ТАБЛИЦА ФРАКЦИЙ
-- ============================================
CREATE TABLE IF NOT EXISTS factions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    game VARCHAR(255),
    description TEXT,
    leader VARCHAR(255),
    headquarters VARCHAR(255),
    image VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_factions_game ON factions(game);

-- ============================================
-- ТАБЛИЦА ПЕРСОНАЖЕЙ
-- ============================================
CREATE TABLE IF NOT EXISTS characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(255),
    faction VARCHAR(255),
    game VARCHAR(255),
    image VARCHAR(500),
    description TEXT,
    quotes TEXT[],
    status VARCHAR(100),
    voice_actor VARCHAR(255),
    first_appearance VARCHAR(255),
    faction_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (faction_id) REFERENCES factions(id)
);

CREATE INDEX IF NOT EXISTS idx_characters_game ON characters(game);
CREATE INDEX IF NOT EXISTS idx_characters_faction ON characters(faction);

-- ============================================
-- ТАБЛИЦА СПОСОБНОСТЕЙ
-- ============================================
CREATE TABLE IF NOT EXISTS powers (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type VARCHAR(100),
    game VARCHAR(255),
    description TEXT,
    character_name VARCHAR(255),
    mana_cost VARCHAR(50),
    rune_cost INTEGER,
    max_level INTEGER DEFAULT 1,
    image VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_powers_game ON powers(game);
CREATE INDEX IF NOT EXISTS idx_powers_type ON powers(type);

-- ============================================
-- ТАБЛИЦА ПРЕДМЕТОВ
-- ============================================
CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    rarity VARCHAR(50),
    game VARCHAR(255),
    image VARCHAR(500),
    description TEXT,
    effects TEXT[],
    location VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_items_game ON items(game);
CREATE INDEX IF NOT EXISTS idx_items_category ON items(category);

-- ============================================
-- ТАБЛИЦА ЛОКАЦИЙ
-- ============================================
CREATE TABLE IF NOT EXISTS locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    game VARCHAR(255),
    district VARCHAR(255),
    type VARCHAR(100),
    description TEXT,
    notable_features TEXT[],
    image VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_locations_game ON locations(game);
CREATE INDEX IF NOT EXISTS idx_locations_type ON locations(type);

-- ============================================
-- ТАБЛИЦА ИГРОВЫХ МЕХАНИК
-- ============================================
CREATE TABLE IF NOT EXISTS game_mechanics (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    game VARCHAR(255),
    description TEXT,
    effects TEXT[],
    tips TEXT[],
    image VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_mechanics_game ON game_mechanics(game);
CREATE INDEX IF NOT EXISTS idx_mechanics_category ON game_mechanics(category);

-- ============================================
-- НАЧАЛЬНЫЕ ДАННЫЕ
-- ============================================

-- Вставка игр
INSERT INTO games (title, subtitle, release_date, developer, publisher) VALUES
('Dishonored', 'Revenge Solves Everything', '2012-10-09', 'Arkane Studios', 'Bethesda Softworks'),
('Dishonored 2', 'Take Back What''s Yours', '2016-11-11', 'Arkane Studios', 'Bethesda Softworks')
ON CONFLICT DO NOTHING;

-- Примечание: Данные для остальных таблиц (персонажи, способности, предметы, локации, механики)
-- уже должны быть в базе данных. Если нужно заполнить пустую базу, обратитесь к администратору
-- или используйте инструменты импорта данных.
