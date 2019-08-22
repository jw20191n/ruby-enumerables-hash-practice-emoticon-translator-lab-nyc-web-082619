require "yaml"
  
def load_library(path)

  emoticons = YAML.load_file(path)
  # NOTE
  # => name of the emotions (angel, angry, etc.) are keys of the hash emoticons; 
  # emoticons[key][0] = english emotions; emoticons[key][1] = japanese emotions
  # {
  #   "angle" => ["O:)", "☜(⌒▽⌒)☞"],
  #   "angry" => [ , ].....
  # }
  
  hash = { "get_meaning": { }, "get_emoticon": { } }
  
  # :get_meaning => {"☜(⌒▽⌒)☞" => ""angel",
  # ("japanese emoticons" => "key"),...}
  # :get_emoticon => {"emoticons[key][0]" (english) => "emoticons[key][1]"(japanese)}
  
  emoticons.each_key do | key |
      hash[:get_meaning][emoticons[key][1]] = key
      hash[:get_emoticon][emoticons[key][0]] = emoticons[key][1]
      
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  dictionary = load_library(path)
  if dictionary[:get_emoticon].include?(emoticon)
    return dictionary[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  dictionary = load_library(path)
  if dictionary[:get_meaning].include?(emoticon)
    return dictionary[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end