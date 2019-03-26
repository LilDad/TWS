require 'watir'
require 'watir-scroll'

def pause
  sleep 1
end

def cookie_bar_hide
  if @browser.button(id: 'sitemanagerCookie').present?
    @browser.button(id: 'sitemanagerCookie').click
  end
end

def save_screenshot(name)
  time = Time.now.strftime('%d-%m-%Y %H:%M:%S')

  screenshot = "screenshots/#{name} #{time}.png"
  @browser.driver.save_screenshot(screenshot)
end

def element_id_scroll(id)
  element_scroll = @browser.element(id: id)
  element_scroll.scroll.to
end

Before do
  @cucumber_host = 'https://www.thesiswritingservice.com'

  @browser = Watir::Browser.new :chrome
  @browser.driver.manage.window.maximize
end

After do
  @browser.close
end
