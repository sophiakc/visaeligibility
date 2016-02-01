class Question < ActiveRecord::Base
  has_many :possible_answers
  # ajouter la relation inverse de following_question : je suis la question suivante de quelle possible_answer ?
end
