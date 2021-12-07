drop table if exists Autoria_de_Livro ;
drop table if exists Autoria_de_Monografia ;
drop table if exists Palavra_chave_descreve_Publicacao ;
drop table if exists Reserva ;
drop table if exists Livro_em_Lista_leitura ;
drop table if exists Area_Tematica ;
drop table if exists Autor ;
drop table if exists Capitulo_ou_Artigo ;
drop table if exists Edicao_de_Livro ;
drop table if exists Edicao_de_Periodico ;
drop table if exists Editora ;
drop table if exists Editora_ou_Periodico ;
drop table if exists Estado_de_conservacao ;
drop table if exists Exemplar ;
drop table if exists Feed ;
drop table if exists Livro ;
drop table if exists Monografia ;
drop table if exists Palavra_chave_tag ;
drop table if exists Periodicidade ;
drop table if exists Periodico ;
drop table if exists Publicacao ;
drop table if exists Publicacao_fisica ;
drop table if exists Publicacao_digital ;
drop table if exists Tipo_de_monografia ;
drop table if exists Andar ;
drop table if exists Armario ;
drop table if exists Emprestimo ;
drop table if exists Emprestimo_com_multa ;
drop table if exists Espaco_de_arrumacao ;
drop table if exists Lista_de_leitura ;
drop table if exists Prateleira ;
drop table if exists Revista ;
drop table if exists Utente ;
drop table if exists Utente_Suspenso ;
 
create table Autoria_de_Livro
(
   Autor_id_   Integer   not null,
   Livro_Id_   Integer   not null,
 
   constraint PK_Autoria_de_Livro primary key (Autor_id_, Livro_Id_)
);
 
create table Autoria_de_Monografia
(
   Autor_id_   Integer   not null,
   Monografia_Id_   Integer   not null,
 
   constraint PK_Autoria_de_Monografia primary key (Autor_id_, Monografia_Id_)
);
 
create table Palavra_chave_descreve_Publicacao
(
   Palavra_chave_   varchar (50)   not null,
   Publicacao_Id_   Integer   not null,
 
   constraint PK_Palavra_chave_descreve_Publicacao primary key (Palavra_chave_, Publicacao_Id_)
);
 
create table Reserva
(
   Publicacao_Id_   Integer   not null,
   Utente_Numero_   Integer   not null,
   Data_e_Hora   Datetime  unique null,
   Exemplar_escolhido_Publicacao_Id   Integer   null,
   Exemplar_Nr   tinyint   null,
 
   CONSTRAINT chk_Reserva_Exemplar_eh_da_Publicacao 
   	CHECK (
   		Exemplar_escolhido_Publicacao_Id IS NULL 
   		OR 
   		Exemplar_escolhido_Publicacao_Id = Publicacao_Id_),
   constraint PK_Reserva primary key (Publicacao_Id_, Utente_Numero_)
);
 
create table Livro_em_Lista_leitura
(
   Edicao_de_Livro_Livro_Id_   Integer   not null,
   Edicao_de_Livro_Numero_   tinyint   not null,
   Lista_de_leitura_Utente_Numero_   Integer   not null,
   Lista_de_leitura_Nome_   varchar (255)   not null,
 
   constraint PK_Livro_em_Lista_leitura primary key (Edicao_de_Livro_Livro_Id_, Edicao_de_Livro_Numero_, Lista_de_leitura_Utente_Numero_, Lista_de_leitura_Nome_)
);
 
create table Area_Tematica
(
   Id   Integer   unique not null,
   Nome   varchar (50)  not null,
   Area_Tematica_superior_Id   Integer   null,
 
   constraint PK_Area_Tematica primary key (Id),
   CONSTRAINT AK_Nome_em_Area_superior UNIQUE (Nome, Area_Tematica_superior_Id)
);
 
create table Autor
(
   id   Integer   unique not null,
   Nome   varchar (50)  unique NOT null,
 
   constraint PK_Autor primary key (id)
);
 
create table Capitulo_ou_Artigo
(
   Publicacao_Id   Integer   not null,
   Numero   tinyint   not null,
   Nome   varchar (100)  null,
 
   CONSTRAINT Capitulo_ou_Artigo___Unique_Numero_em_Publicacao	UNIQUE (Publicacao_Id, Numero),
   CONSTRAINT Capitulo_ou_Artigo___Unique_Nome_em_Publicacao 	UNIQUE (Publicacao_Id, Nome),
   constraint PK_Capitulo_ou_Artigo 		primary key (Publicacao_Id, Numero)
);
 
create table Edicao_de_Livro
(
   Livro_Id   Integer   not null,
   Publicacao_Id   Integer   not null,
   Numero   tinyint   not null,
   ISBN   Integer  unique null,
 
   constraint PK_Edicao_de_Livro primary key (Livro_Id, Numero)
);
 
create table Edicao_de_Periodico
(
   Periodico_Editora_ou_Periodico_Id   Integer   not null,
   Publicacao_Id   Integer   not null,
   Numero   smallint   unique not null,
 
   constraint PK_Edicao_de_Periodico primary key (Periodico_Editora_ou_Periodico_Id, Numero)
);
 
create table Editora
(
   Editora_ou_Periodico_Id   Integer unique  not null,
   Nome   varchar (50)   unique not null,
 
   constraint PK_Editora primary key (Nome)
);
 
create table Editora_ou_Periodico
(
   Id   Integer   unique not null,
 
   constraint PK_Editora_ou_Periodico primary key (Id)
);
 
create table Estado_de_conservacao
(
   Nome   varchar (20)   unique not null,
 
   constraint PK_Estado_de_conservacao primary key (Nome)
);
 
create table Exemplar
(
   Publicacao_Id   Integer   not null,
   Nr   tinyint   not null,
   Codigo_de_barras   Integer  unique null,
   Data_de_aquisicao   Date  null,
   RFID   Integer  unique null,
   Pode_ser_emprestado   Boolean  null,
   Estado_de_conservacao_Nome   varchar (20)   null,
   Localizacao_Andar_Numero   tinyint   null,
   Localizacao_Armario_Letra   char (1)   null,
   Localizacao_Prateleira_Numero   tinyint   null,
   
   constraint PK_Exemplar primary key (Publicacao_Id, Nr)
);
 
create table Feed
(
   Endereco   varchar(255)   unique not null,
   Editora_ou_Periodico_Id   Integer   not null,
   Periodicidade_Nome   varchar (50)   null,
   Area_Tematica_Id   Integer   null,
 
   constraint PK_Feed primary key (Endereco)
);
 
create table Livro
(
   Id   Integer   not null,
   Nome   varchar (100)  not null,
   Editora_Nome   varchar (50)   not null,
 
   constraint PK_Livro primary key (Id)
);
 
create table Monografia
(
   Publicacao_Id   Integer   not null,
   Tipo_de_monografia_Nome   varchar (30)   not null,
 
   constraint PK_Monografia primary key (Publicacao_Id)
);
 
create table Palavra_chave_tag
(
   Palavra   varchar (50)   not null,
 
   constraint PK_Palavra_chave_tag primary key (Palavra)
);
 
create table Periodicidade
(
   Nome   varchar (50)   unique not null,
 
   constraint PK_Periodicidade primary key (Nome)
);
 
create table Periodico
(
   Editora_Nome   varchar (50)   not null,
   Editora_ou_Periodico_Id   Integer not null,
   Periodicidade_Nome   varchar (50)   not null,
   ISSN   Integer  null,
   Sigla   char (8)  null,
   Nome   varchar (100)  unique not null,
 
   constraint PK_Periodico primary key (Editora_ou_Periodico_Id)
);
 
create table Publicacao
(
   Id   Integer   not null,
   Nome   varchar (255)  unique not null,
   Nome_abreviado   varchar (100)  null,
   Codigo   Integer  unique not null,
   Data_de_publicacao   Date  null,
   Ano_de_publicacao   smallint  null,
   Nr_Pags   smallint  null,
   Capa   varchar (255)  null,
   Capa_em_miniatura   varchar (255)  null,
   Qtd_Emprestimos   smallint  null default 0,
   Qtd_Acessos   smallint  null default 0,
   Data_de_aquisicao   Date   null,
   Area_Tematica_Id   Integer   null,
   relevancia   tinyint  null,
 
   constraint PK_Publicacao primary key (Id)
);
 
create table Publicacao_fisica
(
   Publicacao_Id   Integer  unique  not null,
 
   constraint PK_Publicacao_fisica primary key (Publicacao_Id)
);
 
create table Publicacao_digital
(
   Publicacao_Id   Integer  unique  not null,
 
   constraint PK_Publicacao_digital primary key (Publicacao_Id)
);
 
create table Tipo_de_monografia
(
   Nome   varchar (30)   unique not null,
 
   constraint PK_Tipo_de_monografia primary key (Nome)
);
 
create table Andar
(
   Numero   tinyint   unique not null,
 
   constraint PK_Andar primary key (Numero)
);
 
create table Armario
(
   Andar_Numero   tinyint   not null,
   Espaco_de_arrumacao_Id   Integer   not null,
   Letra   char (1)   not null,
 
   CONSTRAINT AK_Armario_Espaco_de_arrumacao UNIQUE (Espaco_de_arrumacao_Id), 
   constraint PK_Armario primary key (Andar_Numero, Letra)
);

 
create table Documento_de_identificao
(
   Utente_numero	int primary key,
   Tipo   char (4)  not null
   					CHECK (Tipo IN ('CC', 'Pssp')),
   Numero   Integer  not null,

   -- CONSTRAINT Chk_Tipo_Doc_id CHECK (Tipo_Doc_Identificacao IN ('cc', 'pssp')),
   CONSTRAINT AK_Doc_Id___Nr_and_Tipo UNIQUE (Tipo, Numero)
);

create table Emprestimo
(
   Numero   Integer   unique not null,
   Data_hora   Datetime  NOT null,
   Publicacao_Id   Integer   not null,
   Exemplar_Nr   tinyint   not null,
   Utente_Numero   Integer   not null,
   Data_de_devolucao_limite   Date  NOT null,
   Qtd_de_prolongamentos   tinyint  null,
   Data_de_devolucao   Datetime  null,
 
   constraint PK_Emprestimo primary key (Numero)
);
 
create table Emprestimo_com_multa
(
   Numero   Integer   not null,
   Valor_actual_por_atraso   Decimal (5, 2)  null,
   Valor_por_extravio   Decimal (5, 2)   null,
   Valor_total	Decimal (5, 2) null,
   Multa_paga   Boolean  NULL DEFAULT false,
 
   constraint PK_Emprestimo_com_multa primary key (Numero)
);
 
create table Espaco_de_arrumacao
(
   Id   Integer   not null,
   Nivel_de_ocupacao   tinyint  null,
   Area_Tematica_Id   Integer   null,
    
   constraint PK_Espaco_de_arrumacao primary key (Id)
);
 
create table Lista_de_leitura
(
   Utente_Numero   Integer   not null,
   Nome   varchar (255)   not null,
 
   constraint PK_Lista_de_leitura primary key (Utente_Numero, Nome)
);
 
create table Prateleira
(
   Andar_Numero   tinyint   not null,
   Armario_Letra   char (1)   not null,
   Espaco_de_arrumacao_Id   Integer   not null,
   Numero   tinyint    not null,
 
   CONSTRAINT AK_Prateleira_Espaco_de_arrumacao UNIQUE (Espaco_de_arrumacao_Id),
   constraint PK_Prateleira primary key (Andar_Numero, Armario_Letra, Numero)
);
 
create table Revista
(
   Periodico_Editora_ou_Periodico_Id   Integer   not null,
   Qtd_edicoes_nao_emprestaveis   tinyint  null,
 
   constraint PK_Revista primary key (Periodico_Editora_ou_Periodico_Id)
);
 
create table Utente
(
   Numero   Integer   unique not null,
   Nome   varchar (255)  not null,
   Telefone   Integer   NOT null,
   Morada   varchar (255)   NOT null,
   Email   varchar (100)  unique NOT null,
   Tipo_Doc_Identificacao   char (4)  not null,
   Nr_Doc_Identificacao   Integer  not null,

   CONSTRAINT Chk_Tipo_Doc_id CHECK (Tipo_Doc_Identificacao IN ('cc', 'pssp')),
   CONSTRAINT AK_Nr_doc_id_and_Tipo_doc_id UNIQUE (Tipo_Doc_Identificacao, Nr_Doc_Identificacao),
   constraint PK_Utente primary key (Numero)
);
 
create table Utente_Suspenso
(
   Numero   Integer   not null,
   Data_inicio   Date  NOT NULL,
   Data_fim   Date  NOT null,
 
   constraint PK_Utente_Suspenso primary key (Numero)
);
 
alter table Autoria_de_Livro
   add constraint FK_Autor_Autoria_de_Livro_Livro_ foreign key (Autor_id_)
   references Autor(id)
   on delete cascade
   on update cascade
; 
alter table Autoria_de_Livro
   add constraint FK_Livro_Autoria_de_Livro_Autor_ foreign key (Livro_Id_)
   references Livro(Id)
   on delete cascade
   on update cascade
;
 
alter table Autoria_de_Monografia
   add constraint FK_Autor_Autoria_de_Monografia_Monografia_ foreign key (Autor_id_)
   references Autor(id)
   on delete cascade
   on update cascade
; 
alter table Autoria_de_Monografia
   add constraint FK_Monografia_Autoria_de_Monografia_Autor_ foreign key (Monografia_Id_)
   references Monografia(Publicacao_Id)
   on delete cascade
   on update cascade
;
 
alter table Palavra_chave_descreve_Publicacao
   add constraint FK_Palavra_chave_tag_Palavra_chave_descreve_Publicacao_ foreign key (Palavra_chave_)
   references Palavra_chave_tag(Palavra)
   on delete cascade
   on update cascade
; 
alter table Palavra_chave_descreve_Publicacao
   add constraint FK_Publicacao_Palavra_chave_descreve_Publicacao_ foreign key (Publicacao_Id_)
   references Publicacao(Id)
   on delete cascade
   on update cascade
;
 
alter table Reserva
   add constraint FK_Reserva_noname_Exemplar foreign key (Exemplar_escolhido_Publicacao_Id, Exemplar_Nr)
   references Exemplar(Publicacao_Id, Nr)
   on delete restrict
   on update cascade
; 
alter table Reserva
   add constraint FK_Publicacao_fisica_Reserva_Utente_ foreign key (Publicacao_Id_)
   references Publicacao_fisica(Publicacao_Id)
   on delete cascade
   on update cascade
; 
alter table Reserva
   add constraint FK_Utente_Reserva_Publicacao_fisica_ foreign key (Utente_Numero_)
   references Utente(Numero)
   on delete cascade
   on update cascade
;
 
alter table Livro_em_Lista_leitura
   add constraint FK_Edicao_de_Livro_Livro_em_Lista_leitura_Lista_de_leitura_ foreign key (Edicao_de_Livro_Livro_Id_, Edicao_de_Livro_Numero_)
   references Edicao_de_Livro(Livro_Id, Numero)
   on delete cascade
   on update cascade
; 
alter table Livro_em_Lista_leitura
   add constraint FK_Lista_de_leitura_Livro_em_Lista_leitura_Edicao_de_Livro_ foreign key (Lista_de_leitura_Utente_Numero_, Lista_de_leitura_Nome_)
   references Lista_de_leitura(Utente_Numero, Nome)
   on delete cascade
   on update cascade
;
 
alter table Area_Tematica
   add constraint FK_Area_Tematica_noname_Area_Tematica foreign key (Area_Tematica_superior_Id)
   references Area_Tematica(Id)
   on delete set null
   on update cascade
;
 
 
alter table Capitulo_ou_Artigo
   add constraint FK_Capitulo_ou_Artigo_noname_Publicacao foreign key (Publicacao_Id)
   references Publicacao(Id)
   on delete cascade
   on update cascade
;
 
alter table Edicao_de_Livro
   add constraint FK_Edicao_de_Livro_noname_Livro foreign key (Livro_Id)
   references Livro(Id)
   on delete cascade
   on update cascade
; 
alter table Edicao_de_Livro
   add constraint FK_Edicao_de_Livro_Publicacao foreign key (Publicacao_Id)
   references Publicacao(Id)
   on delete cascade
   on update cascade
;
 
alter table Edicao_de_Periodico
   add constraint FK_Edicao_de_Periodico_noname_Periodico foreign key (Periodico_Editora_ou_Periodico_Id)
   references Periodico(Editora_ou_Periodico_Id)
   on delete cascade
   on update cascade
; 
alter table Edicao_de_Periodico
   add constraint FK_Edicao_de_Periodico_Publicacao foreign key (Publicacao_Id)
   references Publicacao(Id)
   on delete cascade
   on update cascade
;
 
alter table Editora
   add constraint FK_Editora_Editora_ou_Periodico foreign key (Editora_ou_Periodico_Id)
   references Editora_ou_Periodico(Id)
   on delete cascade
   on update cascade
;
 
 
 
alter table Exemplar
   add constraint FK_Exemplar_noname_Estado_de_conservacao foreign key (Estado_de_conservacao_Nome)
   references Estado_de_conservacao(Nome)
   on delete set null
   on update cascade
; 
alter table Exemplar
   add constraint FK_Exemplar_noname_Publicacao_fisica foreign key (Publicacao_Id)
   references Publicacao_fisica(Publicacao_Id)
   on delete cascade
   on update cascade
; 
alter table Exemplar
   add constraint FK_Exemplar_noname_Prateleira foreign key (Localizacao_Andar_Numero, Localizacao_Armario_Letra, Localizacao_Prateleira_Numero)
   references Prateleira(Andar_Numero, Armario_Letra, Numero)
   on delete set null
   on update cascade
;
 
alter table Feed
   add constraint FK_Feed_noname_Area_Tematica foreign key (Area_Tematica_Id)
   references Area_Tematica(Id)
   on delete set null
   on update cascade
; 
alter table Feed
   add constraint FK_Feed_noname_Editora_ou_Periodico foreign key (Editora_ou_Periodico_Id)
   references Editora_ou_Periodico(Id)
   on delete restrict
   on update cascade
; 
alter table Feed
   add constraint FK_Feed_noname_Periodicidade foreign key (Periodicidade_Nome)
   references Periodicidade(Nome)
   on delete set null
   on update cascade
;
 
alter table Livro
   add constraint FK_Livro_noname_Editora foreign key (Editora_Nome)
   references Editora(Nome)
   on delete restrict
   on update cascade
;
 
alter table Monografia
   add constraint FK_Monografia_Publicacao foreign key (Publicacao_Id)
   references Publicacao(Id)
   on delete cascade
   on update cascade
; 
alter table Monografia
   add constraint FK_Monografia_noname_Tipo_de_monografia foreign key (Tipo_de_monografia_Nome)
   references Tipo_de_monografia(Nome)
   on delete restrict
   on update cascade
;
 
 
 
alter table Periodico
   add constraint FK_Periodico_noname_Editora foreign key (Editora_Nome)
   references Editora(Nome)
   on delete restrict
   on update cascade
; 
alter table Periodico
   add constraint FK_Periodico_Editora_ou_Periodico foreign key (Editora_ou_Periodico_Id)
   references Editora_ou_Periodico(Id)
   on delete cascade
   on update cascade
; 
alter table Periodico
   add constraint FK_Periodico_noname_Periodicidade foreign key (Periodicidade_Nome)
   references Periodicidade(Nome)
   on delete restrict
   on update cascade
;
 
alter table Publicacao
   add constraint FK_Publicacao_Publicacao_em_Area_Area_Tematica foreign key (Area_Tematica_Id)
   references Area_Tematica(Id)
   on delete set null
   on update cascade
;
 
alter table Publicacao_fisica
   add constraint FK_Publicacao_fisica_Publicacao foreign key (Publicacao_Id)
   references Publicacao(Id)
   on delete cascade
   on update cascade
;
 
alter table Publicacao_digital
   add constraint FK_Publicacao_digital_Publicacao foreign key (Publicacao_Id)
   references Publicacao(Id)
   on delete cascade
   on update cascade
;
 
 
 
alter table Armario
   add constraint FK_Armario_noname_Andar foreign key (Andar_Numero)
   references Andar(Numero)
   on delete cascade
   on update cascade
; 
alter table Armario
   add constraint FK_Armario_Espaco_de_arrumacao foreign key (Espaco_de_arrumacao_Id)
   references Espaco_de_arrumacao(Id)
   on delete cascade
   on update cascade
;
 
alter table Emprestimo
   add constraint FK_Emprestimo_noname_Exemplar foreign key (Publicacao_Id, Exemplar_Nr)
   references Exemplar(Publicacao_Id, Nr)
   on delete restrict
   on update cascade
; 
alter table Emprestimo
   add constraint FK_Emprestimo_noname_Utente foreign key (Utente_Numero)
   references Utente(Numero)
   on delete restrict
   on update cascade
;
 
alter table Emprestimo_com_multa
   add constraint FK_Emprestimo_com_multa_Emprestimo foreign key (Numero)
   references Emprestimo(Numero)
   on delete cascade
   on update cascade
;
 
alter table Espaco_de_arrumacao
   add constraint FK_Espaco_de_arrumacao_noname_Area_Tematica foreign key (Area_Tematica_Id)
   references Area_Tematica(Id)
   on delete set null
   on update cascade
;
 
alter table Lista_de_leitura
   add constraint FK_Lista_de_leitura_noname_Utente foreign key (Utente_Numero)
   references Utente(Numero)
   on delete cascade
   on update cascade
;
 
alter table Prateleira
   add constraint FK_Prateleira_noname_Armario foreign key (Andar_Numero, Armario_Letra)
   references Armario(Andar_Numero, Letra)
   on delete cascade
   on update cascade
; 
alter table Prateleira
   add constraint FK_Prateleira_Espaco_de_arrumacao foreign key (Espaco_de_arrumacao_Id)
   references Espaco_de_arrumacao(Id)
   on delete cascade
   on update cascade
;
 
alter table Revista
   add constraint FK_Revista_Periodico foreign key (Periodico_Editora_ou_Periodico_Id)
   references Periodico(Editora_ou_Periodico_Id)
   on delete cascade
   on update cascade
;
 
 
alter table Utente_Suspenso
   add constraint FK_Utente_Suspenso_Utente foreign key (Numero)
   references Utente(Numero)
   on delete cascade
   on update cascade
;
 

INSERT INTO `tipo_de_monografia` VALUES ('Dissertação de Doutoramento'),('Dissertação de Mestrado'),('Relatório'),('Texto pedagógico');
INSERT INTO `periodicidade` VALUES ('Anual'),('Diária'),('Mensal'),('Semanal'),('Semestral'),('Trimestral');

