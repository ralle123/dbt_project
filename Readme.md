# DBT example

create virtual environment in python - I am using virtualenvwrapper
```
mkvirtualenv [project_name]
workon [project_name]

When done use:
deactivate
```

## Step 1
Install the library
pip install dbt-postgres


dbt --version
Core:
  - installed: 1.4.5
  - latest:    1.4.5 - Up to date!

Plugins:
  - postgres: 1.4.5 - Up to date!

### setup postgress locally
In this example we are setting up a local instance of postgress on the local machine

```docker
docker run --name postgresql -e POSTGRES_USER=myusername -e POSTGRES_PASSWORD=mypassword -p 5432:5432 -v /Users/test/code/dbt/data:/var/lib/postgresql/data  -d postgres
```

```SQL
create schema source;

CREATE TABLE source.users (
 id bpchar(36) NULL,
 user_name varchar(60) null,
 email varchar(60) null
);

INSERT INTO "source".users
(id, user_name, email)
VALUES
('1', 'jon', 'jon@acme.com'),
('2', 'jane', 'jane@acme.com'),
('3', 'doe', 'doe@acme.com'),
('4', 'willy', 'willy@acme.com'),
('5', 'peter', 'peter@acme.com'),
('6', 'john', 'john@acme.com'),
('7', 'paul', 'paul@acme.com'),
('8', 'ringo', 'ringo@acme.com');

select * from "source".users;
```
# create the dbt project
dbt init users

dbt debug  -- test connection

change schema.yml to:
```
version: 2

sources:
  - name: source
    tables:
      - name: users
```

Create a table instead of a view by editing users project dbt_project.yml
```
models:
  users: # name of the project
    # Config indicated by + and applies to all files under models/example/
    example:
      +materialized: table
```

run everything
dbt run