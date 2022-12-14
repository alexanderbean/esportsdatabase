-- EXAMPLE OF QUERIES/VIEWS USING THE ESPORTS DATABASE


-- Simple one-table queries

SELECT *
FROM customer
WHERE cusFirst like 'C%';

SELECT *
FROM media_team;

SELECT concat(vContactFirst, ' ', vContactLast) 'Vendor Contract', 
vZip 'Zip Code'
FROM vendor
WHERE vZip = 02917;

-- Testing joins throughout e-sports section of database

SELECT p.playerTag AS 'Player Tag',
p.employeeID AS 'Player Emp ID',
c.coachTag AS 'Coach Tag',
c.employeeID AS 'Coach Emp ID'
FROM player p
JOIN coach c
ON p.teamID = c.teamID;

SELECT e.employeeID AS 'Emp ID',
concat(e.empFirst, ' ', e.empLast) AS 'Full Name',
p.playerTag as 'Player Tag',
p.teamID AS 'Team ID'
FROM employee e
JOIN player p
on e.employeeID = p.employeeID;

SELECT  t.teamAbv, t.teamName, c.coachTag, 
e.empFirst, e.empLast, 
l.leagueAbv, l.leagueName, 
v.gameName, t.begDate, t.endDate
FROM video_game v
JOIN league l
ON v.gameID = l.gameID
LEFT JOIN team t
ON l.leagueID = t.leagueID
LEFT JOIN coach c
ON t.teamID = c.teamID
LEFT JOIN employee e
ON c.employeeID = e.employeeID;

SELECT  t.teamAbv, t.teamName, c.coachTag, 
e.empFirst, e.empLast, 
l.leagueAbv, l.leagueName, 
v.gameName, t.begDate, t.endDate
FROM video_game v
JOIN league l
ON v.gameID = l.gameID
LEFT JOIN team t
ON l.leagueID = t.leagueID
LEFT JOIN coach c
ON t.teamID = c.teamID
LEFT JOIN employee e
ON c.employeeID = e.employeeID
WHERE t.teamName IS NOT NULL;

-- Recursive relationship within Employee table

select e.employeeID, e.empFirst, e.empLast, e.joinDate, 
m.employeeID "managerID",
m.empFirst "mngFirst",
m.empLast "mngLast"
from employee e
join employee m
on e.reportsTo = m.employeeID;

-- Aggregate queries

SELECT concat(empFirst, ' ', empLast) AS employee, salary
FROM employee
WHERE salary = (select min(salary) Lowest from Employee)
OR salary = (select MAX(salary) Highest from Employee);

SELECT count(*)
FROM employee
WHERE eState = 'MA';

SELECT avg(salary) 'Average Salary'
FROM employee;

-- Hiring a new coach and creating a new team

INSERT into employee(empFirst, empLast, joinDate, exitDate, salary, eAddress, eCity, eState, eZIP, deptID, reportsTo, buildingID)
VALUES ("Daehee", "Park", "2022-12-01", NULL, 125890, "1108 Smith St", "Providence", "RI", "02908", 4, 4, 2);

UPDATE team SET teamName = 'Bryant Storm',
teamAbv = 'BRS',
begDate = '2022-12-01'
where leagueID = 2;

INSERT INTO coach(coachTag, employeeID, teamID)
VALUES ("Crusty", 51, 2);

-- Creating views for specific departments

CREATE VIEW vw_financeDept AS 
    SELECT e.empFirst, e.empLast, e.salary, e.deptID, e.joinDate, e.eState, e.eZip,
    d.deptName,
    p.contractCost
    FROM employee e
    JOIN department d
    ON e.deptID = d.deptID
    LEFT JOIN player p
    ON e.employeeID = p.employeeID;

SELECT empFirst 'Emp First', empLast 'Emp Last', eState 'State', eZip 'Zip', salary 'Salary', contractCost 'Contract Cost'
FROM vw_financeDept
ORDER BY empLast;

SELECT empFirst 'Emp First', empLast 'Emp Last', eState 'State', eZip 'Zip', salary 'Salary', contractCost 'Contract Cost'
FROM vw_financeDept
ORDER BY salary DESC; 

CREATE VIEW vw_LoLCoach AS
    SELECT e.employeeID, e.empFirst, e.empLast,
    p.playerTag, p.contractStart, p.contractEnd,
    t.teamID, t.teamName, t.teamAbv, t.begDate, t.endDate,
    v.gameID, v.gameName, v.gameDesc,
    l.leagueID, l.leagueName, l.leagueAbv
    FROM employee e
    RIGHT JOIN player p
    ON e.employeeID = p.employeeID
    LEFT JOIN team t
    ON p.teamID = t.teamID
    RIGHT JOIN league l
    ON t.leagueID = l.leagueID
    JOIN video_game v
    ON l.gameID = v.gameID
    WHERE v.gameID = 2;

-- shows that coach can only see their specific team

SELECT employeeID 'Emp ID', empFirst 'Emp First', empLast 'Emp Last',
    playerTag AS 'Player IGN', contractStart 'Contract Start Date', contractEnd 'Contract End Date',
    teamName 'Team Name', teamAbv 'Team Abv', begDate 'Team Beg Date', endDate 'Team End Date',
    gameName 'Game Name',
    leagueName 'League Name', leagueAbv 'League Abv'
FROM vw_LoLCoach
ORDER BY empLast;

-- next 2 queries show that coach CANNOT see OTHER team or player info

SELECT employeeID 'Emp ID', empFirst 'Emp First', empLast 'Emp Last',
    playerTag AS 'Player IGN', contractStart 'Contract Start Date', contractEnd 'Contract End Date',
    teamName 'Team Name', teamAbv 'Team Abv', begDate 'Team Beg Date', endDate 'Team End Date',
    gameName 'Game Name',
    leagueName 'League Name', leagueAbv 'League Abv'
FROM vw_LoLCoach
WHERE gameID = 4
ORDER BY empLast;

SELECT employeeID 'Emp ID', empFirst 'Emp First', empLast 'Emp Last',
    playerTag AS 'Player IGN', contractStart 'Contract Start Date', contractEnd 'Contract End Date',
    teamName 'Team Name', teamAbv 'Team Abv', begDate 'Team Beg Date', endDate 'Team End Date',
    gameName 'Game Name',
    leagueName 'League Name', leagueAbv 'League Abv'
    FROM vw_LoLCoach
    WHERE empLast = "Gallagher";