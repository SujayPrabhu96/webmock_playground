require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /todos" do
    it "works! (now write some real specs)" do
      stub_request(:get, "https://jsonplaceholder.typicode.com/todos")
      .to_return(status: 200, body: {
        todos: [
          {
            id: 1,
            title: "delectus aut autem",
            completed: false
          }
        ]
      }.to_json, headers: {})
      get todos_path
      expect(response).to have_http_status(200)

      first_todo = response.parsed_body["todos"].first
      expect(first_todo["id"]).to eq(1)
      expect(first_todo["title"]).to eq("delectus aut autem")
      expect(first_todo["completed"]).to eq(false)
    end
  end
end
