$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'page-object'
require 'require_all'
require 'fig_newton'
require 'data_magic'

# require_all 'lib'

World(PageObject::PageFactory)

Dir['./features/support/helpers/*.rb'].each { |file| require file }
# require './features/support/models/user'

include NavigationHelpers
