--avg billing amount for each disaese
select medical_condition,round(avg(billing_amount),2) as "average_billing_amount" from visit 
group by medical_condition
order by average_billing_amount desc

-- number of patients of each admission type 
select admission_type,count(*) as "number_of_patients"
from visit 
group by admission_type order by number_of_patients desc

--the highest 3 doctors with patients 
select name,count(*) as number_of_patients
from doctor join visit 
on doctor.doctor_id=visit.doctor_id
group by doctor.doctor_id
order by number_of_patients desc
limit 3;

--avg duration of stay for each disease
select medical_condition,round(avg(discharge_date-date_of_admission),1) as avg_stay_days
from visit 
group by medical_condition 
order by avg_stay_days desc

--rank the insurance provider
with temp as (select insurance_provider,count(*) as number_of_patients
from patient 
group by insurance_provider
) select *,
rank() over(order by number_of_patients desc)
from temp 

--comparing the billing for avg billing for each medical_condition
with temp_table as (
select name,medical_condition,billing_amount,
avg(billing_Amount) over (partition by medical_condition) as avg_billing_amount
from (
select  * from patient p
join visit v
on p.patient_id =v.patient_id 
 ) temp 
 ) select *,round(billing_amount-avg_billing_amount,2) as difference 
 from temp_table
 

--top mediction for each medical_condition
select medical_condition,medication,usage_Count from (
 with temp as (
	select medical_condition,medication,count(*) as usage_count
	from visit
	group by medical_condition ,medication
) select medical_condition,medication,usage_count,
rank() over (partition by medical_condition order by usage_count desc)
from temp 
) temp_table 
where rank=1


--percentage of test results for each medical_coundition
select *,round((number_for_each_result*100.0/number_of_test_results),1) as percentage
from (
	select distinct medical_condition,test_results,
	count(test_results) over (partition by medical_condition)  as number_of_test_results,
	count(test_results) over (partition by medical_condition,test_results) as number_for_each_result
	from visit
	order by medical_condition
	) temp 

	

--most overloaded months	
select
extract(year from date_of_admission) as year,
extract(month from date_of_admission) as month,
count(*) as admission_count
from visit
group by year, month
order by admission_count desc;
	
	
	
-- cumlative biling amount 
select date_of_admission,billing_amount,
sum(billing_amount) over (order by date_of_admission,billing_Amount ) as cumulative_billing
from visit







 