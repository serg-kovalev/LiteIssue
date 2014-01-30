module TasksHelper
  def user_by_task_id( id )
    u = Task.find_by_id( id ).user
    return "#{u.first_name} #{u.last_name}"
  end
end
