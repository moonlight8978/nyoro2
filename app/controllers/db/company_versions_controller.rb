class Db::CompanyVersionsController < ApplicationController
  def index
    @company = Db::Company
      .includes(:latest_version)
      .find(params[:company_id])
    set_title "#{@company.latest_version.name}の編集履歴"
    @versions = @company.versions
      .page(params[:page] || 1).per(params[:per] || 20)
      .group_by_day(&:created_at)
  end
  
  def show
    @company_version = Db::CompanyVersion
      .find(params[:id])
    @company = @company_version.company
    set_title "#{@company.latest_version.name}・バージョン#{params[:id]}"
  end
  
  # to revert / edit current latest_version of album
  def update
    @company = Db::Album.find(params[:company_id])
    
    if (@company.latest_version_id === params[:id].to_i)
      redirect_to db_company_versions_path and return
    end
    
    @version = Db::CompanyVersion.find(params[:id])
    
    if (@version.company_id === params[:company_id].to_i)
      @company.update(latest_version_id: params[:id])
      @company.log_update(current_user, @version.name, "バーション#{params[:id]}に戻す。")
    end
    
    redirect_to db_company_versions_path
  end
end
