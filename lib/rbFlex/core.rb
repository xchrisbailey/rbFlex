class Rbflex
  attr_accessor :server, :user, :password
  def initialize(server, user)
    @flex = []
    begin
      Net::SSH.start( server, user ) do |ssh|
        ssh.exec!("cat ~/.flexget/flexget.log") do |channel, steam, data|
          data.split("\n").map { |line| @flex << line if line.match(/Downloading/) }
        end
      end
    rescue Net::SSH::Disconnect
      puts "SSH Connection Timed Out"
      exit 1
    end
  end

  def deleteFlexlog(server, user)
    puts "Are you sure you want to delete flexget.log on #{server}? Y/n"
    if $stdin.gets.chomp.downcase == 'y'
      Net::SSH.start( server, user ) do |ssh|
        ssh.exec!("rm ~/.flexget/flexget.log")
      end

      puts "\e[92mFlexget.log has been removed from #{server}\e[0m"
    else
      puts "\e[92mFlexget.log delete aborted!"
      exit
    end
  end

  def printAll
    if @flex.length == 0
      puts "\e[92mNo new shows.\e[0m"
      exit 1
    end
    @flex.each do |download|
      begin
        show_info = self.cleanString(download)
        printShows(show_info)
      rescue
        next
      end
    end
  end

  def printYesterday
    if @flex.length == 0
      puts "\e[92mNo new shows.\e[0m"
      exit 1
    end
    @flex.each do |download|
      show_info = self.cleanString(download)
      yest_day  = 1.day.ago.to_s.match(/\d{4}-(\d{2}-\d{2}).*/).captures
      check_day = show_info[0].to_s.match(/\d{4}-(\d{2}-\d{2}).*/).captures

      if yest_day == check_day
        printShows(show_info)
      end
    end
  end

  def printToday
    if @flex.length == 0
      puts "\e[92mNo new shows.\e[0m"
      exit 1
    end
    @flex.each do |download|
      show_info = self.cleanString(download)
      too_day   = Time.now.to_s.match(/\d{4}-(\d{2}-\d{2}).*/).captures
      check_day = show_info[0].to_s.match(/\d{4}-(\d{2}-\d{2}).*/).captures

      if too_day == check_day
        printShows(show_info)
      end
    end
  end

  def cleanString(line)
    date, series_name, season, episode =
      line.match(/(\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}).*Downloading:\s(.*)\s-\s
                 S(\d{2})E(\d{2})/x).captures
    date = date + "-4"
    date = DateTime.strptime(date, '%Y-%m-%d %H:%M%z')
    return date, series_name, season, episode
  end

  def printShows(show_info)
    puts "\e[35m#{show_info[1]} \e[96mS#{show_info[2]}E#{show_info[3]}".rjust(58) +
      "\e[0m | downloaded \e[93m#{distance_of_time_in_words_to_now(show_info[0])} \e[36mago\e[0m"
  end
end
