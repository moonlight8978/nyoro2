class Admin::ManagementController < Admin::AdminController
  helper_method :resources

  def index
    respond_to do |format|
      format.html do
        @title ||= "管理"
        self.resources = search_for_resources(page: 1)
      end
      format.js do
        self.resources = search_for_resources(page: params[:page])
        render partial: template_for_resources, locals: { resources: resources }
      end
    end
  end

protected

  def resources
    instance_variable_get(:"@#{resources_name}")
  end

  # allows :page
  def search_for_resources(**args)
    #code
  end

  def template_for_resources
    "path/to/template.html"
  end

  def resources=(resources)
    instance_variable_set(:"@#{resources_name}", resources)
  end

  def resources_name
    :"@resources"
  end
end
