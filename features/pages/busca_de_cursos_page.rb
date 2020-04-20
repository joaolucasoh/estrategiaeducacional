# frozen_string_literal: true

require_relative '../pages/base_pages.rb'

class BuscarPorProfessor < SitePrism::Page
  include URLRedirects
  attr_reader :professor

  element :link_professor_page, "a[href='#{$professor_page}']"

  def goto_professor_page
    link_professor_page.click
  end

  def find_by_professor(name)
    fill_in 'Filtrar', with: name if has_text?(name) == true
    find('a', text: name)
    click_link('Detalhes')
    has_title?(name)
  end

  def find_course
    find('.card-prod-title', text: 'Assinatura Ilimitada 1 Ano - Cartão até 12 x')
  end

  def choose_course
    within('.js-card-prod-container') do
      first('.card-prod-details', text: 'Detalhes').click
    end
  end

  def v_correto?
    vcurso_p = first('.card-prod-price').text
    nparcelas = vcurso_p.scan(/\d+/).first.to_i
    vparcelas = vcurso_p.scan(/(\d+),(\d+)/).join('.').to_f
    valor_p = vparcelas * nparcelas

    choose_course

    vcurso_d = first('.value').text
    # valor_detalhes = vcurso_d.scan(/(\d+),(\d+)/).join('.').to_f
    valor_detalhes = vcurso_d[/\d+.*,\d+/].gsub('.', '').gsub(',', '.').to_f
    valor_p == valor_detalhes
  end
end
