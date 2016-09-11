File.open("access_log") do |log_file|
  requests = log_file.readlines

  requests.each do |request|
    if request.start_with?("127.0.0.1")
      puts request
    end
  end
end