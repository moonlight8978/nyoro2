class AddCommentsCounterCacheToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :db_companies, :comments_count, :integer, default: 0

    Db::Company.reset_column_information
    Db::Company.all.each do |c|
      c.update_attribute :comments_count, c.comments.length
    end

    add_column :db_people, :comments_count, :integer, default: 0

    Db::Person.reset_column_information
    Db::Person.all.each do |p|
      p.update_attribute :comments_count, p.comments.length
    end

    add_column :db_songs, :comments_count, :integer, default: 0

    Db::Song.reset_column_information
    Db::Song.all.each do |s|
      s.update_attribute :comments_count, s.comments.length
    end

    add_column :db_tags, :comments_count, :integer, default: 0

    Db::Tag.reset_column_information
    Db::Tag.all.each do |t|
      t.update_attribute :comments_count, t.comments.length
    end
  end
end
