SELECT
    UPPER(t.track_title) AS "CANCION",
    a.artist_name AS "ARTISTA",
    NVL2(s.studio_name, s.studio_name, 'SIN ESTUDIO') AS "ESTUDIO"
FROM URBANO.TRACKS t
JOIN URBANO.ARTISTS a
    ON t.artist_id = a.artist_id
LEFT OUTER JOIN URBANO.STUDIOS s
    ON t.studio_id = s.studio_id
ORDER BY a.artist_name, t.track_title;

SELECT
    t.track_title AS "CANCION",
    TO_CHAR(t.release_date, 'DD/MM/YYYY') AS "FECHA_ESTRENO",
    TRUNC(SYSDATE - t.release_date, 0) AS "DIAS_AL_AIRE"
FROM URBANO.TRACKS t
WHERE t.release_date IS NOT NULL
ORDER BY t.release_date DESC;

SELECT
    t.track_title AS "CANCION",
    t.streams AS "REPRODUCCIONES",
    CASE
        WHEN t.streams > (SELECT AVG(streams) FROM URBANO.TRACKS)
        THEN 'HIT DEL CATALOGO'
        ELSE 'EN CRECIMIENTO'
    END AS "RENDIMIENTO"
FROM URBANO.TRACKS t
ORDER BY t.streams DESC;