
WITH yearly_counts AS (
    SELECT
        EXTRACT(YEAR FROM date) AS year,
        song,
        COUNT(DISTINCT date) AS show_count
    FROM `grateful-dead-510217.GD_setlists.GD_sets`
    GROUP BY year, song
),
ranked AS (
    SELECT
        year,
        song,
        show_count,
        RANK() OVER (PARTITION BY year ORDER BY show_count DESC) AS rank
    FROM yearly_counts
)
SELECT year, song, show_count, rank
FROM ranked
WHERE rank <= 10
ORDER BY year, rank
