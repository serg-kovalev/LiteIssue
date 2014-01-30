require 'test_helper'
require 'pp'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    login(users(:one))
  end
  
  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { name: 'New Project', description: 'bla bla bla' }
    end

    assert_not_nil assigns(:project)
    assert_equal assigns(:project).user_id.to_s, users(:one).to_param
    # assert_redirected_to project_path(assigns(:project))
  end
end
