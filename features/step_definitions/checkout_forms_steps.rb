Given(/^I am on the site (\w+) page$/) do |page|
  goto url_for(page)
  @current_page = page_for(page)
end

When(/^I fill the Quote form and submit\. Data: "([^"]*)", "([^"]*)"$/) do |data, email|
  cookie_bar_hide

  @current_page.fill_form data, email
  element_scroll = @browser.element(id: 'firstname')
  element_scroll.scroll.to

  save_screenshot 'Quote'
end

Then(/^I sent the filled form$/) do
  @browser.div(class: 'alert alert-success!!!')
end

When(/^I fill the Order form and submit\. Data: "([^"]*)", email: "([^"]*)", password: "([^"]*)".$/) do |data, email, password|
  cookie_bar_hide
  element_id_scroll 'discount'

  # Will be moved to 'OrderPage' like Quote form
  # ===========================================
  #
  # Step 1
  array = %w[paper subtype urgency level style pages sources subject]
  array.each do |arg|
    if @browser.select_list(id: arg).present?
      @browser.select_list(id: arg).wait_until(&:present?).options.to_a.sample.click
      pause
    end
  end

  save_screenshot 'Order-1'

  @browser.button(id: 'step-2').click
  pause

  # Step 2
  @browser.text_field(id: 'topic_paper').set data
  @browser.checkbox(name: 'has_slides').set
  pause
  @browser.select_list(id: 'slides').options.to_a.sample.click
  pause
  @browser.checkbox(name: 'has_writer').set
  pause
  @browser.text_field(id: 'writer').set data
  @browser.textarea(id: 'comment').set data
  @browser.file_field(id: 'attachment').set '/home/e-bezura/Documents/Form testing/9mb.docx'

  save_screenshot 'Order-2'
  pause
  @browser.button(id: 'step-3').click
  pause

  # Step 3
  @browser.text_field(id: 'email').set email
  @browser.text_field(id: 'member_password').set password
  @browser.text_field(id: 'member_cpassword').set password
  @browser.select_list(id: 'title').options.to_a.sample.click
  pause
  @browser.text_field(id: 'firstname').set data
  @browser.text_field(id: 'lastname').set data
  @browser.text_field(id: 'skype').set data
  @browser.select_list(id: 'country').options.to_a.sample.click
  pause
  @browser.text_field(id: 'phone').set data
  @browser.checkbox(id: 'tc_checkbox').set

  save_screenshot 'Order-3'
  sleep 50
end


# Ver. 1
# array.each do |arg|
#   if @browser.select_list(id: arg).present?
#     @browser.select_list(id: arg).wait_until(&:present?).options.to_a.sample.set
#   end
# end
#
# Ver. 2
# array.each do |arg|
#   if @browser.select_list(id: arg).present?
#   value = @browser.select_list(id: arg).options.to_a.sample
#   @browser.select_list(id: arg).select(value.index.to_s)
#   end
# end
#
# Selection of values for all droplist array
# =====
#
# array = %w[services type terminology urgency pages]
# array.each do |arg|
#   @browser.select_list(id: arg).wait_until_present.options.to_a.sample.click
# end
#
# If the droplist will select the included values
# =====
#
# enabled_options = @browser.select_list(:class, 'preset-select').options.select(&:enabled?)
# enabled_options.sample.click
