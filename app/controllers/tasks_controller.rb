class TasksController < ApplicationController
  before_filter :authenticate_user!
require 'pp'
  def index
    @tasks = Task.all
  end

  def show
    @task     = Task.find_by_id( params[:id] )
    @comments = Comment.where( task_id: @task.id ).order('id DESC')
  end

  def create
    params        = task_params
    params[:tags] = params[:tags].split(/[,\s]+/)

    @task = current_user.tasks.new( params )
    if @task.save
      redirect_to( task_show_path( @task ), notice: 'Task created' )
    else
      render 'new', notice: 'Task creation failed'
    end
  end

  def tag
    @tasks   = Task.all_tags( params[:tag_name] )
    @project = Project.find( @tasks[0].project_id )
    render 'projects/show'
  end

  private

    def task_params
      params.require( :task ).permit( :title, :description, :project_id, :task_priority_id, :task_type_id, :task_status_id, :tags )
    end

end
