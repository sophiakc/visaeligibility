class PossibleAnswer < ActiveRecord::Base
  has_many :user_answers
  has_many :users, through: :user_answers
  belongs_to :question
  belongs_to :following_question, class_name: "Question"
end
