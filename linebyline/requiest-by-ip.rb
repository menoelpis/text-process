requests = 
  File.open("data/access_log") do |file|
    file
      .map { |line| { ip: line.split[0], url: line.split[4] } }
      .group_by { |request| request[:ip] } 
      .each { |ip, requests| requests.map! { |r| r[:url] } }
  end

puts requests

# The data structure after the group_by
# {
#   "127.0.0.1" => [
#     {:ip=>"127.0.0.1", :url=>"/"},
#     {:ip=>"127.0.0.1", :url=>"/images/logo.png"}
#   ],
#   "192.168.0.42" => [
#     {:ip=>"192.168.0.42", :url=>"/"},
#     {:ip=>"192.168.0.42", :url=>"/about.html"}
#   ],
#   "192.168.0.91" => [
#     {:ip=>"192.168.0.91", :url=>"/person.jpg"}
#   ]
# }

# The data structure after each method
# {
#   "127.0.0.1" => [
#     "/",
#     "/images/logo.png"
#   ],
#   "192.168.0.42" => [
#     "/",
#     "/about.html"
#   ],
#   "192.168.0.91" => [
#     "/person.jpg"
#   ]
# }