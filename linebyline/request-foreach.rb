# Method that takes the size of log file --> Not good for a big file
# File.open("access_log") do |log_file|
#   requests = log_file.readlines

#   requests.each do |request|
#     if request.start_with?("127.0.0.1")
#       puts request
#     end
#   end
# end

# Method that takes less memory
# File.open("access_log") do|log_file|
#   log_file.each_line do |request|
#         if request.start_with?("127.0.0.1")
#       puts request
#     end
#   end
# end

# Simplified Version of Above Example
File.foreach("data/access_log") do |request|
  if request.start_with?("127.0.0.1")
    puts request
  end
end