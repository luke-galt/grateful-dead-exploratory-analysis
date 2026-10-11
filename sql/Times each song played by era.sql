
SELECT 
    song,
    COUNT(DISTINCT CASE WHEN era = 'Pigpen Era' THEN date END) AS pigpen_era_plays,
    COUNT(DISTINCT CASE WHEN era = 'Keith Godchaux Era' THEN date END) AS keith_era_plays,
    COUNT(DISTINCT CASE WHEN era = 'Brent Mydland Era' THEN date END) AS brent_era_plays,
    COUNT(DISTINCT CASE WHEN era = 'Vince Welnick Era' THEN date END) AS vince_era_plays,
    COUNT(DISTINCT date) AS total_plays
FROM `grateful-dead-510217.GD_setlists.GD_sets`
GROUP BY song
having total_plays >= 50
ORDER BY total_plays DESC;