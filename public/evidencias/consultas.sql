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


SELECT *
FROM CANCHA
WHERE localidad = ‘Suba’;

SELECT ET.id_torneo, E.nombre 
FROM EQU_TOR ET 
JOIN EQUIPO E ON ET.id_equipo = E.id_equipo 
WHERE ET.estado_inscripcion = 'Aprobada'; 

SELECT P.id_partido, C.nombre 
FROM CANCHA C 
JOIN PARTIDO P ON C.id_cancha = P.id_cancha 
WHERE C.tipo_superficie = 'Sintetica'; 

SELECT A.primer_nombre, A.primer_apellido, PA.id_partido 
FROM PAR_ARB PA 
JOIN ARBITRO A ON PA.id_arbitro = A.id_arbitro 
WHERE PA.rol = 'Central'; 

SELECT E.nombre
FROM PAR_EQU PE
JOIN PARTIDO P ON PE.id_partido = P.id_partido
JOIN EQUIPO E ON PE.id_equipo = E.id_equipo
WHERE PE.rol = 'Local' AND P.goles_local > P.goles_visitante;
