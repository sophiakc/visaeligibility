class Visa < ActiveRecord::Base
  has_many :applicable_rule_visas
  has_many :applicable_rules, through: :applicable_rule_visas
end
