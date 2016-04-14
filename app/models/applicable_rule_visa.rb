class ApplicableRuleVisa < ActiveRecord::Base
  belongs_to :visa
  belongs_to :applicable_rule
end
