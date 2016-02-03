class SurveyController < ApplicationController
  def question
    @asked_question = Question.find_by(id: params[:id])
    @answers_possible = @asked_question.possible_answers
    @user_answer = UserAnswer.new
  end

  def answer
    UserAnswer.create(user_answer_params) #sauvegarde la réponse, affiche une page avec la question suivante, renvoit l'utilisateur sur la prochaine question
    #trouver la following question
  end

  private def user_answer_params
    params.require(:user_answer).permit(:possible_answer_id, :user_id)
    # ds la clé user_answer je permets certains strong parameters
    # regarder la doc de "strong parameters" et remplir permit(...)
  end
end
