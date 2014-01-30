require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should projects by user_id" do
    project = Project.by_user_id( users(:one) )
    assert_equal "First project", project[0][1]
  end
end
