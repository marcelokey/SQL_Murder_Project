--MURDER MYSTERY

--search for information about the murdercr
select *
from crime_scene_report
where type = 'murder' and '20180115' and city = 'SQL City'

--the first witness
select *
from person
where address_street_name = 'Northwestern Dr'
order by address_number DESC
LIMIT 1

-- the second witness
select *
from person
where address_street_name = 'Franklin Ave' and name like'%Annabel%'

-- witnesses interview.
select person.name, person.id, interview.transcript
from interview
join person
on interview.person_id = person.id
WHERE person.id =14887 OR person.id =16371

-- to check for Morty's interview
select *
from drivers_license
JOIN person
on drivers_license.id = person.license_id
where "plate_number" like '%H42W%'

-- from Morty's interviw, lets get persons with bag 48Z and Gold memberhip
select *
from get_fit_now_member
where id like '%48Z%' and membership_status ='gold'

--to check Annabel's interwiew
select b.id, b.person_id, b.membership_status, a.check_in_date, a.check_in_time, a.check_out_time
from get_fit_now_check_in a
join get_fit_now_member  b
on a. membership_id  = b.id
where check_in_date ='20180109' and membership_status ='gold' and person_id ='67318'

--to find the muederer
select *
from interview
where person_id ='67318'

--from the murderer's interview, we still have to find who hired him for the job.
select *
from person  a
join drivers_license b
on a.license_id = b.id
join facebook_event_checkin c
on c.person_id = a.id
where gender ='female'AND b.car_model ='Model S'and b.car_make ='Tesla'AND c.event_name ='SQL Symphony Concert'



