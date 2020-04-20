# frozen_string_literal: true

require 'report_builder'
require 'capybara/rspec'

Before do |_scenario|
  visit('/')
  within('#onesignal-popover-dialog') do
    click_on('Não')
  end
  @estrategia = EstrategiaPages.new
end

After do |_scenario|
  Capybara.reset_sessions!
end

After do |_scenario|
  shot_file = page.save_screenshot('log/screenshot.png', full: true)
  shot_b64 = Base64.encode64(File.open(shot_file, 'rb').read)
  embed(shot_b64, 'image/png","Clique aqui para ver o screenshot')
end

at_exit do
  @infos = {
    'Cliente' => 'Estratégia Educacional'.upcase,
    'Data do Teste' => Time.now.to_s
  }

  ReportBuilder.configure do |config|
    config.input_path = 'log/report.json'
    config.report_path = 'log/report'
    config.report_types = [:html]
    config.report_title = 'QA Engineer Challenge!'
    config.additional_info = @infos
    config.color = 'purple'
  end
  ReportBuilder.build_report
end

After do |scenario|
  if scenario.failed?
    screenshot 'image.png'
    embed('image.png', 'image/png')
  end
end
