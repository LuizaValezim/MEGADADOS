from itertools import product
from typing import Union

from fastapi import FastAPI, Body, HTTPException
from pydantic import BaseModel
from fastapi.responses import HTMLResponse

app = FastAPI()

inventario = [{'nome' : "mentos", 'preco': 3.00, 'quantidade' : 20 },
         {'nome' : "acai", 'preco': 15.00, 'quantidade' : 7 },
         {'nome' : "coca", 'preco': 6.90, 'quantidade' : 15},
         {'nome' : "alho", 'preco': 3.50, 'quantidade' : 7}
]
class Produto(BaseModel):
    nome: str
    preco: float
    quantidade : int
    
# Cria Produto no Inventario
@app.post("/produtos/", status_code=201, response_model=Produto, tags=["produto"])
async def cria_produto(produto: Produto = Body(
        example={
            "nome": "chocolate",
            "preco": 7.50,
            "quantidade": 30
        })):
    """
    Crie um produto com as seguintes informações abaixo:
    - **nome**: nome de cada produto
    - **preco**: preço unitário do produto (em reais)
    - **quantidade**: quantidade do produto no inventário
    """
    produto = produto.dict()
    inventario.append(produto)
    return produto

# Pega Produto
@app.get("/produtos/{id_produto}", status_code=200, response_model = Produto, tags=["produto"])
async def le_produto(id_produto: int):
    """
    Procura o produto retorna seus dados:
    {"nome":"mentos", 
    "preco":3.00,
    "quantidade":15}
    """
    produto = inventario[id_produto]
    return produto
