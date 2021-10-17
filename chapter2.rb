class A
  def x
    puts("x")
  end
end

# 既存のクラスを再オープンしてその場で修正できる
# →オープンクラスと呼ぶ
class A
  def y
    puts("y")
  end
end


# メソッドyが追加されている
a = A.new
puts a.x
puts a.y

puts([].methods.grep /^re/)


class User
  def initialize(name, age)
    @name = name
    @age = age
  end

  def my_method
    @v =1
  end

  def a
    puts self
  end
end

taro = User.new('Taro', 20)
taro.my_method #my_methodを呼び出さないとインスタンス変数が出現しない
# インスタンス変数の確認
puts taro.instance_variables

puts(User.class.instance_methods(false))
puts(Module.instance_methods(false))

# load 'test.rb'
# require './test.rb'
taro.a


class B
  def public_method
    private_method
  end

  private

    def private_method
      puts "test"
    end
end

B.new.public_method

# 継承チェーンの確認方法
puts(Class.class.ancestors)



# refine(モンキーパッチの範囲を限定している)
class C
  def foo
    puts "C#foo"
  end
end

module M
  refine C do
    def foo
      puts "C#foo in M"
    end
  end
end

x = C.new
x.foo # => "C#foo"

using M

x = C.new
x.foo # => "C#foo in M"
