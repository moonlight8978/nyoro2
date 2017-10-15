class Db::AlbumVersionsController < Db::VersionsController
  
  # def index
  #   super
  # end
  
  def show
    self.resource_version = Db::AlbumVersion
      .includes(
        :album, 
        discs: { songs: { latest_version: { staffs: { latest_version: { 
          person: :latest_version } } } } 
        },
        release: { publisher: :latest_version }
      )
      .find(params[:id])
    super
  end
  
  # to revert / edit current latest_version of album
  # def update
  # super
  # end
  
  # def destroy
  #   super
  # end
end
