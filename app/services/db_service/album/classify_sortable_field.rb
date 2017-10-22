module DbService::Album::ClassifySortableField
  # allow :order_by, :direction
  def self.perform(**args)
    @order_by, @direction = args[:order_by], args[:direction]
    self.classify
  end

private

  def self.classify
    order_by =
      case @order_by
      when 'title'
        'db_album_versions.title_pronounce'
      when 'released'
        'db_releases.released_at'
      else
        'db_album_versions.title_pronounce'
      end
    "#{order_by} #{@direction}"
  end
end
