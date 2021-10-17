def method
  return yield if block_given?
  p('なし')
end

method { p "ブロック" }
method


def cal(a, b)
  a + yield(a, b)
end

cal(1, 2) {|x, y| (x+y) * 3}


#メソッド定義
def give_me_block( &block )
  block.call
end

#実行
give_me_block do
  p "Hello, block!"
end

# 動的にメソッドを定義する
# define_method(メソッド名){メソッドの処理}という形式で使用
class Fruit
  hash = {ruby:"Rails",php:"CakePHP",swift:"perfect"}
  hash.each do |k,v|
    define_method(k){p v}
  end
end

# sendメソッド
class User
  def initialize
    @a = 1
  end
  def age(num)
    puts "私は#{num}歳です"
  end
end

user = User.new
user.instance_eval do   # オブジェクトにインスタンスメソッドを定義したりできる
  p self
end
user.age(20)
user.send(:age, 20)
user.send("age", 20)

# 動的にメソッド名を変更できる
class User
  attr_accessor :sex
  def initialize(sex = nil)
    @sex = sex
  end

  def man_method(a)
    puts "僕は男です #{a}"
  end

  def woman_method(a)
    puts "私は女です #{a}"
  end
end

user = User.new
# sexによって使うメソッドを変える
# user.sex = "man"
user.sex = "woman"
prefix = user.sex == "man" ? "man" : "woman"
user.send("#{prefix}_method", "test")


# ブロックを定義すると、束縛を持ち運ぶことができる
# class: Class.new, module: Module.new, def: Module.define_method


# Procはブロックをオブジェクトにしたもの
# callで呼び出す
inc = Proc.new {p "block"}
inc.call
puts inc
