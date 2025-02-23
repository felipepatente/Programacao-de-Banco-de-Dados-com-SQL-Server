select left(Descricao,4), Descricao from Categorias (nolock)
select right(Descricao,4), Descricao from Categorias (nolock)
select substring(Descricao,1,15), Descricao from Categorias (nolock)
select concat('RAFAEL', ' ALMEIDA', ' SANTOS')
select concat(descricao, '  - TESTE') from Categorias (nolock)
select isnull(Descricao, '') from Categorias
select iif(1 > 0, 'Maior que zero', 'Menor que zero')
select iif(len(Descricao) > 6, descricao, 'noups'), * from Categorias (nolock)