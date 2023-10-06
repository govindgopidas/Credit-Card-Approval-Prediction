## Creating a database
create database banking;
use banking;
## Importing the cleaned data to workbench:
## Righ click on the created database in schemas -> Select table data import wizard ->
## Select the file path to import -> Select destination table and additional options and next ->
## Configure import settings and next -> Again click next to execute

#______________________________________________________________________________________________________________________________

# 1.Group the customers based on their income type and find the average of their annual income.
select Type_income as Income_type, avg(Annual_Income) as Average_Annual_Income from credit_card group by Type_Income;

#______________________________________________________________________________________________________________________________

# 2.Find the female owners of cars and property.
select Ind_ID as Applicant_ID from credit_card where
GENDER='F' and  Car_Owner='Y' and  Propert_Owner='Y';

#______________________________________________________________________________________________________________________________

# 3.Find the male customers who are staying with their families.
select distinct Housing_type from credit_card;
select Ind_ID as Applicant_ID from credit_card where Housing_type ='With parents' and GENDER='M';

#______________________________________________________________________________________________________________________________

# 4.List the top five people having the highest income.
select Ind_ID as Applicant_ID, Annual_income from credit_card order by Annual_income desc limit 5;

#______________________________________________________________________________________________________________________________

# 5.Determine how many married people are having bad credit.
select cc.Ind_ID as Applicant_ID from credit_card cc
inner join credit_card_label ccl on cc.Ind_ID=ccl.Ind_ID
where Marital_status='Married' and label=1;

#______________________________________________________________________________________________________________________________

# 6.Identify the highest education level and calculate the total count.
select EDUCATION, count(*) from credit_card where EDUCATION='Academic degree';

#______________________________________________________________________________________________________________________________

# 7.Compare between married males and females, determining who has more bad credit.
select GENDER as Gender, count(*) as Bad_credit_count from credit_card cc inner join credit_card_label ccl on cc.Ind_ID=ccl.Ind_ID
where Marital_status='Married' and label=1 group by GENDER;

#______________________________________________________________________________________________________________________________