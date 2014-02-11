class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task     = Task.find_by_id( params[:id] )
    @comments = Comment.where( task_id: @task.id ).order('id DESC')
  end

  def create
    @task = current_user.tasks.new( task_params )
    if @task.save
      redirect_to( task_show_path( @task ), notice: 'Task created' )
    else
      render 'new', notice: 'Task creation failed'
    end
  end

  private

    def task_params
      params.require( :task ).permit( :title, :description, :project_id, :task_priority_id, :task_type_id, :task_status_id )
    end

end
