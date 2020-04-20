# frozen_string_literal: true

module URLRedirects
  BASEURI = 'https://www.estrategiaconcursos.com.br'
  
  class URLBase  
    $home_page = "#{BASEURI}"
    $concurso_page ||=  "#{BASEURI}/cursos/concurso/"
    $professor_page ||= "#{BASEURI}/cursos/professor/"
    $materia_page ||= "#{BASEURI}/cursos/materia/"
    $regiao_page ||= "#{BASEURI}/cursos/regiao/"
    $todos_page ||= "#{BASEURI}/cursos/"
  end
end
World(URLRedirects)
