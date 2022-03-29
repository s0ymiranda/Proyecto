require "application_system_test_case"

class StateProjectsTest < ApplicationSystemTestCase
  setup do
    @state_project = state_projects(:one)
  end

  test "visiting the index" do
    visit state_projects_url
    assert_selector "h1", text: "State projects"
  end

  test "should create state project" do
    visit state_projects_url
    click_on "New state project"

    fill_in "Project", with: @state_project.Project_id
    fill_in "State", with: @state_project.State_id
    fill_in "Fecha transicion", with: @state_project.fecha_transicion
    click_on "Create State project"

    assert_text "State project was successfully created"
    click_on "Back"
  end

  test "should update State project" do
    visit state_project_url(@state_project)
    click_on "Edit this state project", match: :first

    fill_in "Project", with: @state_project.Project_id
    fill_in "State", with: @state_project.State_id
    fill_in "Fecha transicion", with: @state_project.fecha_transicion
    click_on "Update State project"

    assert_text "State project was successfully updated"
    click_on "Back"
  end

  test "should destroy State project" do
    visit state_project_url(@state_project)
    click_on "Destroy this state project", match: :first

    assert_text "State project was successfully destroyed"
  end
end
