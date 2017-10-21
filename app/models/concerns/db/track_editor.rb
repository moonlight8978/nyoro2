module Db::TrackEditor
  extend ActiveSupport::Concern

  included do
    belongs_to :editor,
      class_name: 'User'
  end
end
