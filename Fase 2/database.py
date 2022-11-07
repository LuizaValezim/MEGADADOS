from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy_utils import database_exists, create_database
from dotenv import load_dotenv
import os

load_dotenv('.env')

# Credenciais do Banco de Dados
SQL_USER = os.getenv("MEGADADOS_USER")
SQL_PASSWORD = os.getenv("MEGADADOS_PASSWORD")
SQL_SERVER = os.getenv("MEGADADOS_SERVER")
SQL_DB = os.getenv("MEGADADOS_DB")

# URL do nosso Database
SQLALCHEMY_DATABASE_URL = f"mysql://{SQL_USER}:{SQL_PASSWORD}@{SQL_SERVER}/{SQL_DB}"

# Checando se o database ja existe
if not database_exists(SQLALCHEMY_DATABASE_URL):
    create_database(SQLALCHEMY_DATABASE_URL)
    
# Criação da Engine
engine = create_engine(
    SQLALCHEMY_DATABASE_URL
    )

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()