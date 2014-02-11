module ApplicationHelper

  def my_projects( id )
    paste = ""
    Project.by_user_id( id ).each do |p|
      paste = paste + "<li><a href='#{project_show_path( p[0] )}'>#{p[1]}</a></li>"
    end
    return paste.html_safe
  end

  def avatar_url( email, size )
    size ||= 24
    gravatar_id = Digest::MD5.hexdigest( email.downcase )
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def markdown( text )
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options  = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def get_task_priorities
    TaskPriority.all.pluck(:name, :id)
  end

  def get_task_types
    TaskType.all.pluck(:name, :id)
  end

  def get_task_statuses
    TaskStatus.all.pluck(:name, :id)
  end

end
