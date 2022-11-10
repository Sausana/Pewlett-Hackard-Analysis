SELECT e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
INTO retirement_titles	
FROM employees e LEFT JOIN titles t ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

select* from retirement_titles

SELECT DISTINCT ON (r.emp_no)
		r.emp_no, r.first_name, r.last_name, r.title
INTO unique_titles	
FROM retirement_titles r
WHERE r.to_date = '9999-01-01'
ORDER BY r.emp_no, r.to_date ASC


SELECT count(*) as total, title
INTO retiring_titles
FROM unique_titles ut
GROUP BY title
ORDER BY 1 DESC


SELECT DISTINCT ON (e.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
  ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;






