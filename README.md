# Изображения Dishonored Wiki
<img width="1919" height="944" alt="Screenshot_2" src="https://github.com/user-attachments/assets/4bc575a3-6e9e-4494-8c10-5a4e3f394313" />
<img width="1919" height="948" alt="Screenshot_3" src="https://github.com/user-attachments/assets/a98ae18e-516f-4015-afe6-7a67726c8b59" />
<img width="1919" height="943" alt="Screenshot_4" src="https://github.com/user-attachments/assets/fc65553f-c636-45ff-8b89-0843df7e95ec" />
<img width="1919" height="947" alt="Screenshot_5" src="https://github.com/user-attachments/assets/de372013-e91f-427d-81c6-6ebbb8b59cdb" />
<img width="1919" height="947" alt="Screenshot_6" src="https://github.com/user-attachments/assets/4fcc4e35-3f80-4305-887a-a705587c15e1" />

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
