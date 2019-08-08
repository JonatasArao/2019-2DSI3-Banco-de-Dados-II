CREATE DATABASE bd_pizzaria;
USE bd_pizzaria;

CREATE TABLE tb_pizza (
	cd_pizza INT UNSIGNED
		NOT NULL
        AUTO_INCREMENT
        PRIMARY KEY,
	nm_sabor VARCHAR(60)
		NOT NULL,
	vl_preco DOUBLE
		NOT NULL
);

CREATE TABLE tb_cliente (
	cd_cliente INT UNSIGNED
		NOT NULL
		AUTO_INCREMENT
        PRIMARY KEY,
	nm_cliente VARCHAR(128)
		NOT NULL,
	dt_nascimento DATE
		NOT NULL
);

CREATE TABLE tb_pedido (
	cd_pedido INT UNSIGNED
		NOT NULL
		AUTO_INCREMENT
        PRIMARY KEY,
	dt_pedido DATETIME
		NOT NULL,
	id_cliente INT UNSIGNED
		NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES tb_cliente(cd_cliente)
);

CREATE TABLE tb_pizza_pedido (
	cd_pizza_pedido INT UNSIGNED
		NOT NULL
		AUTO_INCREMENT
		PRIMARY KEY,
	id_pizza INT UNSIGNED
		NOT NULL,
	id_pedido INT UNSIGNED
		NOT NULL,
	nr_qtd INT
		NOT NULL,
	FOREIGN KEY (id_pizza) REFERENCES tb_pizza(cd_pizza),
    FOREIGN KEY (id_pedido) REFERENCES tb_pedido(cd_pedido)
);

INSERT INTO tb_pizza (nm_sabor, vl_preco) VALUES 
('Mussarela',20),
('Portuguesa',22),
('Muçalera com Bacon',22),
('Três queijos',24),
('Calabresa',24),
('Calabresa com Cheddar', 28),
('Calabresa com Muçarela',28),
('Bacon com o queijo da casa',28),
('Bacon com Cheddar',30),
('Quatro Queijos',30),
('Margherita',30),
('Frango com Catupiry',30),
('Frango com Cheddar',30),
('Frango com Bacon',32),
('Atum',32),
('Brigadeiro',35),
('Beijinho',35),
('Beijinho e brigadeiro',38);

INSERT INTO tb_cliente (nm_cliente, dt_nascimento) VALUES
('Juan Ricardo',19771211),
('Rafael Yuri',19801220),
('Lívia Ayla',19900610),
('Carla Emily',19810219),
('Carlos Ducati',19660321),
('Davi Amaral',19570420),
('João Machado', 19910225),
('Jose Monteiro',19460519),
('Sônia Dias',20001219),
('Leonardo da Cruz',19800612),
('Bernardo Silva',19990209),
('Benício Barros',19700319),
('Lívia Freitas',19830819),
('Tânia da Rosa',20001127),
('Julia Lima',20010926),
('Tânia da Mata',19870622),
('Mariah Santos',19570315),
('Maya Lima',20000406),
('Mirella Aragão',19851006),
('Rafael Monteiro', 19900112);

SELECT * FROM tb_cliente;
SELECT * FROM tb_pizza;
SELECT * FROM tb_pizza_pedido;
SELECT * FROM tb_pedido;

ALTER TABLE tb_pedido
ADD COLUMN ds_pedido VARCHAR(128);

ALTER TABLE tb_pizza_pedido
DROP COLUMN nr_qtd;

ALTER TABLE tb_pizza_pedido
ADD COLUMN qt_pizza INT
	NOT NULL;

INSERT INTO tb_pedido (dt_pedido,id_cliente,ds_pedido) VALUES
(20190907,3,'Sem ervilha');

INSERT INTO tb_pizza_pedido (id_pizza,id_pedido,qt_pizza) VALUES
(2,1,2);

 CREATE TABLE tb_funcionario (
	cd_funcionario INT UNSIGNED
		NOT NULL
		AUTO_INCREMENT
        PRIMARY KEY,
	nm_funcionario VARCHAR(128)
		NOT NULL,
	nm_cargo VARCHAR(60)
		NOT NULL
);

ALTER TABLE tb_pedido
ADD COLUMN id_funcionario INT UNSIGNED
	NOT NULL;
    
ALTER TABLE tb_pedido 
	ADD FOREIGN KEY (id_funcionario) 
		REFERENCES tb_funcionario(cd_funcionario);

desc tb_funcionario;
desc tb_pedido;