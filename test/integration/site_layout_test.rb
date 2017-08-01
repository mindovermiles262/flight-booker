require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  fixtures :airports

  test "index layout" do 
    get '/flights'
    assert_response :success
    assert_template 'flights/index'
    assert_select "h1", "Search Index"
  end
end
