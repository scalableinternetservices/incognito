module PostsHelper
  def timestampParser(timestamp)
    timestamp = timestamp.to_s
    year = timestamp[0..3]
    month = timestamp[5..6]
    month = month.to_i
    case month
      when 1
        month = "January"
      when 2
        month = "February"
      when 3
        month = "March"
      when 4
        month = "April"
      when 5
        month = "May"
      when 6
        month = "June"
      when 7
        month = "July"
      when 8
        month = "August"
      when 9
        month = "September"
      when 10
        month = "October"
      when 11
        month = "November"
      when 12
        month = "December"
      else
        puts("Wrong date")
    end
    
    day = timestamp[8..9]
    if day[0] == '0'
      day = day[1]
    end
    
    time = timestamp[11..15]
    hour = time[11..12].to_i
    if hour > 12
      hour = (hour - 12).to_s
      time[0] = hour[0]
      time[1] = hour[1]
      time += "pm"
    else
      if hour < 10
        time[0] = ''
      end
      time += "am"
    end 
    
    retString = time + " " + month + " " + day + ", " + year
    return retString
  end
end
