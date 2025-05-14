-- a) Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones correspondentes
SELECT a.nome, e.logradouro, e.numero, e.complemento, e.bairro, e.municipio, e.uf, e.cep, t.numero AS telefone
FROM Assinante a
INNER JOIN Endereco e ON a.id_endereco = e.id
LEFT OUTER JOIN Telefone t ON a.id = t.id_assinante;

-- b) Listar os nomes dos assinantes, seguido do seu ramo, ordenados por ramo e posteriormente por nome
SELECT a.nome, r.descricao AS ramo
FROM Assinante a
LEFT OUTER JOIN Ramo r ON a.id_ramo = r.id
ORDER BY r.descricao, a.nome;

-- c) Listar os assinantes do município de Pelotas que são do tipo residencial
SELECT a.nome
FROM Assinante a
INNER JOIN Endereco e ON a.id_endereco = e.id
WHERE e.municipio = 'Pelotas' AND a.tipo = 'residencial';

-- d) Listar os nomes dos assinantes que possuem mais de um telefone
SELECT a.nome
FROM Assinante a
INNER JOIN (
    SELECT id_assinante, COUNT(*) as qtd_telefones
    FROM Telefone
    GROUP BY id_assinante
    HAVING COUNT(*) > 1
) t ON a.id = t.id_assinante;

-- e) Listar os nomes dos assinantes seguido do número do telefone, tipo de assinante comercial, com endereço em Natal ou João Câmara
SELECT a.nome, t.numero AS telefone
FROM Assinante a
INNER JOIN Telefone t ON a.id = t.id_assinante
INNER JOIN Endereco e ON a.id_endereco = e.id
WHERE a.tipo = 'comercial' 
AND (e.municipio = 'Natal' OR e.municipio = 'João Câmara');
