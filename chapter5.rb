class A
  puts self
end

a = A.new # -> A
puts a # -> オブジェクト

# instance_eval, class_evalはselfを変更する

c = Class.new do
  def my_method
    puts "Hello"
  end
end

puts c


class B
  # クラスメソッド(特異メソッド)
  def self.class_method
    puts "class method"
  end

  # 下記も同じ クラスメソッド(特異メソッド)
  # def B.class_method
  #   //
  # end

  def instance_method
    puts "instance method"
  end
end

B.class_method
B.new.instance_method

# define_method 動的にメソッドを定義できる
class C
  def self.deprecate(old_method, new_method)  # ここはなぜクラスメソッド？
    define_method(old_method) do |*args, &block|
      warn "Warning: Do not use #{old_method}() -> Please use #{new_method}()"
      send(new_method, *args, &block)
    end
  end

  def title(args)
    puts "title: #{args}"
    # yield(args)
  end

  deprecate :Title, :title # ここがなぜ機能する。どのタイミングで機能する？
end

# C.new.Title("test")

## 実行結果
# Warning: Do not use Title() -> Please use title()
# title: test

# メソッドをcapitalizeで呼ぶと、小文字のメソッド使用してくださいと警告が出る →　小文字の場合のメソッドが動的に走る

# C.new.Title("test") { |x| puts x}


class HelloWorld
  def self.say_hello
    p 'hello world'
  end
  say_hello
end



# クラス拡張
module MyModule
  def my_method
    puts "hello"
  end

  # module_function :my_method
  # public :my_method
end

# https://qiita.com/nakamurau1@github/items/20ed074563360a2f1ffc

class MyClass
  class << self
    include MyModule # includeするとmoduleのインスタンスメソッドが手に入る、クラスメソッドではない
  end
end

MyClass.my_method
# MyModule.my_method


class D
  extend MyModule # レシーバーの特異クラスにモジュールをインクルードする(今回で言えばレシーバは`D`)
end

D.my_method



# アラウンドエイリアス
class E
  def my_method
    puts "my_method"
  end

  alias :m :my_method
end

e = E.new
e.my_method
e.m


class String
  alias_method :real_length, :length

  def length   # 新しいメソッドを定義している。元のメソッドを変更しているわけではない
    real_length > 5 ? "long" : "short"
  end
end

puts "aaaaaa".length    # 再定義したメソッドを呼び出している
puts "aaaaaa".real_length   # エイリアスでlengthが呼ばれる


class AA
  def hoge
    puts "メソッド: hoge"
  end
end

# AA.new.hoge

AA.class_eval do
  puts "class_evalでselfをputsする: #{self}"
end


module TestModule
  def aaa
    puts "module: aaa"
  end
end

class Class
  include TestModule
  # prepend TestModule
  # extend TestModule
 
  def bbb
    puts "bbb"
  end

  def aaa
    puts "class: bbb"
  end
end

Class.new.bbb
Class.new.aaa
# Class.aaa  # extendはインスタンスを生成せずにmoduleを呼べるようになる

# クラスマクロ
## attr_accessorなど
