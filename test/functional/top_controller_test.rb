# coding: utf-8
require 'test_helper'

class TopControllerTest < ActionController::TestCase
  test "index" do
    2.times { Factory(:article) }
    Factory(:article, rev_date: 1.hours.from_now)
    get :index
    assert_response :success
#    assert_select "div#content h2", 2
  end

end
