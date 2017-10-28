class Admin::UsersManagementController < Admin::ManagementController
  decorates_assigned :users

  def index
    @title = "ユーザー管理"
    @title_en = "Users management"
    super
  end

private

  def resources_name
    "users"
  end

  def template_for_resources
    "admin/users_management/list_table"
  end

  def search_for_resources(**args)
    User.search(include: [:country, :roles]) do
      fulltext params[:q], fields: [:user_name, :email] if params[:q].present?
      with(:role, params[:role]) if params[:role].present?
      with(:activation, params[:activation]) if params[:activation].present?
      with(:social_provider, params[:social_provider]) if params[:social_provider].present?
      paginate page: args[:page], per_page: 25
    end.results
  end
end
