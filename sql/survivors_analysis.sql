# Total row count  
select 
	count(*) as total_rows
from titanic;

# How did survival rates differ between male and female passengers?
select 
	Sex, 
	sum(case when Survived = 1 then 1 else 0 end) as survivors_count , 
	(sum(case when Survived = 1 then 1 else 0 end) * 100.0 / count(*)) as survival_percentage 
from titanic
group by Sex;

# How did survival rates vary across passenger classes?
select 
	pClass, 
	sum(case when survived = 1 then 1 else 0 end) as survivors_count, 
    (sum(case when Survived = 1 then 1 else 0 end)* 100.0 / count(*)) as survival_percentage
from titanic
group by pClass;

# How did survival rates vary by embarkation port?  
select 
	Embarked,
    count(*) as survivors_count, 
    (sum(case when Survived = 1 then 1 else 0 end)* 100.0 / count(*)) as survival_percentage,
case 
	when Embarked = 'C' then "Cherbourg"
    when Embarked = 'Q' then "Queenstown"
    when Embarked = 'S' then "Southampton"
    else 'Null'
end as embarked_from
from titanic 
group by Embarked;

# How did survival rates differ across age groups?
select  
	case 
	when age between 0 and 17 then 'Children' 
    when age > 59 then 'Elders'
    when age between 18 and 59 then 'Adult' 
    else 'Null'
end as Demographic,
count(*) as total_passenger, 
sum(case when Survived = 1 then 1 else 0 end) as survivors_count, 
(sum(case when Survived = 1 then 1 else 0 end)* 100.0 / count(*)) as survival_percentage
from titanic 
group by 
	case 
	when age between 0 and 17 then 'Children' 
    when age > 59 then 'Elders'
    when age between 18 and 59 then 'Adult' 
    else 'Null'
end;
