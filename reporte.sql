/*-----------------------------------------------------------------------
  Reporte   : Ventas de álbum por país en el último semestre
  Base      : Chinook  (PostgreSQL)
  Autor     : <Kevin Castro>
  Ejecutado : CURRENT_DATE se toma como fecha “hoy”

  ¿Qué devuelve?
    country          -> País de facturación
    album_title      -> Nombre del álbum
    num_recibos      -> Nº de facturas que incluyen al menos un track del álbum
    suma_recibos     -> Suma total de esas facturas (últimos 6 meses)
    promedio_recibo  -> Promedio del importe por factura

  Lógica:
    1) CTE facturas_semestre:
         - filtra facturas entre el 1er día del mes actual ‑ 6 meses  y  la fecha actual
         - relación Invoice → InvoiceLine → Track → Album
         - DISTINCT para contar una sola vez cada combinación (invoice, album)
    2) Agregación final por país + álbum.

  Complejidad:
    O(N) en número de líneas de factura del semestre; índices existentes
    en InvoiceLine.invoice_id y Track.album_id mantienen la consulta en
    tiempo interactivo (< 1 s con el dataset Chinook).

------------------------------------------------------------------------*/

WITH facturas_semestre AS (
    SELECT DISTINCT
        i.invoice_id,
        i.billing_country           AS country,
        i.total                     AS invoice_total,
        a.album_id,
        a.title                     AS album_title
    FROM   invoice       AS i
    JOIN   invoice_line  AS il ON il.invoice_id = i.invoice_id
    JOIN   track         AS t  ON t.track_id    = il.track_id
    JOIN   album         AS a  ON a.album_id    = t.album_id
    WHERE  i.invoice_date >= date_trunc('month', CURRENT_DATE) - INTERVAL '6 months'
      AND  i.invoice_date <  CURRENT_DATE
)

SELECT
    country,
    album_title,
    COUNT(*)                    AS num_recibos,
    ROUND(SUM(invoice_total),2) AS suma_recibos,
    ROUND(AVG(invoice_total),2) AS promedio_recibo
FROM   facturas_semestre
GROUP BY country, album_title
ORDER BY country, suma_recibos DESC;
