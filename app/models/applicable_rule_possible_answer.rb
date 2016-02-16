class ApplicableRulePossibleAnswer < ActiveRecord::Base
  belongs_to :possible_answer
  belongs_to :applicable_rule
end
