# frozen_string_literal: true

Dado('que estou na home page') do
  expect(page).to have_current_path($home_page)
end

Quando('realizar a {string}') do |title|
  @estrategia.professor.goto_professor_page
  expect(page).to have_current_path($professor_page)
end

Quando('filtrar pelo {string}') do |by_name|
  @estrategia.professor.find_by_professor(by_name)
end

Então('escolher um dos cursos e ir para a página detalhes') do
  @estrategia.professor.find_course
end

Então('conferir se os valores das duas páginas estão iguais, incluindo o valor de parcelamento') do
  expect(@estrategia.professor.v_correto?).to be_truthy
end
