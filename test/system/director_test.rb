require "application_system_test_case"

class DirectorsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/directors"
    assert_selector "h1", text: "List of all directors"
  end

  test "creating a Director" do
    original_director_count = Director.count

    visit "/directors"
    click_on "Add a new director"

    fill_in "Name", with: "A new director's name"
    fill_in "Biography", with: "A new director's biography"
    click_on "Create Director"

    assert_text "Director created successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count + 1, ending_director_count
  end

  test "updating a Director" do
    @director = directors(:one)

    visit "/directors/#{@director.id}/edit"

    fill_in "Biography", with: "Some other biography"
    fill_in "Name", with: "Some other name"

    click_on "Update Director"
    
    assert_text "Director updated successfully"

    @director.reload # Why do we need this?
    assert_equal "Some other name", @director.name
    assert_equal "Some other biography", @director.biography
  end

  test "destroying a director" do
    @director = directors(:one)
    original_director_count = Director.count

    visit "/directors"
    click_on "Show details", match: :first
    click_on "Delete director"

    assert_text "Director deleted successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count - 1, ending_director_count
  end
end
