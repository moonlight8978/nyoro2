module AliasTitle
  extend ActiveSupport::Concern
  
  included do
    alias_attribute :title, :name
    alias_attribute :title_en, :name_en
    alias_attribute :title_pronounce, :name_pronounce
  end
end