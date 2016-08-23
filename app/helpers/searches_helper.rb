module SearchesHelper



  def schedule(result)
    output = "Every "
    unless result["week1"] == "True" && result["week2"] == "True" && result["week3"] == "True" && result["week4"] == "True" && result["week5"] == "True"
      if result["week1"] == "True"
        output += "first, "
      elsif result["week2"] == "True"
        output += "second, "
      elsif result["week3"] == "True"
        output += "third, " 
      elsif result["week4"] == "True"
        output += "fourth, "
      elsif result["week5"] == "True"
        output += "fifth, "
      end
      output[-2..-1] = " "
    end
    if result["monday"] == "True" && result["tuesday"] == "True" && result["wednesday"] == "True" && result["thursday"] == "True" && result["friday"] == "True" && result["saturday"] == "True" && result["sunday"] == "True"
      output += "day from "
    else
      if result["monday"] == "True"
        output += "Monday, "
      elsif result["tuesday"] == "True"
        output += "Tuesday, "
      elsif result["wednesday"] == "True"
        output += "Wednesday, " 
      elsif result["thursday"] == "True"
        output += "Thursday, " 
      elsif result["friday"] == "True"
        output += "Friday, " 
      elsif result["saturday"] == "True"
        output += "Saturday, " 
      elsif result["sunday"] == "True"
        output += "Sunday, "
      end
      output[-2..-1] = " from "
    end
    output += result["starttime"].to_time.strftime("%l %p") 
    output += " to "
    output += result["endtime"].to_time.strftime("%l %p")
    output
  end
  
end
