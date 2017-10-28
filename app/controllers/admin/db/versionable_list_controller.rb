class Admin::Db::VersionableListController < Admin::ManagementController
  helper_method :edit_path_for, :show_path_for, :versions_path_for

  def index
    super
  end

protected

  def search_for_resources(**args)
    resource_class.search(include: { latest_version: :editor }) do
      fulltext params[:q], fields: [:title, :title_en, :title_pronounce] if params[:q].present?
      fulltext params[:editor], fields: [:editor] if params[:editor].present?
      with(:marked, params[:marked]) if params[:marked].present?
      paginate page: args[:page], per_page: 20
    end.results
  end

  def template_for_resources
    "admin/db/versionable_list/list_table"
  end

  def edit_path_for(resource)
    send("edit_db_#{resources_name.singularize}_path", resource)
  end

  def show_path_for(resource)
    send("db_#{resources_name.singularize}_path", resource)
  end

  def versions_path_for(resource)
    send("db_#{resources_name.singularize}_versions_path", resource)
  end

  def resource_class
    "Db::#{resources_name.classify}".constantize
  end

  def resources_name
    controller_name
  end
end
