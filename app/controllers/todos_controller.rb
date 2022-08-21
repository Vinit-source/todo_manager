class TodosController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    render "todos"
  end

  def show
    todo = Todo.find(params[:id])
    render plain: todo.to_pleasant_string
  end

  def create
    todo = Todo.create!(todo_text: params[:todo_text], due_date: DateTime.parse(params[:due_date]), completed: false)
    # render plain: "The newly added todo is saved with id: #{todo.id}"
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    # render plain: "Updated todo completed status to #{completed}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
