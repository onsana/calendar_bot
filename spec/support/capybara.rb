require "capybara/rails"
require "capybara/rspec"
require "capybara-screenshot/rspec"
require "selenium/webdriver"

Capybara.register_driver :selenium_chrome_headless do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << "--headless"
    opts.args << "--disable-gpu"
    opts.args << "--disable-site-isolation-trials"
    opts.args << "--window-size=1280,900"
  end
  browser_options.add_preference(:download, prompt_for_download: false, default_directory: DownloadHelpers::PATH.to_s)

  browser_options.add_preference(:browser, set_download_behavior: {behavior: "allow"})
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    config.include DownloadHelpers
    clear_downloads
    driven_by :selenium_chrome_headless
  end
end
