class ApplicableRule < ActiveRecord::Base
  has_many :applicable_rule_visas
  has_many :visas, through: :applicable_rule_visas
  has_many :applicable_rule_possible_answers
  has_many :possible_answers, through: :applicable_rule_possible_answers
end
