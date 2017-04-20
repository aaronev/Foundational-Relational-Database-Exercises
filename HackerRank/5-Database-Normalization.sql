--https://www.hackerrank.com/domains/databases/database-normalization

--Database Normalization #1 - 1NF

  The following unnormalized table named PRODUCT is transformed to first normal 
  form (1NF) by splitting it into two tables which have X and Y rows (such that X <Y) 
  respectively. Both the tables have Z columns.
  *Product-ID*    *Colors*    *Price*
  1               Red,Green   15.0
  2               Blue        18.0
  3               Yellow,Pink 2.5
  What are the values of X, Y, Z? Enter these integers, each on a new line, in the 
  text-box below. Do not leave any leading or trailing spaces

  ANSWER: 3 5 2

--Database Normalization #2 - 1/2/3 NF

  A particular database is normalized to satisfy a particular level of normalization 
  (either 1NF or 2NF or 3NF). One of the tables contains, among other fields, a column 
  for the City and a column for the Zip Code. Assuming that there is a many-to-one 
  mapping between the set of Zip Code(s) and City, we may conclude that the database 
  is definitely NOT in NF form. What is the integer x (1, 2, or 3)? Fill your answer 
  in the text box below.

  ANSWER: 3

--Database Normalization #3

  A database used by a college’s application stores the relationship between students 
  and the courses they are enrolled in. We have information for each STUDENT (such as 
  name, date of birth, date of enrollment, student-id) and COURSE (course code, instructor, 
  etc.). In real life, a student takes several courses simultaneously while a subject is 
  studied by several students. We need to capture this many-to-many relationship in our 
  database. From the above information, what is the minimum number of tables required to 
  structure this database in accordance with the rules of 2NF normalization?

  ANSWER: 3

  --Database Normalization #4

  A database, normalized as per 2NF rules, has been split into 10 tables. Each of the 
  tables has exactly two columns: one key attribute and one non-key attribute. What is 
  the minimum number of tables required to express this database in 3NF form? Enter the 
  integer in the text box below. Do not leave any leading or trailing spaces.

  ANSWER: 10

--Database Normalization #5

  Consider the following relation and determinants.

  R(a, b,c,d)

                     a,c -> b,d
                     a,d -> b
          Also, a,b is a primary key for the above relation.
  The above relation is in x NF form where x may take the following values {1,2,3,3.5} corresponding to {1NF, 2NF, 3NF and BCNF} respectively. 
  What is the maximum possible value of x such that the above relation satisfies the *x*NF form? 
  Your answer should only be restricted to one of these numbers:1/2/3/3.5 Do not leave any leading or trailing spaces.

  ANSWER: 3

















