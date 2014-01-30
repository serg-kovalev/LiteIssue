class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def show
    @project = Project.find_by_id( params[:id] )
    @user    = @project.user
  end

  def create
    @project = current_user.projects.new( project_params )
    if @project.save
      redirect_to( project_show_path( @project ), notice: 'Project created' )
    else
      render 'new', notice: 'Project creation failed'
    end
  end

  private

    def project_params
      params.require( :project ).permit( :name, :description )
    end

end
