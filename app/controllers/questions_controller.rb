class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy update edit ]

  def show
    @answer = @question.answers.build
  end

  def destroy
    @question.destroy
    flash[:success] = "Question destroy!"
    @question[:success] = "Question deleted!"
    redirect_to questions_path
  end

  def update
    if @question.update question_params
      flash[:success] = "Question update!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def edit
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
      flash[:success] = "Question created!"
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
