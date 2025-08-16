class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]

  def index
    @todos = Todo.all.order(created_at: :desc)
  end

  def new
    @todos = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path, notice: "Todo created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @todo.update(todo_params)
      redirect_to root_path, notice: "Todo updated!"
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path, notice: "Todo deleted!"
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
