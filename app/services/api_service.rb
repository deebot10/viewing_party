class ApiService 
  @key = 'bd19e0e9dbaaef8c0424587ab6f34b4f'

  def parse_data(url)
    farday = Faraday.new(url) 
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end