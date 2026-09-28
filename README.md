ShopDB — Домашнее задание по базам данных (уроки 17–18)

Что в репозитории
- `01_create_shopdb.sql` — создание БД ShopDB с двумя файловыми группами (PRIMARY + FG_Data).
- `02_create_tables.sql` — создание 7 таблиц магазина в файловой группе FG_Data.
- `02b_check_filegroups.sql` — проверка, что все таблицы лежат в FG_Data.
- `03_explore_adventureworks.sql` — запросы для изучения базы AdventureWorks2022.
- `04_restore_adventureworks.sql` — скрипт восстановления AdventureWorks2022 из бэкапа.
- `diagrams/` — диаграмма БД (ER-диаграмма связей).

Модель данных ShopDB (7 сущностей)
- Categories — категории товаров
- Products — товары (FK → Categories)
- Customers — клиенты
- Addresses — адреса клиентов (FK → Customers)
- Orders — заказы (FK → Customers)
- OrderItems — позиции заказов (FK → Orders, Products)
- Payments — платежи (FK → Orders)

Файловые группы
- **PRIMARY** — только системные объекты, пользовательских таблиц нет.
- **FG_Data** — все 7 таблиц магазина.

Как развернуть
1. Открыть SSMS.
2. Выполнить `01_create_shopdb.sql`, затем `02_create_tables.sql`.
3. Проверить `02b_check_filegroups.sql` — все таблицы должны быть в `FG_Data`.
4. (Опционально) Восстановить AdventureWorks2022 через `04_restore_adventureworks.sql`.
   Скачать `.bak` заранее: https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks
