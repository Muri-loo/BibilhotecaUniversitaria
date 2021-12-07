Crie os comandos SQL para elaborar as pesquisas conforme solicitado nas seguintes alíneas.
1. Pretende-se uma listagem de publicações que mostre o nome, data de publicação e tipo de publicação. O tipo de
publicação deriva do registo se encontrar dessa publicação se encontrar na tabela: edição de livro (Tipo Livro),
edição de periódico (Tipo Periódico) e monografia (Tipo Monografia). As publicações para as quais não seja possível
identificar o tipo devem apresentar a indicação “n.a.”.
2. Qual a publicação, ou publicações, com mais reservas acumuladas ao longo dos últimos 6 meses.
3. Pretende-se uma listagem das publicações mais relevantes em cada área temática.
4. Qual a publicação com mais empréstimos realizados durante o primeiro semestre de 2021 (considere o semestre
civil) para cada área temática.
LEI, LETI e LIGE
BASES DE DADOS
“BIBLIOTECA UNIVERSITÁRIA”
PARTE II
Ano Letivo 2021/2022
DCTI-2021/2022 Bases de Dados 2
5. Quais os utentes cujas listas de leitura abrangem publicações de mais de 75% das áreas temáticas cobertas pela
biblioteca.
6. Verificar se existem e se existir listar as publicações com registos ambíguos, i.e., publicações que em simultâneo
estejam a ser registadas em mais do que uma categoria: edição de livro, edição de periódico e monografia.
7. Nível de atualização da biblioteca com os seguintes indicadores:
a. Número médio de dias que demora a aquisição de uma publicação desde a data da sua publicação
b. Duração mais longa e mais curta na aquisição de uma publicação face à data de publicação
----------------------------------------------------------------------------------------------------------------------------------
Crie os automatismos necessários para assegurar as seguintes operações:
1. Para uma publicação identificada, listar a informação sobre os exemplares disponíveis dessa publicação.
2. Referente a uma lista de leitura arbitrária (a indicar a cada momento), pretende-se listar as áreas temáticas das
publicações naquela incluídas e a quantidade de publicações em cada uma dessas áreas. Por exemplo, para uma
certa lista de leitura pretende-se listar:
Gestão Financeira, 3
Marketing, 2
Gestão Logística, 2
3. Criar um procedimento para atualizar o valor das multas dos empréstimos em atraso à data atual.
4. Proceder à suspensão do utente. Esta deve ocorrer automaticamente quando se declara o extravio por
responsabilidade do utente e este não procede à reposição do exemplar ou tem um empréstimo cuja data limite de
entrega já expirou há mais de 1 mês.
5. Atualizar automaticamente o campo da publicação que regista o número de empréstimos.
6. Validar se um exemplar de uma publicação pode ser emprestado, tendo em conta indicação do exemplar se está
disponível para empréstimo e se não há reservas para essa publicação realizadas há menos de 1 mês.
7. Impedir que sejam criados registos ambíguos para as publicações, i.e., evitar que cada publicação possa estar
registada em simultâneo em mais do que uma categoria: edição de livro, edição de periódico e monografia.
8. A indicação se o exemplar pode ser emprestado é de atualização automática para o caso dos periódicos (jornais e
revistas). Assim, sempre que uma nova edição é disponibilizada e esse periódico puder ser emprestado, deverá ser
dada a indicação aos exemplares de edições anteriores que ficarão disponíveis para empréstimo. O número de
edições indisponíveis para empréstimo varia para cada periódico. (Assuma que o número de edição é um número
inteiro sequencial)
----------------------------------------------------------------------------------------------------------------------------------
Crie um protótipo que permita:
1. Fazer o registo de uma publicação.
2. Fazer a pesquisa de publicações com os seguintes requisitos:
a. Pesquisa básica relativamente ao título da publicação;
b. Pesquisa avançada com os seguintes critérios de pesquisa: título, tag, área temática, relevância do tópico
e/ou data de publicação;
a. Informação a exibir na listagem das publicações: título, área temática, capa, data publicação e número de
empréstimos;
b. Para cada publicação da listagem deve ser possível aceder a uma página com detalhe da publicação, p.e.
utilizando um link em cada publicação que permite visualizar com detalhe. A visualização de detalhe vai
permite aceder a elementos adicionais sobre a publicação que depende da sua tipologia (livro, revista ou
monografia);
c. Deve permitir alterar o registo da publicação. Só é possível alterar título, data de publicação e área temática;
d. Deve permitir remover a publicação que for selecionada para o efeito.
