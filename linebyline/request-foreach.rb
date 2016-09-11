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

# Text separated by argument
File.open("data/commas.txt") do |file|
  file.each(",") do |record| 
    puts record
  end
end

# Count the number of a character in a file 
n = 0
File.open("data/lordsprayer.txt") do |file|
  file.each_char do |char|
    n += 1 if char == "b"
  end
end

puts "#{n} b characters in Lord's Prayer."

# Modified example using Enumerable's count method from above
# The count method accepts a block and will return the number of values
# for which the block returne true
n = 
  File.open("data/lordsprayer.txt") do |file|
    file.each_char.count { |char| char == "b"}
  end

puts "#{n} b characters in Lord's Prayer."
  