module TasksHelper
  
  def user_by_task_id( id )
    u = Task.find_by_id( id ).user
    return "#{u.first_name} #{u.last_name}"
  end

  def tags_by_project_id( id )
    tags = {}
    html = ''
    
    Project.find( id ).tasks.pluck(:tags).each do |el|
      el.each do |tag|
        tags[tag] = tags[tag].to_i + 1
      end
    end
    
    tags.each do |k,v|
      html << "<a href='#{tag_path(k)}'>#{k}(#{v})</a>"
    end
    
    return html.html_safe
  end

end
