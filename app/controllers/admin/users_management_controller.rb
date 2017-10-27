class Admin::UsersManagementController < Admin::AdminController
  decorates_assigned :users

  def index
    respond_to do |format|
      format.html do
        @title = "ユーザー管理"
        @users = search(params[:q], params[:role], params[:activation], params[:social_provider], 1)
      end
      format.js do
        @users = search(params[:q], params[:role], params[:activation], params[:social_provider], params[:page])
        render partial: 'admin/users_management/list_table'
      end
    end
  end

private

  def search(q, role, activation, social_provider, page)
    User.search(include: [:country, :roles]) do
      fulltext q, fields: [:user_name, :email] if q.present?
      with(:role, role) if role.present?
      with(:activation, activation) if activation.present?
      with(:social_provider, social_provider) if social_provider.present?
      paginate page: page, per_page: 25
    end.results
  end
end
