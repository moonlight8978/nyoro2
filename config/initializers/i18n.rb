Rails.configuration.after_initialize do
  I18n.fallbacks.map(:ja => :en)
end