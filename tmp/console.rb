require 'rubygems'

$consumer_key = 'qyprdL8NUDMYcCzwp8ea9KbIhaMSRk'
$consumer_secret = 'FcE5kihBYMVQGvX9UNYMxsrM8mP7bfuxc36PLhJB'

$oauth = OAuth::Consumer.new($consumer_key, $consumer_secret, {
    :site                 => "https://oauth.intuit.com",
    :request_token_path   => "/oauth/v1/get_request_token",
    :authorize_path       => "/oauth/v1/get_access_token",
    :access_token_path    => "/oauth/v1/get_access_token",
    :proxy => "http://127.0.0.1:8080"
})

intuit_account = IntuitAccount.find(8)
service = Quickeebooks::Windows::Service::ServiceBase.new
service.access_token = intuit_account.consumer
service.realm_id = intuit_account.realm_id
url = "https://services.intuit.com/sb/customfielddefinition/v2/#{intuit_account.realm_id}"
service.do_http_get(url)