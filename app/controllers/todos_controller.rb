class TodosController < ApplicationController
  def index
    @client = JsonPlaceholder::Client.new
    @todos = @client.get_todos
    render "todos/index", locals: { todos: @todos }, formats: :json
  end
end
