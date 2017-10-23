module Db::MarkDestroy
  extend ActiveSupport::Concern

  included do
    def status
      @destroy_status ||= ModelStatusValue.new(self.marked)
    end
  end
end
