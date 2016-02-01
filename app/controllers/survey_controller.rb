class SurveyController < ApplicationController
  def question
    @asked_question = Question.find_by(id: params[:id])
    @answers_possible = @asked_question.possible_answers
  end
end
