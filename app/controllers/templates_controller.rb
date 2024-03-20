class TemplatesController < ApplicationController
  # GET /templates/new
  def new
    @template = Template.new
  end

  # POST /templates or /templates.json
  def create
    @template = Template.new(template_params)
    if @template.save
      redirect_to templates_path, notice: 'Template created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_template
    @template = Template.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def template_params
    params.require(:template).permit(:name, :body)
  end
end
