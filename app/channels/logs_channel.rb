class LogsChannel < ApplicationCable::Channel  
  def follow
    stop_all_streams
    stream_from 'logs'
  end
  
  def unfollow
    stop_all_streams
  end
end