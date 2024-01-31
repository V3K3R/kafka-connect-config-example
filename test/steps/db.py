from behave import given
from sqlalchemy import create_engine, text
from sqlalchemy.orm import Session
from sqlalchemy.sql import column, insert, table

from conftest import settings


DSN = f"postgresql+psycopg2://{settings.db_user}:{settings.db_password}@{settings.db_host}:{settings.db_port}/{settings.database}"
engine = create_engine(DSN)

@given('we have the following empty tables created')
def empty_table_step(context):
    with Session(engine) as session:
        for row in context.table:
            session.execute(text(f"TRUNCATE {row['table']} CASCADE"))
        session.commit()


@given('we insert the following data into table "{db_table}"')
def empty_table_step(context, db_table):
    schema_name, table_name = db_table.split(".")

    table_ = table(
        table_name, *(column(c.lower()) for c in context.table.headings)
    )
    with Session(engine) as session:
        session.execute(text(f"SET search_path TO {schema_name}"))  # dangerous!!!
        
        for row in context.table:
            values = dict(zip(context.table.headings, row.cells))
            statement = insert(table_).values(**values)
            session.execute(statement)
        session.commit()
