class AddUserToVersions < ActiveRecord::Migration[5.1]
  def change
    add_reference :db_album_versions, :editor, index: true
    add_reference :db_company_versions, :editor, index: true
    add_reference :db_person_versions, :editor, index: true
    add_reference :db_song_versions, :editor, index: true
    add_reference :db_staff_versions, :editor, index: true
  end
end
