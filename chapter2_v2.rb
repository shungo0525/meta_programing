# オープンクラス
class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

p "!gset%&()'()h".to_alphanumeric


# [].methods.grep /^re/
# Rake -> rubyのビルドシステム

module M1
  def my_mehod
    'M1#my_method'
  end
end

class C
  include M1
end

class C2
  prepend M1
end

class D < C
end

class D2 < C2
end

p D.ancestors
p D2.ancestors

# 多重インクルードすると最初に呼ばれたものが実行される

class C3
  def public_method
    p 'public'
    private_method
    # self.private_method -> 呼び出せない
  end

  private

    def private_method
      p 'private'
    end
end

C3.new.public_method