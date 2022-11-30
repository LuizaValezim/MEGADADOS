from unicodedata import name
from pydantic import BaseModel
from pydantic import Field

class Produto(BaseModel):
    id_produto: int 
    nome: str
    preco: float

class Cria_Inventario(Produto):
    pass

class Inventario(Produto):
    quantidade : int = Field(default = 0)
    class Config:
        orm_mode = True

class Movimentacao(BaseModel):
    id_movimentacao: int = Field(default=None)
    quantidade: int

class Cria_Movimentacao(Movimentacao):
    id_produto: int
    pass

class Movimentacao_Produto(Movimentacao):
    id_produto: int
    class Config:
        orm_mode = True