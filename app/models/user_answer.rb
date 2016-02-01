class UserAnswer < ActiveRecord::Base
  belongs_to :possible_answer
  belongs_to :user
end
