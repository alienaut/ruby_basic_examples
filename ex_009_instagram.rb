require 'openssl'
require 'base64'

ips = '200.15.1.1'
secret = 'f59144dc85ef45509abfdafadsafdasdfe2c0f81f886c6'

digest = OpenSSL::Digest::Digest.new('sha256')
signature  = OpenSSL::HMAC.hexdigest(digest, secret, ips)
header = [ips, signature].join('|')
puts header
