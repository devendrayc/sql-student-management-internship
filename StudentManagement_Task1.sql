-- ============================================================
-- SQL Data Analysis Internship - Task 1
-- Student Management Database
-- ============================================================

-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================

CREATE DATABASE IF NOT EXISTS StudentManagement;
USE StudentManagement;

DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    StudentID     INT PRIMARY KEY AUTO_INCREMENT,
    Name          VARCHAR(50),
    Gender        CHAR(1),
    Age           INT,
    Grade         VARCHAR(2),
    MathScore     INT,
    ScienceScore  INT,
    EnglishScore  INT
);

-- ============================================================
-- 2. INSERT DATA (10+ records with variety)
-- ============================================================

INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
('Aarav Sharma',   'M', 15, '9A',  85, 78, 88),
('Priya Nair',     'F', 16, '10A', 92, 95, 89),
('Rohan Mehta',    'M', 15, '9B',  67, 72, 74),
('Sneha Kapoor',   'F', 16, '10B', 78, 82, 91),
('Karan Verma',    'M', 14, '9A',  55, 60, 65),
('Ananya Iyer',    'F', 15, '9B',  95, 91, 93),
('Vikram Singh',   'M', 16, '10A', 60, 58, 62),
('Divya Rao',      'F', 14, '9A',  88, 85, 80),
('Aditya Joshi',   'M', 15, '9B',  72, 68, 70),
('Meera Pillai',   'F', 16, '10B', 81, 89, 84),
('Rajesh Kumar',   'M', 17, '10A', 90, 87, 92),
('Isha Reddy',     'F', 15, '9A',  63, 66, 69);

-- ============================================================
-- 3. SQL QUERIES TO PERFORM
-- ============================================================

-- Query 1: Show all student details
SELECT * FROM Students;

-- Query 2: Average score in each subject
SELECT
    AVG(MathScore)    AS AvgMath,
    AVG(ScienceScore) AS AvgScience,
    AVG(EnglishScore) AS AvgEnglish
FROM Students;

-- Query 3: Top performer (highest total score)
SELECT
    StudentID,
    Name,
    (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- Query 4: Count students per grade
SELECT
    Grade,
    COUNT(*) AS NumStudents
FROM Students
GROUP BY Grade
ORDER BY Grade;

-- Query 5: Average score (overall, across subjects) by gender
SELECT
    Gender,
    AVG((MathScore + ScienceScore + EnglishScore) / 3.0) AS AvgOverallScore
FROM Students
GROUP BY Gender;

-- Query 6: Students with Math > 80
SELECT
    StudentID,
    Name,
    MathScore
FROM Students
WHERE MathScore > 80;

-- Query 7: Update a student's grade
-- Example: promote Karan Verma from 9A to 9B
UPDATE Students
SET Grade = '9B'
WHERE Name = 'Karan Verma';

-- Verify the update
SELECT StudentID, Name, Grade FROM Students WHERE Name = 'Karan Verma';


-- ============================================================
-- SHORT REPORT: QUERY RESULTS EXPLAINED
-- ============================================================
-- 1. All Student Details:
--    Returns the full roster of 12 students with demographics
--    (Gender, Age, Grade) and their scores in Math, Science, English.
--
-- 2. Average Score per Subject:
--    Shows class-wide performance per subject. This dataset gives
--    roughly: Math ~77.2, Science ~77.6, English ~79.75 -- English
--    is the strongest subject on average, Math is slightly weaker,
--    suggesting Math may need more academic support/intervention.
--
-- 3. Top Performer:
--    Identifies the student with the highest combined score across
--    all three subjects (Ananya Iyer, total = 279) -- useful for
--    recognizing high achievers or informing merit-based decisions.
--
-- 4. Count of Students per Grade:
--    Breaks down class size by grade section (9A, 9B, 10A, 10B),
--    helping assess whether class sizes are balanced.
--
-- 5. Average Score by Gender:
--    Compares overall academic performance between male and female
--    students, useful for spotting gender-based performance gaps
--    that may warrant further investigation (not causal conclusions).
--
-- 6. Students with Math > 80:
--    Flags high Math performers (Priya, Ananya, Divya, Rajesh) --
--    could be considered for advanced math tracks or peer tutoring
--    roles.
--
-- 7. Update a Student's Grade:
--    Demonstrates the UPDATE statement by moving a student to a new
--    grade section, confirming that data can be modified after
--    initial insertion (e.g., due to reassignment or promotion).
-- ============================================================
