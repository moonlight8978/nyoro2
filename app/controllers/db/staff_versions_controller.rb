class Db::StaffVersionsController < Db::VersionsController
  def index
    super
  end
  
  def update
    super
  end
  
  def show
    raise ActionController::RoutingError.new('Not Found')
  end
  
  # def destroy
  #   super
  # end
end
