require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "should create project" do
    visit projects_url
    click_on "New project"

    fill_in "Client", with: @project.Client_id
    fill_in "State", with: @project.State_id
    fill_in "Codigo", with: @project.codigo
    fill_in "Descripcion", with: @project.descripcion
    fill_in "Fecha", with: @project.fecha
    fill_in "Monto", with: @project.monto
    fill_in "Nombre", with: @project.nombre
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "should update Project" do
    visit project_url(@project)
    click_on "Edit this project", match: :first

    fill_in "Client", with: @project.Client_id
    fill_in "State", with: @project.State_id
    fill_in "Codigo", with: @project.codigo
    fill_in "Descripcion", with: @project.descripcion
    fill_in "Fecha", with: @project.fecha
    fill_in "Monto", with: @project.monto
    fill_in "Nombre", with: @project.nombre
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "should destroy Project" do
    visit project_url(@project)
    click_on "Destroy this project", match: :first

    assert_text "Project was successfully destroyed"
  end
end
