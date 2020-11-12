class ProjectsController < InheritedResources::Base
  before_action :find_project, only: %i[show edit destroy update]

  def find_project
    @project = Project.find(params[:id])
  end

  def index
    @q = Project.all.ransack(params[:q])
    @projects = @q.result.paginate(:page => params[:page], per_page:10)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to project_path
    else
      redirect_to projects_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
