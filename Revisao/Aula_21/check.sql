USE emprestimos;
ALTER TABLE usuario ADD CONSTRAINT chk_saldo CHECK (saldo >= 0.0);
ALTER TABLE emprestimo ADD CONSTRAINT chk_emprestimo CHECK (valor_atual >= 0.0);
