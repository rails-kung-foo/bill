class CustomersBill
  SKY_BILLING_URI = 'http://safe-plains-5453.herokuapp.com/'

  attr_reader :billing_file

  def initialize(args={})
    @billing_file = args[:billing_file] || 'bill.json'
  end

  def get_bill
    http_get_request
  end

  private

  # Build URL to customers bill.
  def billing_url
    "#{ SKY_BILLING_URI }#{ billing_file }"
  end

  # CHeck if URI is https and returns boolean. Used to set http.use_ssl
  def is_uri_https?(uri_scheme)
    uri_scheme == 'https'
  end

  # Prepare and request file/data from resource
  def http_get_request
    # prepare URI
    uri = URI.parse(billing_url)
    http = Net::HTTP.new(uri.host, uri.port)

    # prepare SSL
    http.use_ssl = is_uri_https?(uri.scheme)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # prepare GET request
    request = Net::HTTP::Get.new(uri.request_uri)

    # Get the bill
    http.request(request)
  end
end
