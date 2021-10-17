class MyClass
  # attr_accessor :name
  # attr_reader :name
  # attr_writer :name

  def initialize(name)
    @name = name
  end

  # def name=(val)
  #   @name = val
  # end

  def say
    puts "私の名前は" + @name + "です"
  end
end

obj = MyClass.new("test")
# obj.name = "update"
# puts obj.class
# puts obj.methods
# puts obj.instance_variables
# puts obj.say
# puts obj.name

# puts String.class.instance_methods
# puts String.methods

module M
  class C
    module M2
      # p Module.nesting
    end
  end
end

module Document

end

module Printable

end

class Book
  include Document
  include Printable
end

# book = Book.new
# puts book.class
# p Book.ancestors  # 継承チェーン


class Member
  # attr_reader :name
  attr_writer :name

  # def initialize(name)
  #   @name = name
  # end

  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end
end
# member = Member.new("test")
member = Member.new
p member.name = "update"
# p member.name
# p member.name # => nil
# p member.name = "Chimei" # => "Chimei"
# p member.name # =>  "Chimei"
