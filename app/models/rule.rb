class Rule < ApplicationRecord

  def rule_engine
    return_value = [] #{"SELECT filter FROM rules ORDER BY execution_order"}
    Rule.all.each do |rule|
      return_value << rule.filter
    end
    return_value
  end
=begin
  def rule_engine(error)
    filter_hash = convert_string_to_hash(@rule_group.filter)
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"

    "SELECT full_name, last_login FROM users
    ORDER BY last_login;"
    
    rule_list = "SELECT field, regex, path FROM rules
                 ORDER BY execution_order" (is this a hash? an array? how can I find out?)

    error.path = "/urgent" if filter_hash.all? do |field, regex|
      @rule.field.match(Regexp.new regex)
    end
  end
=end

  def convert_string_to_hash(hash_text)
    # Transform object string symbols to quoted strings
    hash_text.gsub!(/([{,]\s*):([^>\s]+)\s*=>/, '\1"\2"=>')
    
    # Transform object string numbers to quoted strings
    hash_text.gsub!(/([{,]\s*)([0-9]+\.?[0-9]*)\s*=>/, '\1"\2"=>')
    
    # Transform object value symbols to quotes strings
    hash_text.gsub!(/([{,]\s*)(".+?"|[0-9]+\.?[0-9]*)\s*=>\s*:([^,}\s]+\s*)/, '\1\2=>"\3"')
    
    # Transform array value symbols to quotes strings
    hash_text.gsub!(/([\[,]\s*):([^,\]\s]+)/, '\1"\2"')
    
    # Transform object string object value delimiter to colon delimiter
    hash_text.gsub!(/([{,]\s*)(".+?"|[0-9]+\.?[0-9]*)\s*=>/, '\1\2:')
    
    JSON.parse(hash_text)
  end
end
