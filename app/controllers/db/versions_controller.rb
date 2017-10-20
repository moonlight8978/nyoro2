class Db::VersionsController < ApplicationController
  # TODO destroy
  before_action :authenticate_user!, except: [:index, :show]
  before_action :db_sidebar, only: [:index, :show]

  def index
    versionable = resource_class
      .includes(:latest_version)
      .find(params[:"#{resource_name}_id"])
    self.resource = versionable
    set_title "#{resource.latest_version.title}の編集履歴"
    @versions = resource.versions
      .page(params[:page] || 1).per(params[:per_page] || 20)
      .group_by_day(&:created_at)
  end

  def show
    self.resource_version ||= resource_version_class.find(params[:id])
    self.resource = resource_version.public_send(resource_name)
    set_title "#{resource.latest_version.title}・バージョン#{params[:id]}"
  end

  def update
    request_resource_id = params[:"#{resource_name}_id"].to_i
    request_version_id = params[:id].to_i
    resource = resource_class.find(request_resource_id)
    if resource.latest_version_id === request_version_id
      redirect_to resource_versions_path and return
    end

    @version = resource_version_class.find(request_version_id)

    if (@version.public_send("#{resource_name}_id") === request_resource_id)
      resource.update(latest_version: @version)
      resource.log_update(current_user, @version.title, "バーション#{@version.id}に戻す。")
    end

    redirect_to resource_versions_path
  end

  def destroy

  end

protected

  def resource_version_name
    controller_name.singularize
  end

  def resource_version_class
    controller_path.singularize.classify.constantize
  end

  def resource_version
    instance_variable_get(:"@#{resource_version_name}")
  end

  def resource_version=(version)
    instance_variable_set(:"@#{resource_version_name}", version)
  end

  def resource_name
    controller_name.split('_')[0..-2].join('_')
  end

  def resource_class
    controller_path.split('_')[0..-2].join('_').classify.constantize
  end

  def resource
    instance_variable_get(:"@#{resource_name}")
  end

  def resource=(versionable)
    instance_variable_set(:"@#{resource_name}", versionable)
  end

  def resource_versions_path
    public_send(:"db_#{resource_name}_versions_path")
  end
end
