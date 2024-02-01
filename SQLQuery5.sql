-- create a join table
SELECT * FROM Absenteeism_at_work a
left join [Work].[dbo].[compensation] b
on a.ID = b.ID
left join [Work].[dbo].[Reasons] r on 
a.Reason_for_absence = r.Number;


--- find the healthiest employees for the bonus
SELECT * FROM Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index <25 and 
Absenteeism_time_in_hours <  (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work)


--- Compensation rate increase for non-smoker/ budget $983,221 so 0.86 increase per hour/ $1,414 per year
select count(*) from Absenteeism_at_work
where Social_smoker = 0

--- optimise this query
SELECT
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
case when Body_mass_index <18.5 then 'Underweight'
	 when Body_mass_index between 18.5 and 25 then 'Healthy weight'
	 when Body_mass_index between 25 and 30 then 'Over weight'
	 when Body_mass_index >30 then 'Obese'
	 Else 'Unknown' end as BMI_Caregory,
case when Month_of_Absence in (12,1,2) then 'Winter'
	 when Month_of_Absence in (3,4,5) then 'Spring'
	 when Month_of_Absence in (16,7,8) then 'Summer'
	 when Month_of_Absence in (9,10,11) then 'Winter'
	 else 'Unknown' end as Seasons_Names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker, 
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
FROM Absenteeism_at_work a
left join [Work].[dbo].[compensation] b
on a.ID = b.ID
left join [Work].[dbo].[Reasons] r on 
a.Reason_for_absence = r.Number;