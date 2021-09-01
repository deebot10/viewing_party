class ApiService
  def parse_data(url)
    faraday = Faraday.new(url)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
