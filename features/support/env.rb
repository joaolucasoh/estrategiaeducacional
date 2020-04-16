# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'pry'
require 'report_builder'
require 'selenium-webdriver'
require 'site_prism'

@env = ENV['BROWSER']

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://www.estrategiaconcursos.com.br'
  config.ignore_hidden_elements = false

  if @env.eql?('headless')
    config.default_driver = :selenium_chrome_headless
  elsif @env.eql?('chrome')
    config.default_driver = :selenium_chrome
  elsif @env.eql?('firefox')
    config.default_driver = :selenium
  end

  Capybara.default_max_wait_time = 15
  Capybara.page.driver.browser.manage.window.maximize
end

Capybara.register_driver :selenium_chrome_headless do |app|
  args = %w[headless disable-gpu window-size=1440,900 no-sandbox]

  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {
      'args' => args
    }
  )

  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << '--headless'
    opts.args << '--disable-gpu' if Gem.win_platform?
    opts.args << '--no-sandbox'
    opts.args << '--disable-site-isolation-trials'
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps, options: browser_options)
end
