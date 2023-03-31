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