class SurveyController < ApplicationController
  def question
    @asked_question = Question.find_by(id: params[:id])
    @answers_possible = @asked_question.possible_answers
    @user_answer = UserAnswer.new
  end

  def answer
    if session[:user_id].blank?
      user = User.create
      session[:user_id] = user.id
    end

    user_answer = UserAnswer.create(user_answer_params.merge(user_id: session[:user_id]))
    id = user_answer.possible_answer.following_question_id
    if id.blank?
      session[:user_id] = nil
      # render text: "coucou c'est la fin !"
    else
      redirect_to question_path(id)
    end
  end

  private def user_answer_params
    params.require(:user_answer).permit(:possible_answer_id)
  end
end
