from unicodedata import name
from pydantic import BaseModel
from pydantic import Field

class Produto(BaseModel):
    id_produto: int 
    nome: str
    preco: float
    quantidade: int

class Cria_Inventario(Produto):
    pass

class Atualiza_Inventario(Produto):
    preco: float

class Inventario(Produto):
    quantidade : int = Field(default = 0)
    class Config:
        orm_mode = True

class MovimentacaoBase(BaseModel):
    id_movimentacao: int 
    quantidade : int 

class Cria_Movimentacao(MovimentacaoBase):
    id_produto: int
    pass

class Movimentacao(MovimentacaoBase):
    id_produto: int
    class Config:
        orm_mode = True