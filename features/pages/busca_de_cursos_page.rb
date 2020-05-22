# frozen_string_literal: true

require_relative '../pages/base_pages.rb'

class BuscasPor < SitePrism::Page
  include URLRedirects
  attr_reader :buscas

  element :professor_page, "a[href='#{$professor_page}']"
  element :materia_page, "a[href='#{$materia_page}']"
  element :regiao_page, "a[href='#{$regiao_page}']"

  def goto(by)
    professor_page.click if by == 'por professor'
    materia_page.click if by == 'por matéria'
    regiao_page.click if by == 'por região'
  end

  def titulo_do_estado?
    regiao_title = find('.page-courses .section-header-title')
    page.execute_script('arguments[0].scrollIntoView();', regiao_title)
    regiao_title.text
  end

  def find_by_professor(name)
    fill_in 'Filtrar', with: name if has_text?(name) == true
    first('a', text: name)
    first('.card-prod-details').click
    has_title?(name)
  end

  def find_course_pay(metodo)
    @metodo = metodo
    @metodo_p = 'Assinatura Ilimitada 1 Ano - Cartão até 12 x' if @metodo == 'parcelado'
    @metodo_p = 'Assinatura Ilimitada 1 Ano - Boleto à vista com 10% de desconto' if @metodo == 'a vista'

    find('.card-prod-title', text: "#{@metodo_p}")
  end

  def choose_course
    within('.js-card-prod-container') do
      first('.card-prod-details', text: 'Detalhes').click if @metodo == 'parcelado'
      all('.card-prod-details', text: 'Detalhes')[1].click if @metodo == 'a vista'
    end
  end

  def scan_strings_parcela
    vcurso_p = first('.card-prod-price').text
    @nparcelas = vcurso_p.scan(/\d+/).first.to_i
    @vparcelas = vcurso_p.scan(/(\d+),(\d+)/).join('.').to_f
  end

  def scan_string_avista
    vcurso_v = all('.card-prod-price')[1].text
    @valor_vista = vcurso_v[/\d+.*,\d+/].gsub('.', '').gsub(',', '.').to_f
  end

  def scan_string_detalhespage
    vcurso_d = first('.value').text
    @valor_detalhes = vcurso_d[/\d+.*,\d+/].gsub('.', '').gsub(',', '.').to_f
  end

  def valor_curso_correto?
    if @metodo == 'parcelado'
      binding.pry
      scan_strings_parcela
      valor_p = @vparcelas * @nparcelas
      choose_course
      binding.pry
      scan_string_detalhespage
      valor_p == @valor_detalhes
    elsif @metodo == 'a vista'
      binding.pry
      scan_string_avista
      choose_course
      binding.pry
      scan_string_detalhespage
      @valor_vista == @valor_detalhes
    end
  end
end
