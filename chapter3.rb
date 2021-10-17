class A
end

# A.new.send(:method_missing, :a)

# 可変長引数　配列になる
def a(*args)
  puts "#{args}"
end

a(1,2,3,4,5)  # -> [1,2,3,4,5]

class B
  def method_missing(method_name, *args, &block)
    puts "#{method_name}が呼ばれました"
    puts block
  end

  def a
  end
end

B.new.hello { p "block" }
p B.new.respond_to?(:hello)
p B.new.respond_to?(:a)


class Roulette
  def get_number(*people)
    people.each do |person|
      puts "#{person} got #{rand(10)}"
    end
  end
end

Roulette.new.get_number("a", "b", "c")
