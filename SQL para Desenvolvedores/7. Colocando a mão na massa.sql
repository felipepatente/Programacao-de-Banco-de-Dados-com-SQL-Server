DROP TABLE Alunos

CREATE TABLE Alunos
(
	Id INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(80) NOT NULL,
	CPF CHAR(11) NOT NULL,
	Cidade VARCHAR(60) NOT NULL,
	Estado CHAR(2) NOT NULL,
	DataNascimento DATE,
	Ativo BIT DEFAULT 1
)


CREATE TABLE Categorias
(
	Id INT PRIMARY KEY IDENTITY,
	Descricao VARCHAR(80) NOT NULL,
	CadastradoEm DATETIME DEFAULT GETDATE()
)

CREATE TABLE Cursos
(
	Id INT PRIMARY KEY IDENTITY,
	CategoriaId INT NOT NULL,
	Descricao VARCHAR(80) NOT NULL,
	TotalHoras INT NOT NULL,
	Valor DECIMAL(12, 2) NOT NULL DEFAULT 0,
	CadastradoEm DATETIME DEFAULT GETDATE(),
	Ativo BIT DEFAULT 1,

	CONSTRAINT fk_categoria_id FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id)
)

CREATE TABLE AlunosCursos
(
	AlunoId INT NOT NULL,
	CursoId INT NOT NULL,
	CadastradoEm DATETIME DEFAULT GETDATE(),

	CONSTRAINT pk_alunos_cursos PRIMARY KEY(AlunoId, CursoId),
	CONSTRAINT fk_aluno_id FOREIGN KEY (AlunoId) REFERENCES Alunos(Id),
	CONSTRAINT fk_curso_id FOREIGN KEY (CursoId) REFERENCES Cursos(Id)

)

INSERT INTO 
	Alunos (Nome, CPF, Cidade, Estado, DataNascimento)
VALUES
	('Rafael',  '00000000001', 'Aracaju',		 'SE', '2000-01-01'),
	('Eduardo', '00000000001', 'São Paulo',		 'SP', '2000-02-02'),
	('Bruno',   '00000000001', 'São Paulo',		 'SP', '2000-03-03'),
	('Tiago',   '00000000001', 'Rio de Janeiro', 'RJ', '2000-04-04'),
	('Heloysa', '00000000001', 'Aracaju',		 'SE', '2000-05-05')

SELECT * FROM Alunos

INSERT INTO 
	Categorias (Descricao)
VALUES
	('Acesso a dados'),
	('Segurança'),
	('WEB')

SELECT * FROM Categorias

INSERT INTO
	Cursos (Descricao, CategoriaId, TotalHoras, Valor)
VALUES
	('EF Core',							1, 17, 300),
	('SQL Server',						1, 5, 200),
	('ASP.NET Core Enterprise',			3, 5, 200),
	('Fundamentos de IdentityServe4',	2, 5, 200)

SELECT * FROM Cursos

INSERT INTO 
	AlunosCursos (AlunoId, CursoId)
VALUES 
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 1),
	(4, 4),
	(5, 1),
	(5, 2),
	(5, 3)

SELECT * FROM AlunosCursos