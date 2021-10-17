class User
  # インスタンスメソッド
  def p_name
    p "name"
  end

  def p_password
    p "password"
  end

  # クラスメソッド
  def self.hoge
    p "hoge"
  end

  class << self
    def foo
      p "foo"
    end
  end
end

user = User.new
# p user
user.p_name
user.p_password
User.hoge
User.foo
# user.hoge


class A
  def a_method
    p "a_test"
    p self
  end

  def b_method
    p "b_test"
  end
end

class B < A
  def self.c_method
    p "c_test"
    p self
  end

  def d_method
    p "d_test"
  end
end

# inctance_methodsはメソッドを一覧表示する(trueの場合は親クラスのメソッドも表示する)
p A.instance_methods(false)
p B.instance_methods(false)
# p B.instance_methods(true)

a = A.new
p a.a_method
p B.c_method


# 特異メソッド (クラスメソッドも特異メソッドである)
str = "STR"

def str.title?
  self.upcase == self
end

p str.title?
