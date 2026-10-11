SELECT song, count(DISTINCT date) as song_count
FROM `grateful-dead-510217.GD_setlists.GD_sets`
group by song
order by song_count desc
limit 20