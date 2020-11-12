class ProjectTemplatesController < InheritedResources::Base
  before_action :find_project_template, only: %i[show edit destroy update]

  def find_project_template
    @project_template = ProjectTemplate.find(params[:id])
  end

  def create
    @project = Project.new(name: params["project_name"])
    @project_template = ProjectTemplate.new(project_template_params)
    if @project.save
      @project_template.project_id = @project.id
      if @project_template.save
        redirect_to project_templates_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
  end

  def update
    @project = Project.find(@project_template.project_id)
    if @project.update(name: params[:project_name])
      if @project_template.update_attributes(project_template_params)
        redirect_to project_templates_path
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def index
    @q = ProjectTemplate.all.order('created_at').ransack(params[:q])
    @project_templates = @q.result
  end

  private

  def project_template_params
    params.require(:project_template).permit(:project_name, :start_date, :external_deadline,:require_web_collection)
  end

end
