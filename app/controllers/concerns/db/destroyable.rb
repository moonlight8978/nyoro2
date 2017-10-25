module Db::Destroyable
  extend ActiveSupport::Concern

  def destroy
    resource = controller_path.classify.constantize.find(params[:id])
    p resource
    if current_user.is_admin?
      if resource.marked
        resource.destroy
      end
    elsif current_user.is_moderator?

    elsif current_user.is_user?
      unless resource.marked
        resource.update(marked: true)
      end
    end

    redirect_to public_send(:"db_#{controller_name}_path", resource)
  end
end
