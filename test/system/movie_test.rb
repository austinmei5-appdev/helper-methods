require "application_system_test_case"

class MovieTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit movies_url
  
    assert_selector "h1"
  end
end
