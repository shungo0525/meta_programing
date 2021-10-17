
# yieldでブロックをコールバックする
def a(a, b)
  return a unless block_given?
  a + yield(a, b)
end

p a(1,2) {|x, y| (x + y) * 3 }
p a(1,2)


# 束縛を持ち運ぶ方法
my_var = "成功"
MyClass = Class.new do

  puts "#{my_var}"

  define_method :a do
    puts "#{my_var}"
  end
end

MyClass.new.a

blc = Proc.new {|x| x * 2}
puts blc.call(2)
puts blc


# Procとlambdaの違い → returnが異なる
# Proc: 定義されたスコープから戻る
# lambda: lambdaから戻る

def double(blc)
  blc.call * 2
end

l = lambda { return 10 }
p = Proc.new { 10 } # { return 10 }だと結果が出力されない
puts double(l)
puts double(p)
