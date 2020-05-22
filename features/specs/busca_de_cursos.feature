# language: pt

@buscas_de_cursos
Funcionalidade: Realizar a busca de um curso/professor através do mecanismo de busca da home page e setorizadas
    Sendo um usuário final e estando devidamente com a home page aberta
    Devo conseguir realizar buscas de cursos e seus respectivos professores através da busca

Contexto: Confirmar estar na home page
    Dado que estou na home page

# @confirmacao_valores
# Esquema do Cenário: Buscar curso por professor com valor parcelado
#     Quando realizar a '<busca por>'
#     E buscar por '<professor>'
#     Então escolher um dos cursos pelo '<meio de pagamento>' e ir para os detalhes
#     E conferir se os valores das duas páginas estão corretos
#     Exemplos:
#         | busca por     | professor  | meio de pagamento |
#         | por professor | Ena Loiola | parcelado         |
#         | por professor | Ena Loiola | a vista           |

@cursos_por_regiao
Esquema do Cenário: Buscar curso por região
    Quando realizar a '<busca por>'
    E filtrar por '<estado>'
    Então deve haver um titulo de cursos no estado escolhido
    Exemplos:
        | busca por  | estado            |
        | por região | Mato Grosso       |
        | por região | Paraíba           |
        | por região | Tocantins         |
        | por região | Espírito Santo    |
        | por região | Rio Grande do Sul |
 