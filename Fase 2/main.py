from fastapi import FastAPI, Body, Path,  Response, Request, Depends
from fastapi.exceptions import RequestValidationError
from fastapi.exception_handlers import (http_exception_handler,request_validation_exception_handler,)
from starlette.exceptions import HTTPException as StarletteHTTPException
from sqlalchemy.orm import Session
from dotenv import load_dotenv
from database import SessionLocal, engine
import crud
import models
import schemas

models.Base.metadata.create_all(bind=engine)
app = FastAPI()

@app.middleware("http")
async def db_session_middleware(request: Request, call_next):
    response = Response("Internal server error", status_code=500)
    try:
        request.state.db = SessionLocal()
        response = await call_next(request)
    finally:
        request.state.db.close()
    return response

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.exception_handler(StarletteHTTPException)
async def custom_http_exception_handler(request, exc):
    return await http_exception_handler(request, exc)

@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request, exc):
    return await request_validation_exception_handler(request, exc)

# ------------------------------------------------------------------------------------ Inventario

@app.get("/produtos/{id_produto}", status_code=200, response_model = schemas.Inventario, tags=["produto"])
async def le_produto(Session = Depends(get_db), id_produto: int = Path(ge=0)):
    """
    Procura o produto baseado em seu id
    """
    produto = crud.get_produto(db = Session, id_produto = id_produto)
    return produto


@app.get("/produtos/", status_code=200, response_model = list[schemas.Inventario], tags=["produto"])
async def le_produtos(Session = Depends(get_db)):
    """
    Lista os produtos disponíveis no Inventário
    """
    produtos = crud.get_produtos(db = Session)
    return produtos


@app.post("/produtos/", status_code=201, response_model = schemas.Inventario, tags=["produto"])
async def cria_produto(Session = Depends(get_db) , produto: schemas.Produto = Body(
        examples = {
            "chocolate": {
                "id_produto": 1,
                "nome": "Chocolate",
                "preco": 7.5
            },
        })):
    """
    Crie um produto com id, nome e preço
    """
    db_produto = crud.cria_produto(db = Session, produto = produto)
    return db_produto


@app.delete("/produtos/{id_produto}", status_code=200, response_model=schemas.Inventario, tags=["produto"])
async def apaga_produto(Session = Depends(get_db), id_produto: int = Path(ge=0)):
    """
    Apaga um produto do Inventário
    """
    return crud.apaga_produto(db = Session, id_produto = id_produto)
 

@app.put("/produtos/{id_produto}", status_code=200, response_model=schemas.Inventario, tags=["produto"])
async def subscreve_produto(Session = Depends(get_db), id_produto: int = Path(ge=0), prod: schemas.Produto = Body(
        examples = {
            "Chocolate": {
                "id_produto": 3,
                "nome" : "Chocolate",
                "preco": 7.5,
                "quantidade": 2
            },
        })):

    """
    Atualize o preco
    """
    db_produto = crud.atualiza_preco(db = Session, produto = prod, id_produto = id_produto)
    return db_produto

# ------------------------------------------------------------------------------------ Movimentação

@app.get("/movimentacao/{id_mov}", status_code=200, response_model = schemas.Movimentacao, tags=["movimentacao"])
async def le_movimentacao(Session = Depends(get_db), id_mov: int = Path(ge=0)):
    """
    Procura a movimentação baseado em seu id
    """
    return crud.get_movimentacao(db = Session, id_mov = id_mov)

@app.get("/movimentacao/", status_code=200, response_model = list[schemas.Movimentacao], tags=["movimentacao"])
async def le_movimentacoes(Session = Depends(get_db)):
    """
    Lista as movimentacoes
    """
    movimentacoes = crud.get_movimentacoes(db=Session)
    return movimentacoes

@app.post("/movimentacao/{id_produto}", status_code=201, response_model= schemas.Movimentacao, tags=["movimentacao"])
async def cria_movimentacao(Session = Depends(get_db),
movim: schemas.Cria_Movimentacao = Body(
        examples = {
            "exemplo": {
                "value": {
                    "id_movimentacao" : 1,
                    "id_produto": 2,
                    "quantidade": 20,
                }
            }
        })):
    """
    Crie uma movimentação
    """
    mov = crud.cria_movimentacao(db = Session, movimentacao = movim)
    return mov

 
@app.delete("/movimentacao/{id_mov}", status_code=200, response_model= schemas.Movimentacao, tags=["movimentacao"])
async def apaga_movimentacao(Session = Depends(get_db), id_mov: int = Path(ge=0)):
    """
    Apaga uma movimentacao
    """
    return crud.apaga_movimentacao(db = Session, id_mov = id_mov)
 

@app.put("/movimentacao/{id_mov}", status_code = 200, response_model= schemas.Movimentacao, tags=["movimentacao"])
async def subscreve_movimentacao(Session = Depends(get_db), id_mov: int = Path(ge=0),  mov: schemas.Cria_Movimentacao = Body(
        examples = {
            "Mov 1": {
                    "id_movimentacao" : 1,
                    "id_produto": 2,
                    "quantidade": 4,
            },
        })):

    """
    Atualize as informações de uma movimentação com id, quantidade
    """
    return crud.atualiza_movimentacao(db = Session, id_mov= id_mov, mov = mov)