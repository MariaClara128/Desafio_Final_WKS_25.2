CREATE TABLE Cliente (
    CPF VARCHAR(11),
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Endereco VARCHAR(150),
    Idade INT,
    Data_cadastro DATE NOT NULL,
    PRIMARY KEY(CPF)
);

CREATE TABLE Funcionarios (
    Codigo_funcionario INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2),
    Data_contratacao DATE,
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    PRIMARY KEY(Codigo_funcionario)
);

CREATE TABLE Veiculos (
    Placa VARCHAR(7),
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    Ano INT,
    Valor_da_diaria DECIMAL(10,2),
    Status_veiculos ENUM('Disponível','Alugado','Em manutenção'),
    PRIMARY KEY(Placa)
);

CREATE TABLE Aluguel (
    Codigo_aluguel INT PRIMARY KEY,
    Data_inicio DATE,
    Data_fim DATE,
    Valor_total DECIMAL(10,2),
    Status_aluguel ENUM('Ativo','Concluído','Cancelado'),
    Quilometragem_inicial DECIMAL(10,2) NOT NULL, 
    Quilometragem_final DECIMAL(10,2),
    fk_Cliente_CPF VARCHAR(11) NOT NULL,
    fk_Veiculo_Placa VARCHAR(7) NOT NULL,
    FOREIGN KEY (fk_Cliente_CPF) REFERENCES Cliente(CPF),
    FOREIGN KEY (fk_Veiculo_Placa) REFERENCES Veiculos(Placa)
);

CREATE TABLE Pagamento (
    Codigo_pagamento INT PRIMARY KEY,
    Forma_de_pagamento ENUM('Pix','Cartão','Dinheiro'),
    Valor_pago DECIMAL(10,2) NOT NULL,
    Data_pagamento DATE NOT NULL,
    Status_pagamento ENUM('Pendente','Concluído'),
    Tipo_aluguel VARCHAR(50) NOT NULL,
    Seguro_incluso BOOLEAN NOT NULL,
    fk_Codigo_aluguel INT NOT NULL,
    FOREIGN KEY (fk_Codigo_aluguel) REFERENCES Aluguel(Codigo_aluguel)
);

CREATE TABLE Manutencao (
    Codigo_manutencao INT PRIMARY KEY,
    Tipo_manutencao VARCHAR(100),
    Data_manutencao DATE NOT NULL,
    Descricao TEXT NOT NULL,
    Custo DECIMAL(10,2) NOT NULL,
    Responsavel VARCHAR(255) NOT NULL
);

CREATE TABLE Registra (
    fk_Funcionario_id INT,
    fk_Aluguel_id INT,
    PRIMARY KEY (fk_Funcionario_id, fk_Aluguel_id),
    FOREIGN KEY (fk_Funcionario_id) REFERENCES Funcionarios(Codigo_funcionario),
    FOREIGN KEY (fk_Aluguel_id) REFERENCES Aluguel(Codigo_aluguel)
);

CREATE TABLE Passa_por (
    fk_Veiculo_id_Placa VARCHAR(7),
    fk_Manutencao_id INT,
    PRIMARY KEY (fk_Veiculo_id_Placa, fk_Manutencao_id),
    FOREIGN KEY (fk_Veiculo_id_Placa) REFERENCES Veiculos(Placa),
    FOREIGN KEY (fk_Manutencao_id) REFERENCES Manutencao(Codigo_manutencao)
);



INSERT INTO Cliente (CPF, Nome, Telefone, Email, Endereco, Idade, Data_cadastro)
VALUES('71734552621', 'Gabryelle Oliveira', '83998736532', 'gabryelle@email.com', 'Rua Gilberto Gomes, 100', 19, '2025-01-12'),
('71278965312', 'Maria Julia', '83998735632', 'mariajulia@email.com', 'Av Senador, 200', 19, '2024-05-20'),
('71723421413', 'Maria Clara', '8399634543', 'mariaclara@email.com', 'Rua Alfredo Pedal, 453', 18,'2025-08-13'),
('71772374221', 'Ismar Neto', '81993425522', 'ismarneto@email.com', 'Av Dom Pedro II, 123', 19, '2023-04-05'),
('71772321331', 'Julia Nunes', '83999654343', 'julianunes@email.com', 'Rua Juraci de Carvalho, 142', 19, '2022-09-01'),
('19834232421', 'Raquel Gomes', '83988997643', 'raquel@email.com', 'Rua Morador Nova, 123', 19, '2024-11-12'),
('17232632621', 'Adijair Araujo', '839997654', 'adijair@email.com', 'Av Gomes Albuquerque, 65', 21, '2025-03-01'),
('72343553421', 'Luciano Braga', '8399822343', 'luciano@email.com', 'Av Cabo Branco, 1758', 19, '2024-12-30');


INSERT INTO Funcionarios (Codigo_funcionario, Nome, Cargo, Salario, Data_contratacao, Email, Telefone) 
 VALUES(123232, 'Célia Martins', 'Atendente', 3000.00, '2022-04-15', 'celia@email.com', '83998621632'),
(192123, 'Davi Lacerda', 'Gerente',5500.00, '2021-09-15', 'davi@email.com', '83987655362'),
(132123, 'Bruno David', 'Mecânico',3500.00, '2023-04-22', 'bruno@email.com', '83997312362'),
(111133, 'Lorenna Di Lorenzo', 'Atendente', 2900.00, '2023-05-11', 'lorenna@email.com', '83999634242'),
(122333, 'Maria Luiza', 'Supervisor', 4000.00, '2021-11-20', 'mluiza@email.com', '83998812362'),
(138883, 'Lis Limeira', 'Caixa', 2500.00, '2024-03-02', 'lis@email.com', '83990931392'),
(176542, 'Felipe Gomes', 'Atendente' , 2500.00, '2022-10-01', 'felipe@email.com', '83997432362'),
(189763, 'Beatriz Costa', 'Assistente', 2300.00, '2024-09-18', 'beatriz@email.com', '83998721335');

INSERT INTO Veiculos (Placa, Modelo, Marca, Ano, Valor_da_diaria, Status_veiculos)
VALUES('ABC1234', 'Serie 3 M3', 'BMW', 1986, 850.00, 'Disponível'),
('XYZ5678', 'Type 35', 'Bugatti', 1924, 800.00, 'Disponível'),
('DEF4321', 'Dolphin', 'BYD', 2023, 980.00, 'Em manutenção'),
('GHI8765', 'Civic', 'Honda', 2019, 210.00, 'Disponível'),
('JKL6543', 'TT Coupe', 'Audi', 1998, 820.00, 'Alugado'),
('MNO3210', 'California', 'Ferrari', 2008, 765.00, 'Disponível'),
('PQR7890', 'Tracker', 'Chevrolet', 2020, 170.00, 'Disponível'),
('STU5678', 'Compass', 'Jeep', 2023, 220.00, 'Disponível');


INSERT INTO Aluguel (Codigo_aluguel, Data_inicio, Data_fim, Valor_total, Status_aluguel, Quilometragem_inicial, Quilometragem_final, fk_Cliente_CPF, fk_Veiculo_Placa)
VALUES(7711, '2025-01-10', '2025-01-15', 8000.00, 'Concluído', 1000, 1700, '71723421413', 'ABC1234'),
(2321, '2025-02-01', '2025-02-05', 1200.00,' Concluído', 3000, 3500, '72343553421', 'XYZ5678'),
(2311, '2025-02-10', '2025-02-12', 1222.00, 'Concluído', 1000, 2000, '19834232421', 'GHI8765'),
(1231, '2025-03-01', '2025-03-07', 1260.00, 'Concluído', 800, 1700, '17232632621', 'JKL6543'),
(1213, '2025-03-15', '2025-03-20', 1000.00, 'Cancelado', 300, 1400, '71734552621', 'MNO3210'),
(6732, '2025-04-01', '2025-04-05', 880.00, 'Concluído',100, 500, '71772321331', 'PQR7890'),
(4516, '2025-04-10', '2025-04-15', 1100.00,' Ativo', 600, 1200, '71772374221', 'STU5678'),
(2233, '2025-04-20', '2025-04-25', 1320.00, 'Ativo', 250, 1000, '71278965312', 'DEF4321');

INSERT INTO Pagamento (Codigo_pagamento, Forma_de_pagamento, Valor_pago, Data_pagamento, Status_pagamento, Tipo_aluguel, Seguro_incluso, fk_Codigo_aluguel)
 VALUES(8463, 'Pix', 600.00, '2025-01-15', 'Concluído', 'Mensal', TRUE, 7711),
(2123, 'Cartão', 800.00, '2025-02-05', 'Concluído', 'Diária', TRUE, 2321),
(2333, 'Dinheiro', 240.00, '2025-02-12', 'Concluído', 'Diária', TRUE, 2311),
(1345, 'Pix', 1260.00, '2025-03-07', 'Concluído', 'Mensal', TRUE, 1231),
(9993, 'Cartão', 1000.00, '2025-03-20', 'Pendente', 'Mensal', FALSE, 1213),
(4444, 'Pix', 880.00, '2025-04-05', 'Concluído', 'Diária', TRUE, 6732),
(1112, 'Dinheiro', 1100.00, '2025-04-15', 'Pendente', 'Mensal', TRUE, 4516),
(3434, 'Cartão', 1320.00, '2025-04-25', 'Pendente', 'Diária', TRUE, 2233);

INSERT INTO Manutencao (Codigo_manutencao, Tipo_manutencao, Data_manutencao, Descricao, Custo, Responsavel)
VALUES (7711, 'Preventiva', '2025-01-15', 'Troca de óleo', 150.00, 'Oficina B'),
(2321, 'Corretiva', '2025-02-05', 'Revisão de freios', 280.00, 'Oficina A'),
(2311, 'Preventiva', '2025-02-12', 'Troca de pneus', 1150.00, 'Oficina B'),
(1231, 'Corretiva', '2025-03-07', 'Bateria nova', 390.00, 'Oficina C'),
(1213, 'Preventiva', '2025-03-20', 'Revisão geral', 780.00, 'Oficina B'),
(6732, 'Preventiva', '2025-04-05', 'Alinhamento', 200.00, 'Oficina A'),
(4516, 'Preventiva', '2025-04-15', 'Troca de filtro', 100.00, 'Oficina D'),
(2233, 'Corretiva', '2025-04-25', 'Reparo no ar-condicionado', 600.00, 'Oficina C');

INSERT INTO Registra VALUES
(123232,7711),(192123,2321),(132123,2311),(111133,1231),
(122333,1213),(138883,6732),(176542,4516),(189763,2233);

INSERT INTO Passa_por VALUES
('ABC1234',7711),('XYZ5678',2321),('GHI8765',2311),('JKL6543',1231),
('MNO3210',1213),('PQR7890',6732),('STU5678',4516),('DEF4321',2233);


UPDATE Veiculos SET Status_veiculos='Alugado' WHERE Placa='STU5678';

UPDATE Pagamento SET Status_pagamento='Concluído' WHERE Codigo_pagamento=1112;

UPDATE Aluguel SET Quilometragem_final=1500, Status_aluguel='Concluído' WHERE Codigo_aluguel=4516;

SELECT YEAR(Data_cadastro) AS Ano, COUNT(*) AS Total_clientes
FROM Cliente GROUP BY YEAR(Data_cadastro);

SELECT Cargo, AVG(Salario) AS Media_salario FROM Funcionarios GROUP BY Cargo;

SELECT Marca, AVG(Valor_da_diaria) AS Media_diaria FROM Veiculos GROUP BY Marca;

SELECT Status_aluguel, SUM(Valor_total) AS Faturamento FROM Aluguel GROUP BY Status_aluguel;

SELECT Forma_de_pagamento, COUNT(*) AS Total FROM Pagamento GROUP BY Forma_de_pagamento;

SELECT Tipo_manutencao, SUM(Custo) AS Total_custo FROM Manutencao GROUP BY Tipo_manutencao;

SELECT c.Nome, a.Codigo_aluguel, a.Data_inicio, a.Data_fim, v.Modelo, v.Marca
FROM Cliente c
JOIN Aluguel a ON c.CPF=a.fk_Cliente_CPF
JOIN Veiculos v ON a.fk_Veiculo_Placa=v.Placa;

SELECT f.Nome AS Funcionario, a.Codigo_aluguel, a.Status_aluguel
FROM Funcionarios f
JOIN Registra r ON f.Codigo_funcionario=r.fk_Funcionario_id
JOIN Aluguel a ON r.fk_Aluguel_id=a.Codigo_aluguel;

SELECT v.Modelo, v.Marca, m.Tipo_manutencao, m.Custo
FROM Veiculos v
JOIN Passa_por p ON v.Placa=p.fk_Veiculo_id_Placa
JOIN Manutencao m ON p.fk_Manutencao_id=m.Codigo_manutencao;

SELECT c.Nome, a.Codigo_aluguel
FROM Cliente c
LEFT JOIN Aluguel a ON c.CPF=a.fk_Cliente_CPF;

SELECT * FROM Cliente;
SELECT * FROM Funcionarios;
SELECT * FROM Veiculos;
SELECT * FROM Aluguel;
SELECT * FROM Pagamento;
SELECT * FROM Manutencao; 