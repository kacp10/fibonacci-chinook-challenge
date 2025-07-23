# Desafío Fibonacci & Chinook

## Requisitos

| Herramienta   | Versión mínima |
|---------------|---------------:|
| PHP           | 8.1            |
| Composer      | 2.x            |
| Python        | 3.7            |
| Node.js / npm | 14             |
| PostgreSQL    | 15             |

---

## 1 · Clonar e inicializar

~~~bash
git clone https://github.com/kacp10/fibonacci-chinook-challenge.git
cd fibonacci-chinook-challenge
~~~

---

## 2 · Ejecutar tests unitarios

### PHP
~~~bash
cd php
composer install
vendor/bin/phpunit
cd ..
~~~

### Python
~~~bash
cd python
python -m venv .venv
. .venv/Scripts/activate
pip install pytest
pytest
cd ..
~~~

### JavaScript
~~~bash
cd Js
npm ci
npm test
cd ..
~~~

---

## 3 · Arrancar la mini‑app

~~~bash
cd Js
npx serve .
# o bien
python -m http.server 8000
~~~

Abre `http://localhost:3000` (o el puerto indicado).  
Captura: `Js/screenshot.png`.

---

## 4 · Ejecutar el reporte SQL

~~~bash
psql -U postgres -c "CREATE DATABASE chinook;"
psql -U postgres -d chinook -f Chinook_PostgreSql.sql
psql -U postgres -d chinook -f reporte.sql
~~~

`reporte.sql` entrega por país y álbum (últimos 6 meses): número de facturas, suma total y promedio.

**Exportar a CSV (opcional)**

~~~bash
psql -U postgres -d chinook -c "\copy ( \i reporte.sql ) TO 'reporte.csv' CSV HEADER"
~~~

---

## Estructura del proyecto

```text
Js/         mini‑app, tests Jest, screenshot
php/        fibList en PHP + tests PHPUnit
python/     fibList en Python + tests pytest
reporte.sql consulta PostgreSQL (Chinook)
DECISIONES.md  explicación breve
