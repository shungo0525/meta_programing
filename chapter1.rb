# initialze: classのオブジェクトが生成されるときに必ず実行される処理を書く
# インスタンスの初期化など

class A
  def initialize(params)
    print(params)
  end
end

a = A.new("a")