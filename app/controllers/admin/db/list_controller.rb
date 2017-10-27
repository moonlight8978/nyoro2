class Admin::Db::ListController < Admin::AdminController
  helper_method :resources, :edit_path_for, :show_path_for

  def index
    _q = params[:q]
    _editor = params[:editor]
    _marked = params[:marked]

    self.resources = resource_class.search(include: :editor) do
      fulltext _q, fields: [:title, :title_en, :title_pronounce] if _q.present?
      fulltext _editor, fields: [:editor] if _editor.present?
      with(:marked, _marked) if _marked.present?
      paginate page: params[:page] || 1, per_page: params[:per_page] || 20
    end.results

    respond_to do |format|
      format.html
      format.js do
        render partial: 'admin/db/list/list_table', locals: { resources: resources }
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

private

  def resource_class
    "Db::#{resources_name.classify}".constantize
  end

  def resources_name
    controller_name
  end
end
