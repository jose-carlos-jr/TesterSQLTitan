/*------ PARTE 01 ------*/

/*Produtos:
cod_prod: integer(8) primary key;
loj_prod: integer(8) Foregin key;
desc_prod: char(40);
dt_inclu_prod: Data(dd/mm/yyy);
preco_pro: float(8,3) */ 

create database teste_sql ;
use teste_sql ;
DROP TABLE Produtos ;
DROP TABLE Estoque ;
DROP TABLE Lojas ;

/* Criar a tabela */
CREATE TABLE Produtos (
cod_prod int (8) primary key, 
loj_prod int (8), 
desc_prod varchar (40), 
dt_inclu_prod date, 
preco_prod decimal (8,3) ) ;


/*Inserir os produtos*/
INSERT INTO Produtos VALUES
(170,2,"LEITE CONDESADO MOCOCA","2010-12-30",45.40),
(180,1,"CREME DE LEITE", "2010-11-20",20.50),
(190,2,"CHOCOLATE", "2010-10-25",100.50),
(200,1,"TORTA", "2010-09-20",120.50),
(210,2,"TORTA DE MORANGO", "2010-08-11",140.50),
(220,1,"TORTA DE LARANJA", "2010-07-12",170.50);


/* Modificar 0 valor */
UPDATE Produtos SET preco_prod = 95.40 WHERE cod_prod = 170;


/* Todos os dados */
SELECT * FROM Produtos;


/* Maior e menor data do produto*/
SELECT MAX(dt_inclu_prod) FROM Produtos;
SELECT MIN(dt_inclu_prod) FROM Produtos ;


/* Contar os produtos */
SELECT COUNT(cod_prod) FROM Produtos;


/* Filtro L*/
SELECT * FROM Produtos WHERE desc_prod LIKE 'L%';


/*Soma dos preço*/
SELECT SUM(preco_prod) FROM Produtos WHERE loj_prod = 1;
SELECT SUM(preco_prod) FROM Produtos WHERE loj_prod = 2;


/* SOMA MAIOR QUE 100 */
SELECT SUM(preco_prod) FROM Produtos WHERE loj_prod = 1  AND preco_prod > 100;
SELECT SUM(preco_prod) FROM Produtos WHERE loj_prod = 2  AND preco_prod > 100;




/*------ PARTE 02 ------*/

/* ESTOQUE: 
cod_prod: integer(8) FK
loj_prod: integer(8) FK
qtd_prod: decimal(15,3) */

/* Lojas:
loj_prod: integer(8) FK
desc_loj: varchar(40) */


/* Criar tabela */
CREATE TABLE Estoque (
FK_cod_prod int(8),
FK_loj_prod int(8),
qtd_prod decimal(15,3));

CREATE TABLE Lojas (
loj_prod int(8) primary key,
desc_loj varchar(40));

INSERT INTO Estoque VALUES (170, 1, 8952.1), (180, 1, 892.1), (190, 2, 852.1), (200, 2, 82.1);
SELECT * FROM Estoque;
desc Estoque;

ALTER TABLE Estoque ADD FOREIGN KEY (FK_cod_prod) REFERENCES Produtos (cod_prod);
ALTER TABLE Estoque ADD FOREIGN KEY (FK_loj_prod) REFERENCES Lojas (loj_prod);


INSERT INTO Lojas VALUES (1,"BRASIL LTDA"), (2,"ARGENTINA LTDA");
SELECT * FROM Lojas;


/* Select com relacionamentos */
SELECT Lojas.loj_prod, Lojas.desc_loj, Produtos.cod_prod, Produtos.desc_prod, Produtos.preco_prod , Estoque.qtd_prod FROM Estoque
INNER JOIN Produtos ON Estoque.FK_cod_prod = Produtos.cod_prod
INNER JOIN Lojas ON Estoque.FK_loj_prod = Lojas.loj_prod;


/* Select relacionamentos e com filtros */
SELECT * FROM Produtos WHERE cod_prod NOT IN (select FK_cod_prod from Estoque);
SELECT * FROM Estoque WHERE FK_cod_prod NOT IN (select cod_prod from Produtos) ; 