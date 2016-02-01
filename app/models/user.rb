class User < ActiveRecord::Base
  has_many :user_answers
  has_many :possible_answers, through: :user_answers
end
