
# This is Syntax Program of class.
#クラス定義

class Foo
  def initialize(a)
    @a = a
  end
  
  def method1
  @a
  end
end

foo1 = Foo.new(1)
foo2 = Foo.new(2)
p foo1.method1
p foo2.method1