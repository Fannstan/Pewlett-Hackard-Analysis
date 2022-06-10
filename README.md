# Pewlett-Hackard-Analysis

## Overview of Analysis
Pewlett Hackard is facing a "silver tsunami" where many of the company's employees are reaching retirement age.  Pewlett Hackard has asked that the number of retiring employees per job title be determined. The company has also asked that employees who are eligible to participate in a mentorship program be identified, Pewlett Hackard plans to use this program to internally fill the large number of job vacancies that will happen once senior employees begin to retire. 

## Results: 
- The analysis started with creating a table containing all employees of retirement age, their job title, and their employment dates.  This table was titled, 'retirement_titles', and holds 133,776 rows of retirement eligible employee data.  The reason this output was so large is that this table includes multiple rows for a single employee, the table shows each job change that a retirement eligible employee has taken during their tenure at Pewlett Hackard: 

![retirement_titles_table](https://user-images.githubusercontent.com/103215123/173120471-be2efd39-beef-477f-aa90-955bc86f7901.png)

- The 'retirement_titles' table was narrowed down using the DISTINCT ON statement to get the first occurrence of the employee number.  The table was further narrowed by excluding employees that have already left the company by filtering on the 'to_date'.  The output from this query was then put into the 'unique_titles' table with an output of 72,458 rows: 

![unique_titles_table](https://user-images.githubusercontent.com/103215123/173122546-5ffedda4-fd3a-4efc-9e8a-5b6ea4dd3f96.png)

- The 'unique_titles' table was used to create a new table that retrieves the count of retirement eligible employees by their current job title:

![retiring_titles_table](https://user-images.githubusercontent.com/103215123/173123374-e8fdd9ff-4753-46ac-b4de-19932f8c2628.png)

- The analysis then moved on to retrieve the employees who are eligible to be mentored by the retirement eligible employees. The output for this query was put into the 'mentorship_eligibility' table, there are 1,549 employees who are currently eligible to enter into the mentorship program: 

![mentorship_eligibility_table](https://user-images.githubusercontent.com/103215123/173124338-7c6bda83-3096-4e94-a61a-ed1f5a5b7ff9.png)

## Summary:
The above tables show that there are 72,458 roles that will eventually need to be filled as the 'silver tsunami' begins it's crash on Pewlett Hackard.  Currently there are only 1549 employees that currently fit into the mentorship eligibility program. The below two queries show the count of mentorship eligible employees by title and the count of retiring employees who have been in their current position for at least 10 years: 

Mentorship eliblible employee (the mentees) count by title: 

![mentorship_titles_table](https://user-images.githubusercontent.com/103215123/173130442-e9a9c053-88be-42c9-8ffa-9f33387b93b8.png)

Retiring employees who have been in current position for 10 or more years: 

![10 year mentors](https://user-images.githubusercontent.com/103215123/173130980-198c11af-4df2-4cec-983f-04b3427ea9ce.png)

When comparing the two tables above, it does appear that there will be enough qualified employees who are retirement eligibile to mentor the next generation of Pewlett Hackard employees. 

