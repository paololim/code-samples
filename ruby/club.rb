require 'uri'
require 'net/http'
require 'openssl'
require 'json'

##########################################################
# Values used later
##########################################################
AUTH_KEY = ENV['LENDING_CLUB_KEY']
ACCOUNT_NUMBER = ENV['LENDING_CLUB_ACCOUNT_NUMBER']
BASE_URL = "https://api.lendingclub.com/api/investor/v1/accounts/#{ACCOUNT_NUMBER}"

##########################################################
# Helpers
##########################################################
def http_client(host, port)
  http = Net::HTTP.new(host, port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http
end

def http_request(url, method)
  if method == :get
    request = Net::HTTP::Get.new(url)
    request["authorization"] = AUTH_KEY
    return request
  elsif method == :post
    request = Net::HTTP::Post.new(url)
    request["authorization"] = AUTH_KEY
    request["content-type"] = 'application/json'
    return request
  else
    raise "Invalid method"
  end
end

##########################################################
# Actual methods to interact with API
##########################################################
def withdraw(amount)
  url = URI("#{BASE_URL}/funds/withdraw")
  http = http_client(url.host, url.port)
  request = http_request(url, :post)
  request.body = {amount: amount}.to_json
  JSON.parse(http.request(request).body) # {"errors"=>[{"field"=>"arg3.amount", "code"=>"validation-error", "message"=>"Invalid transfer amount.", "recoverability"=>nil}]}
end

def available_cash
  url = URI("#{BASE_URL}/availablecash")
  http = http_client(url.host, url.port)
  request = http_request(url, :get)
  response = http.request(request)
  JSON.parse(response.body)["availableCash"] # 0
end

def pending_transfers
  url = URI("#{BASE_URL}/funds/pending")
  http = http_client(url.host, url.port)
  request = http_request(url, :get)
  response = http.request(request)
  JSON.parse(response.body)["transfers"] # [{"transferId"=>1261183323, "transferDate"=>"2016-06-23T08:20:02.000-07:00", "amount"=>22.71, "sourceAccount"=>"BANK OF AMERICA, N.A.", "status"=>"Posted", "frequency"=>nil, "endDate"=>nil, "operation"=>"WITHDRAW_FUNDS", "cancellable"=>false}]
end

##########################################################
# Main script over here
##########################################################
available = available_cash
if available > 0
  puts "Available cash: #{available}"
  puts "Withdraw: #{withdraw(available)}"
else
  puts "No available cash to withdraw"
end

puts "Pending Transfers:\n#{pending_transfers}\n"
