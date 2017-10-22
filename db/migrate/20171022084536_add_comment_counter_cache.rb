class AddCommentCounterCache < ActiveRecord::Migration[5.1]
  def change
    add_column :db_albums, :comments_count, :integer, default: 0

    Db::Album.reset_column_information
    Db::Album.all.each do |a|
      a.update_attribute :comments_count, a.comments.length
    end
  end
end
