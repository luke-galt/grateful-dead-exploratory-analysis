update `grateful-dead-510217.GD_setlists.GD_sets`
set era=case
  WHEN date <= DATE('1971-08-26') THEN 'Pigpen Era'
    WHEN date BETWEEN DATE('1971-10-19') AND DATE('1979-02-17') THEN 'Keith Godchaux Era'
    WHEN date BETWEEN DATE('1979-04-22') AND DATE('1990-07-23') THEN 'Brent Mydland Era'
    WHEN date >= DATE('1990-09-07') THEN 'Vince Welnick Era'
    ELSE 'Transitional / Hiatus Gap'
END
where TRUE