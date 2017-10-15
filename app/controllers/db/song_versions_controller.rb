class Db::SongVersionsController < Db::VersionsController
  # def index
  #   super
  # end
  
  def show
    self.resource_version = Db::SongVersion
      .includes(staffs: { latest_version: { person: :latest_version } })
      .find(params[:id])
    super
  end
  
  # def update
  #   super
  # end
  
  # def destroy
  #   super
  # end
end
