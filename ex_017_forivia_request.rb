require 'net/https'
require 'uri'

uri = URI.parse("https://cart2.forivia.com/api/addcart")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri)
forivia_code = try_spree_current_user.forivia_code rescue ""
request['Content-Type'] = 'application/json'

request.body = "{\"SessionID\":0,\"Username\":\"10012\",\"IpAddress\":\"127.0.0.1\",\"UserAgent\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36\",\"CartID\":\"R132781317\",\"CartDetails\":[{\"ItemID\":\"115454\",\"ItemCount\":18},{\"ItemID\":\"9131\",\"ItemCount\":3},{\"ItemID\":\"1121\",\"ItemCount\":13,\"ConfigCode\":\"112859906\"}]}"


# puts request.uri
http.use_ssl = true

response = http.request(request)

puts response.body

