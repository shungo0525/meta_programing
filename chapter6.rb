require "pry"

array = [10, 20]
array2 = 30
# stringをコードとして実行できる
eval("p array << array2")


def sample
  a = 1
  binding ##sampleの　Binding(スコープをオブジェクトにしたもの)を生成して返す
end

eval("p a", sample)

array = [1,2,3]
x = 'd'
puts array.instance_eval "self[1] = x"
# array.instance_eval do
#   self[1] = x
# end
# p array

# p "please type:"
# input = gets()
# puts "word: #{input}"

module M;end

class String
  # 継承されたタイミングで発火する(フックメソッド)
  def self.inherited(subclass)
    puts "#{self}は#{subclass}に継承された"
    super # superがないと、イベントはキャッチできるが、includeができない
  end
end

class Test < String
  def self.include(modules)
    puts "included #{modules}"
  end
  include M
end

# 他にもincluded, prepended, extended,などがある
