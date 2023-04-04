

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