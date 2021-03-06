class QuestionsController < ApplicationController
  def show
    @question = Question.find_by params[:id]
  end

  def destroy
    @question = Question.find_by params[:id]
    @question.destroy
    redirect_to questions_path
  end

  def update
    @question = Question.find_by params[:id]
    if @question.update question_params
      redirect_to question_path
    else
      render :edit
    end
  end

  def edit
    @questions = Question.find_by params[:id]
  end

  def index
    @questions = Question.all
  end

  

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
