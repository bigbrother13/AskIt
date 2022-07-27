class AnswersController < ApplicationController
  before_action :set_question!

  def create
    # render plain: params ==>> (что посмотреть какие параменты прихолят в экшон)

    answer = @question.answers.build answer_params

    if answer.save
      redirect_to questions_path(@question)
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find params[:question_id]
  end
end
