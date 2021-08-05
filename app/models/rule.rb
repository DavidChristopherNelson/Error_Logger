class Rule < ApplicationRecord

  def rule_engine(error)
    error_state_hash = error.attributes
    return_array = []
    Rule.all.each do |rule|
      error_state_hash.keys.each do |key|
        if key == rule.field
          if error_state_hash[key].match(Regexp.new(rule.regex))
            error.path = rule.path
            error.save
            return error.path
          end
        end
      end
    end
    error_path = "/uncategorized"
  end
end
