--Challenge - MODULE 7 --

--Deliverable 1 --

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles 
FROM employees AS e
INNER JOIN titles as t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

SELECT * FROM unique_titles; 

-- Retrieve number of employees by their most recent job title who are about to retire

SELECT COUNT(ut.title), ut.title
INTO retiring_titles 
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC; 

SELECT * FROM retiring_titles; 

-- Deliverable 2 -- 
SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no=de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no=t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

DROP TABLE membership_eligibilty;
DROP TABLE mentorship_eligibilty;
	
SELECT * FROM mentorship_eligibility;

-- Titles of mentorship eligible employees --
SELECT COUNT(me.title), me.title 
INTO mentorship_titles
FROM mentorship_eligibility AS me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC; 

SELECT * FROM mentorship_titles;

-- Retiring employees in current position 10+ years 
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles_ten_years
FROM retirement_titles AS rt
WHERE (rt.from_date <= '1992-01-01') AND (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- Mentors count with 10 years tenure by title
SELECT COUNT (utty.title), utty.title
INTO ten_year_mentor_title
FROM unique_titles_ten_years as utty
GROUP BY utty.title
ORDER BY COUNT(utty.title) DESC; 

SELECT * FROM ten_year_mentor_title;
