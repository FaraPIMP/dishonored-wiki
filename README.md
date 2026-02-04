# Запуск проекта Dishonored Wiki

## Требования
- **Node.js**: 14+
- **PostgreSQL**: 12+
- **npm** или **yarn**

## Установка зависимостей

```bash
# Перейдите в папку проекта
cd dishonored-wiki

# Установите зависимости
npm install
```

## Настройка базы данных

1. Создайте базу данных в PostgreSQL:
```bash
psql -U postgres
CREATE DATABASE dishonored_wiki;
\q
```

2. Загрузите структуру и данные (используя `schema.sql` и `data.sql`):
```bash
psql -U postgres -d dishonored_wiki -f backend/schema.sql
psql -U postgres -d dishonored_wiki -f backend/data.sql
```
*Альтернативно, если есть полный дамп `full_backup.sql`, можно использовать его.*

## Настройка окружения

Создайте файл `.env` в корне проекта (`dishonored-wiki/`) и добавьте ваши настройки подключения:

```env
DB_USER=postgres
DB_HOST=localhost
DB_NAME=dishonored_wiki
DB_PASSWORD=ваш_пароль
DB_PORT=5432
```

## Запуск

Вам потребуется два терминала.

**Терминал 1: Сервер (Backend)**
```bash
npm run server
```

**Терминал 2: Клиент (Frontend)**
```bash
npm run client
```
