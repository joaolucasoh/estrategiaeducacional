# language: pt

@busca_por_professor @recuse_popup
Funcionalidade: Realizar a busca de um curso/professor através do mecanismo de busca da home page e setorizadas
    Sendo um usuário final e estando devidamente com a home page aberta
    Devo conseguir realizar buscas de cursos e seus respectivos professores através da busca

Contexto: Confirmar estar na home page
    Dado que estou na home page

@valores_curso
Esquema do Cenário: Buscar curso por professor com valor parcelado
    Quando realizar a '<busca por>'
    E filtrar pelo '<professor>'
    Então escolher um dos cursos e ir para a página detalhes
    E conferir se os valores das duas páginas estão iguais, incluindo o valor de parcelamento
    Exemplos:
        | buscar por    | professor  |
        | por professor | Ena Loiola |
