class ResultController < ApplicationController
  def result
    @user = User.find_by(id: params[:id])
    @user_answers = @user.user_answers #un tableau de user_answer (car plusieurs) => appeler les différents éléments du tableau
    @possible_answers = @user_answers.map{ |user_answer| user_answer.possible_answer }
    @applicable_rules = @possible_answers.map{ |possible_answer| possible_answer.applicable_rules }.flatten.uniq


    @visas = Visa.all
    @eligible_visas = @visas.map do |visa| #sauvegarde le résultat de la boucle vs. .each
      @visa_applicable_rules = visa.applicable_rules
      if (@applicable_rules & @visa_applicable_rules).size == @visa_applicable_rules.size
        visa
      end
    end
    @eligible_visas = @eligible_visas.compact #permet de ne garder que les valeurs contenant les noms de visa, sans les "nil"

    # render text: "coucou c'est la fin !"
  end
end
