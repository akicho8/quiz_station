class DifficultLevelInfo
  include StaticRecord
  static_record [
    {key: :easy,       name: "かんたん", chars_shadow: -> chars { chars_shadow(chars, 2) }, },
    {key: :normal,     name: "普通",     chars_shadow: -> chars { chars_shadow(chars, 1) }, },
    {key: :difficult,  name: "難しい",   chars_shadow: -> chars { chars_shadow(chars, 0) }, },
    {key: :difficult2, name: "超難しい", chars_shadow: -> chars { ["？"] }, },
  ], :attr_reader => [:name, :chars_shadow]

  # str を全部 "？" にして、 hint 個数だけを見せる
  class << self
    def chars_shadow(chars, hint)
      a = Array.new(chars.size, "？")
      if hint > chars.size - 1
        hint = chars.size - 1
      end
      indexes = (0...a.size).to_a.sample(hint)
      indexes.each {|i| a[i] = chars[i] }
      a
    end
  end
end
