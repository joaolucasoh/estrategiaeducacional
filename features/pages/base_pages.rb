# frozen_string_literal: true

require_relative 'busca_de_cursos_page'

class EstrategiaPages
  attr_accessor :buscas

  def initialize
    @buscas = BuscasPor.new
  end
end
