from sqlalchemy import Column, ForeignKey, Integer, String, Float
from sqlalchemy.orm import relationship
from database import Base

class Inventario(Base):
    __tablename__ = "inventario"

    id_produto = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nome = Column(String(300), index=True)
    quantidade = Column(Integer, primary_key = True, index=True, default=0)
    preco = Column(Float)

    movimentacao = relationship("Movimentacao", back_populates="inventario", cascade="all, delete")
    
class Movimentacao(Base):
    __tablename__ = "movimentacao"
    
    id_movimentacao = Column(Integer, primary_key=True, index=True, autoincrement=True)
    id_produto = Column(Integer, ForeignKey("inventario.id_produto"))
    quantidade = Column(Integer)

    inventario = relationship("Inventario", back_populates="movimentacao")