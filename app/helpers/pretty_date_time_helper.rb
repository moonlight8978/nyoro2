module PrettyDateTimeHelper
  def time_in_words(time, options = { time: true, date: true })
    if options[:time] && options[:date]
      time.strftime('%Y年%m月%d日 - %H:%M:%S')
    elsif options[:time]
      time.strftime('%H時%M分%S秒')
    elsif options[:date]
      time.strftime('%Y年%m月%d日')
    end
  end
end