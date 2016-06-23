require 'uri'
require 'net/http'
require 'openssl'
require 'json'

AUTH_KEY = ENV['LENDING_CLUB_KEY']
ACCOUNT_NUMBER = ENV['LENDING_CLUB_ACCOUNT_NUMBER']

BASE_URL = "https://api.lendingclub.com/api/investor/v1/accounts/#{ACCOUNT_NUMBER}"

def http_client(host, port)
  http = Net::HTTP.new(host, port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http
end

def withdraw(amount)
  url = URI("#{BASE_URL}/funds/withdraw")
  http = http_client(url.host, url.port)
  request = Net::HTTP::Post.new(url)
  request["authorization"] = AUTH_KEY
  request["content-type"] = 'application/json'
  request.body = '{"amount": 0}'
  JSON.parse(http.request(request).body)
  # {"errors"=>[{"field"=>"arg3.amount", "code"=>"validation-error", "message"=>"Invalid transfer amount.", "recoverability"=>nil}]}
end

def available_cash
  url = URI("#{BASE_URL}/availablecash")
  http = http_client(url.host, url.port)
  request = Net::HTTP::Get.new(url)
  request["authorization"] = AUTH_KEY
  response = http.request(request)
  JSON.parse(response.body)["availableCash"]
  # 0
end

def pending_transfers
  url = URI("#{BASE_URL}/funds/pending")
  http = http_client(url.host, url.port)
  request = Net::HTTP::Get.new(url)
  request["authorization"] = AUTH_KEY
  response = http.request(request)
  JSON.parse(response.body)["transfers"]
  # [{"transferId"=>1261183323, "transferDate"=>"2016-06-23T08:20:02.000-07:00", "amount"=>22.71, "sourceAccount"=>"BANK OF AMERICA, N.A.", "status"=>"Posted", "frequency"=>nil, "endDate"=>nil, "operation"=>"WITHDRAW_FUNDS", "cancellable"=>false}]
end

available = available_cash
if available > 0
  puts "Available cash: #{available}"
  puts "Withdraw: #{withdraw(available)}"
else
  puts "No available cash to withdraw"
end

puts "Pending Transfers:\n#{pending_transfers}\n"
