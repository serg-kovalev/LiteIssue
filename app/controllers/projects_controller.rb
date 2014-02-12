class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @project = Project.find( params[:id] )
    @tasks   = Task.where( project_id: params[:id] )
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
