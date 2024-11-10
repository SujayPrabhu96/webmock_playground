module JsonPlaceholder
  class Client
    JSON_PLACEHOLDER_ENDPOINT = ENV.fetch("JSON_PLACEHOLDER_ENDPOINT", "https://jsonplaceholder.typicode.com")

    def initialize(attributes = {})
      @client ||= Faraday.new(url: JSON_PLACEHOLDER_ENDPOINT) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
        # any other configuration here like passing headers
      end
    end

    def get_todos
      response = @client.get("/todos")
      if response.status == 200
        JSON.parse(response.body)
      else
        raise "Failed to fetch todos"
      end
    end
  end
end
