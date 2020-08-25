--------DQL------
-- Dois tipos de jun��o

--Jun��o de categoria, produto e quantidade
select categoria.nome , produto.nome, produto.quantidade_estoque 
from categoria, produto 
where categoria.codigo = produto.codigo_categoria

--Jun��o de produto, pedido e cliente

select cliente.nome as Cliente, produto.nome as 'Produto', pedido.data_pedido as 'Data do Pedido', pedido.codigo as 'N� Pedido'  
from cliente , produto, pedido, produto_pedido
where cliente.codigo = pedido.codigo_cliente
and produto.codigo = produto_pedido.codigo_produto 
and pedido.codigo = produto_pedido.codigo_pedido


--Jun��o das tabelas produto e categoria, filtrando somente os itens de papelaria
select produto.nome as Produto, produto.valor_unitario as Pre�o, produto.quantidade_estoque as Estoque, categoria.nome as Categoria
from produto 
join categoria on categoria.codigo = produto.codigo_categoria 
and categoria.nome = "Papelaria";

 

--Count e Group by: a quantidade de produtos que cada funcion�rio cadastrou
select funcionario.nome as Funcion�rio, count(produto.codigo) as Cadastros 
from funcionario 
join produto on produto.codigo_funcionario = funcionario.codigo 
group by funcionario.nome;

 
 
--Nota fiscal
--Seleciona cliente, data do pedido, quantidade de itens, produto, valor unit�rio e valor total do pedido
select cliente.nome as Cliente, pedido.data_pedido as "Data do Pedido", produto_pedido.quantidade_itens as "Quantidade de itens",
produto.nome as Produto, produto.valor_unitario as "Valor Unit�rio", 
produto_pedido.quantidade_itens*produto.valor_unitario as "Valor total", 
endereco.rua as 'Endereco', endereco.numero as N�, endereco.complemento as Complemento,
endereco.bairro as Bairro, endereco.cep as CEP, 
endereco.cidade as Cidade, endereco.estado as Estado
from produto_pedido 
join produto on produto.codigo = produto_pedido.codigo_produto 
join pedido on pedido.codigo = produto_pedido.codigo_pedido 
join cliente on pedido.codigo_cliente = cliente.codigo
join endereco on cliente.codigo_endereco = endereco.codigo

 
