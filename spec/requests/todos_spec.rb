require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /todos" do
    it "returns todos" do
      get todos_path
      expect(response).to have_http_status(200)

      first_todo = response.parsed_body["todos"].first
      expect(first_todo["id"]).to eq(1)
      expect(first_todo["title"]).to eq("delectus aut autem")
      expect(first_todo["completed"]).to eq(false)
    end
  end
end
