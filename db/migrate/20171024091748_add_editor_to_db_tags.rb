class AddEditorToDbTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :db_tags, :editor, index: true
    add_reference :db_discs, :editor, index: true
    add_reference :db_releases, :editor, index: true
  end
end
