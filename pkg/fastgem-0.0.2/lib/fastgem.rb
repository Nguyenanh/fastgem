require 'fastgem/version.rb'
require 'fastgem/table.rb'
%w(net/https uri thread json).each { |lib| require lib }
module Fastgem
  def self.search(q)
    uri = URI.parse("https://rubygems.org/api/v1/search.json?query=#{q}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    results = JSON.parse(response.body)
    table = Fastgem::Table.new
    results.each do |result|
      table.format(result)
    end
    table.after
  end
end
