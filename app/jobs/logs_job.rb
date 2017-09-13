class LogsJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast('logs', render_logs)
  end
  
private

  def render_logs
    logs = Feature::Log.db_log.page(1).per(5)
    ApplicationController.renderer.render(partial: 'components/logs', locals: { logs: logs })
  end
end
