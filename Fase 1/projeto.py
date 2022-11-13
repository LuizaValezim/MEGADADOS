from itertools import product
from typing import Union

from fastapi import FastAPI, Body, HTTPException
from pydantic import BaseModel
from fastapi.responses import HTMLResponse

app = FastAPI()

def acha_produto(inventario, id_achar, produto):
    list_prod = inventario[id_achar]
    for produto in list_prod:
        if produto.id_prod == id_achar:
            return produto, id_achar
    return None, None

inventario = [{'id_prod':0, 'nome' : "mentos", 'preco': 3.00, 'quantidade' : 20 },
         {'id_prod':1, 'nome' : "acai", 'preco': 15.00, 'quantidade' : 7 },
         {'id_prod':2, 'nome' : "coca", 'preco': 6.90, 'quantidade' : 15},
         {'id_prod':3, 'nome' : "alho", 'preco': 3.50, 'quantidade' : 7}
]
class Produto(BaseModel):
    id_prod: int
    nome: str
    preco: float
    quantidade : int
    
# Cria Produto no Inventario
@app.post("/produtos/", status_code=201, response_model=Produto, tags=["produto"])
async def cria_produto(produto: Produto = Body(
        example={
            "id_prod": 1,
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
    {
    "id_prod": 1,    
    "nome":"mentos", 
    "preco": 3.00,
    "quantidade":15
    }
    """
    produto, id_prod = acha_produto(inventario, id_produto, produto)
    return produto

# Atualiza Detalhes e Quantidade de Produtos
@app.put("/produtos/{id_produto}", tags=["produto"])
async def subscreve_produto(
    id_produto : int, 
    produto: Produto = Body(
    example={
        "id_prod": 3,
        "nome": "chiclete",
        "preco": 4.50,
        "quantidade": 20
        })):
    """
    Edite as informações abaixo:
    - nome: nome de cada produto
    - preco: preço unitário do produto (em reais)
    - quantidade: quantidade do produto no inventário
    """
    inventario[id_produto] = produto
    return {'id_produto': id_produto, 'produto': produto}

# Remove Produto do Inventario
@app.delete("/produtos/{id_produto}", tags=["produto"])
async def apaga_produto(id_produto : int, produto : Produto = Body):
    """
    Remove Produto do Inventário
    """
    produto_apagar, id_apagar = acha_produto(inventario, id_produto, produto)
    inventario.pop(id_apagar)
    return {'Removido': produto}
