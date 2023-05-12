# Data-Warehouse-design-excercise

## Learning Objectives

-   To be able to refactor a table to 1NF, 2NF and 3NF
-   To be able to implement a star schema
-   To be able to implement an ERD
---
All of the data we have on our models are currently being held in one big SQL table which you can create locally by running `models.sql`.

---
## Our first task is to normalise the data **without mutating** our original data:

-   Create new files for each of your Normal Forms
-   Remember that you can print the output of the file to a new file with the command below:

```
psql -f file_name.sql > file_name.txt
```

## Part I - OLTP

---

### 1. First Normal Form (1NF)

The rules we can follow are:

-   We must have no duplicate rows
-   Each cell must only contain a single value
-   Each value cannot be split down further

Print the result to a txt file called `1NF.txt`

<br>

### 2. Second Normal Form (2NF)

We will then need to refactor to 2NF:

-   Table must not violate the rules set out by 1NF
-   No partial dependencies - Non-prime attributes must be fully dependant on the candidate key.

Print the result to a txt file called `2NF.txt`

<br>

### 3. Third Normal Form (3NF)

Lastly refactor to 3NF:

-   Table must not violate the rules set out by 2NF
-   No transitive dependencies - fields must be determined by the primary / composite key

Print the result to a txt file called `3NF.txt`

### 4. Entity Relationship Diagram (ERD)

An `ERD` is a helpful visual representation of how relational tables fit together in a database.
Use the following free software to build an ERD to document the database in it's three forms.
https://dbdiagram.io/home
You can save a screen shot to this repo.

## Part II - OLAP

### 1. Building a star schema

We want to make our database easier and more efficient to analyse.
We should redesign the database into a star schema.

Things to consider:

-   **dimensions** - what can we extract? What metrics will these allow us to measure?
-   **facts** - what does this table look like? How can do we create the link to dimensions.

## 2. Entity Relationship Diagram (ERD)

Create another ERD to represent how our tables now link together.
