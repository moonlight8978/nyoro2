class Admin::Ec::ShopsManagementController < Admin::ManagementController
  decorates_assigned :shops

  def index
    @title = "ショップ管理"
    @title_en = "Shops management"
    super
  end

private

  def resources_name
    :"shops"
  end

  def template_for_resources
    "admin/ec/shops_management/list_table"
  end

  def search_for_resources(**args)
    ::Ec::Shop.search(include: [:user]) do
      fulltext params[:q], fields: [:name, :email] if params[:q].present?
      with(:status, params[:status]) if params[:status].present?
      paginate page: args[:page], per_page: 25
    end.results
  end
end
