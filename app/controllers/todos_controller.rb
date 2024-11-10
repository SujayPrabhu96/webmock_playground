class TodosController < ApplicationController
  def index
    @client = JsonPlaceholder::Client.new
    @todos = @client.get_todos
  end
end
