class Admin::Db::VersionableListController < Admin::AdminController
  helper_method :resources, :edit_path_for, :show_path_for, :versions_path_for

  def index
    _q = params[:q]
    _editor = params[:editor]
    _mark = params[:marked].present?

    self.resources = resource_class.search(include: { latest_version: :editor }) do
      fulltext _q, fields: [:title, :title_en, :title_pronounce] if params[:q].present?
      fulltext _editor, fields: [:editor] if params[:editor].present?
      with(:marked, _mark) if false
      paginate page: params[:page] || 1, per_page: params[:per_page] || 20
    end.results

    respond_to do |format|
      format.html
      format.js do
        render partial: 'admin/db/versionable_list/list_table', locals: { resources: resources }
      end
    end
  end

protected

  def resources
    instance_variable_get(:"@#{resources_name}")
  end

  def resources=(resources)
    instance_variable_set(:"@#{resources_name}", resources)
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

private

  def resource_class
    "Db::#{resources_name.classify}".constantize
  end

  def resources_name
    controller_name
  end
end