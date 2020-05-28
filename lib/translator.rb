require "yaml"

# load emoticons.yml file
#  accepts one argument, the file path
  #return a hash where each key is the name ofan emoticon
  #each emoticon name(key) should point to a nested hash containing two keys :english and :japanese
  #:english key in each inner hash points to the respective English emoticon
 
def load_library(file)
  library = YAML.load_file(file)
  result = {}
  library.each do |key, value|
    result[key]={}
    result[key][:english] = value[0]
    result[key][:japanese] = value[1]
  end
 result
end

require 'pry'

# Write a method that will take a traditional Western emoticon (i.g. :)) and translate it to its Japanese version ((＾ｖ＾)). 

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  found_emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  if found_emoticon != nil 
     return library[found_emoticon][:japanese]
  else 
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  english_meaning = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  if english_meaning != nil 
     return english_meaning
  else 
    return "Sorry, that emoticon was not found"
  end
end