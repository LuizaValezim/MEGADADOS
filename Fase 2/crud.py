from sqlalchemy.orm import Session
import models
import schemas

def cria_produto(db: Session, produto: schemas.Cria_Inventario):
    db_produto = models.Inventario(**produto.dict())
    try:
        db.add(db_produto)
        db.commit()
    except:
        db.rollback()
    db.refresh(db_produto)
    return db_produto

def get_produto(db: Session, id_produto: int):
    return db.query(models.Inventario).filter(models.Inventario.id_produto == id_produto).first()

def get_produtos(db: Session):
    return db.query(models.Inventario).all()

def apaga_produto(db: Session, id_produto: int):
    db_produto = db.query(models.Inventario).filter(models.Inventario.id_produto == id_produto).first()
    try:
        db.delete(db_produto)
        db.commit()
    except:
        db.rollback()
    return db_produto

def atualiza_preco(db: Session, produto: schemas.Cria_Inventario, id_produto: int):
    db_produto = db.query(models.Inventario).filter(models.Inventario.id_produto == id_produto).first()
    try:
        db_produto.preco = produto.preco
        db.commit()
    except:
        db.rollback()
    db.refresh(db_produto)
    return db_produto

def atualiza_prod_mov(db: Session, movimentacao: schemas.Cria_Movimentacao):
    db_produto = db.query(models.Inventario).filter(models.Inventario.id_produto == movimentacao.id_produto).first()
    try:
        db_produto.quantidade = db_produto.quantidade + movimentacao.quantidade
        db.commit()
    except:
        db.rollback()
    db.refresh(db_produto)
    return db_produto

def cria_movimentacao(db: Session, movimentacao: schemas.Cria_Movimentacao):
    db_movimentacao = models.Movimentacao(**movimentacao.dict())
    try:
        db.add(db_movimentacao)
        atualiza_prod_mov(db, movimentacao)
        db.commit()
    except:
        db.rollback()
    db.refresh(db_movimentacao)
    return db_movimentacao

def get_movimentacao(db: Session, id_mov: int):
    return db.query(models.Movimentacao).filter(models.Movimentacao.id_movimentacao == id_mov).first()

def get_movimentacoes(db: Session):
    return db.query(models.Movimentacao).all()

def apaga_movimentacao(db: Session, id_mov: int):
    db_movimentacao = db.query(models.Movimentacao).filter(models.Movimentacao.id_movimentacao == id_mov).first()
    db_produto = db.query(models.Inventario).filter(models.Inventario.id_produto == db_movimentacao.id_produto).first()
    try:
        db_produto.quantidade -= db_movimentacao.quantidade
        db.delete(db_movimentacao)
        db.commit()
    except:
        db.rollback()
    return db_movimentacao

def atualiza_movimentacao(db: Session, id_mov: int,  mov: schemas.Cria_Movimentacao):
    db_movimentacao = models.Movimentacao(**mov.dict())
    db_movimentacao_anterior = db.query(models.Movimentacao).filter(models.Movimentacao.id_movimentacao == id_mov).first()
    db_produto = db.query(models.Inventario).filter(models.Inventario.id_produto == db_movimentacao.id_produto).first()
    db_produto_anterior = db.query(models.Inventario).filter(models.Inventario.id_produto == db_movimentacao_anterior.id_produto).first()
    try:
        if db_produto_anterior.id_produto != db_produto.id_produto:
            db_produto_anterior.quantidade -= db_movimentacao_anterior.quantidade
            db_produto.quantidade += db_movimentacao.quantidade
        else:
            db_produto_anterior.quantidade -= db_movimentacao_anterior.quantidade
            db_produto_anterior.quantidade += db_movimentacao.quantidade
            
        db_movimentacao_anterior.id_produto = id_mov
        db_movimentacao_anterior.id_produto = db_movimentacao.id_produto
        db_movimentacao_anterior.quantidade = db_movimentacao.quantidade
        db.commit()
    except:
        db.rollback()
    return db_movimentacao_anterior