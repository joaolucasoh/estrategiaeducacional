# frozen_string_literal: true

## contexto
Dado('que estou na home page') do
  expect(page).to have_current_path($home_page)
end

Quando('realizar a {string}') do |title|
  @estrategia.buscas.goto(title)
end

Quando('buscar por {string}') do |by_name|
  @estrategia.buscas.find_by_professor(by_name)
end

Então('escolher um dos cursos pelo {string} e ir para os detalhes') do |method|
  @estrategia.buscas.find_course_pay(method)
end

Então('conferir se os valores das duas páginas estão corretos') do
  expect(@estrategia.buscas.valor_curso_correto?).to be_truthy
end

####
Quando('filtrar por {string}') do |estado|
  @estado = estado
  click_link("#{estado}")
end

Então('deve haver um titulo de cursos no estado escolhido') do
  expect(@estrategia.buscas.titulo_do_estado?).to have_text "Cursos em #{@estado}"
end

###