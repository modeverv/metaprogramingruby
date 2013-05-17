#! /usr/bin/env ruby
# -*- coding:utf-8 -*-

RUBY_VERSION # => "2.0.0"

class String
  def to_alphanumeric
    gsub /[^\w\s]/,'' # !> ambiguous first argument; put parentheses or even spaces
  end
end

require 'test/unit'

class StringExtensionTest < Test::Unit::TestCase
  def test_strips_non_alphanumeric_characters
    assert_equal '3 the Magic Number','#3, the *Magic, Number*?'.to_alphanumeric
  end
end


3.times do
  class C
    puts "Hello"
  end
end

class D
  def x; 'x'; end
end
class D
  def y; 'y'; end
end


obj = D.new
obj.x # => "x"
obj.y # => "y"

class Numeric
  def to_money
    self.to_s
  end
end

100.to_money # => "100"

class MyObj
  # MyObjのインスタンスメソッド
  def my_methods
    @v = 1
  end
end

obj = MyObj.new
obj.class # => MyObj
obj.methods # => [:my_methods, :pretty_print, :pretty_print_cycle, :pretty_print_instance_variables, :pretty_print_inspect, :nil?, :===, :=~, :!~, :eql?, :hash, :<=>, :class, :singleton_class, :clone, :dup, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :freeze, :frozen?, :to_s, :inspect, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :send, :public_send, :respond_to?, :extend, :display, :method, :public_method, :define_singleton_method, :object_id, :to_enum, :enum_for, :pretty_inspect, :==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__]
obj.methods.grep /my/ # => [:my_methods] # !> ambiguous first argument; put parentheses or even spaces
## 変数の数が違うこと。
obj.instance_variables # => []

obj.my_methods

obj.instance_variables # => [:@v]

MyObj.instance_methods.size # => 60
MyObj.methods.size # => 100

"hello".class.instance_methods # => [:<=>, :==, :===, :eql?, :hash, :casecmp, :+, :*, :%, :[], :[]=, :insert, :length, :size, :bytesize, :empty?, :=~, :match, :succ, :succ!, :next, :next!, :upto, :index, :rindex, :replace, :clear, :chr, :getbyte, :setbyte, :byteslice, :to_i, :to_f, :to_s, :to_str, :inspect, :dump, :upcase, :downcase, :capitalize, :swapcase, :upcase!, :downcase!, :capitalize!, :swapcase!, :hex, :oct, :split, :lines, :bytes, :chars, :codepoints, :reverse, :reverse!, :concat, :<<, :prepend, :crypt, :intern, :to_sym, :ord, :include?, :start_with?, :end_with?, :scan, :ljust, :rjust, :center, :sub, :gsub, :chop, :chomp, :strip, :lstrip, :rstrip, :sub!, :gsub!, :chop!, :chomp!, :strip!, :lstrip!, :rstrip!, :tr, :tr_s, :delete, :squeeze, :count, :tr!, :tr_s!, :delete!, :squeeze!, :each_line, :each_byte, :each_char, :each_codepoint, :sum, :slice, :slice!, :partition, :rpartition, :encoding, :force_encoding, :b, :valid_encoding?, :ascii_only?, :unpack, :encode, :encode!, :to_r, :to_c, :to_alphanumeric, :>, :>=, :<, :<=, :between?, :pretty_print, :pretty_print_cycle, :pretty_print_instance_variables, :pretty_print_inspect, :nil?, :!~, :class, :singleton_class, :clone, :dup, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :freeze, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :send, :public_send, :respond_to?, :extend, :display, :method, :public_method, :define_singleton_method, :object_id, :to_enum, :enum_for, :pretty_inspect, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__]

"hello".class.class.instance_methods # => [:allocate, :new, :superclass, :freeze, :===, :==, :<=>, :<, :<=, :>, :>=, :to_s, :inspect, :included_modules, :include?, :name, :ancestors, :instance_methods, :public_instance_methods, :protected_instance_methods, :private_instance_methods, :constants, :const_get, :const_set, :const_defined?, :const_missing, :class_variables, :remove_class_variable, :class_variable_get, :class_variable_set, :class_variable_defined?, :public_constant, :private_constant, :module_exec, :class_exec, :module_eval, :class_eval, :method_defined?, :public_method_defined?, :private_method_defined?, :protected_method_defined?, :public_class_method, :private_class_method, :autoload, :autoload?, :instance_method, :public_instance_method, :pretty_print_cycle, :pretty_print, :pretty_print_instance_variables, :pretty_print_inspect, :nil?, :=~, :!~, :eql?, :hash, :class, :singleton_class, :clone, :dup, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :send, :public_send, :respond_to?, :extend, :display, :method, :public_method, :define_singleton_method, :object_id, :to_enum, :enum_for, :pretty_inspect, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__]

String.superclass # => Object
String.superclass.superclass # => BasicObject
String.superclass.superclass.superclass # => nil

Class.superclass # => Module
Module.superclass # => Object
Object.superclass # => BasicObject

MyConstant = 'constant'
module MyModule
  MyConstant = 'external constant'

  class MyClass
    MyConstant = 'internal constant'
    def self.hoge
      ::MyModule::MyConstant # => "external constant"
      'MyClass.self.hoge'
    end

    # 内部を外部に変換する感じ　キモい
    def self.fuga
      ::MyConstant # => "constant"
    end

    hoge # => "MyClass.self.hoge"
    fuga # => "constant"
  end
  
  module MyModule2
    MyConstant = 'internal constant2'    
  end
  
  MyConstant # => "external constant"
  MyClass::MyConstant # => "internal constant"

end

MyModule::MyConstant # => "external constant"
MyModule::MyClass::MyConstant # => "internal constant"
MyModule::MyModule2::MyConstant # => "internal constant2"

# use module as namespace
module App
  class Hoge
    def h
      'a'
    end
  end
  h = Hoge.new
  h.h # => "a"
end

Object.class # => Class
Module.superclass # => Object
Class.class # => Class

"reverse".reverse # => "esrever"




__END__
# classは再オープンできる。
# stringにも俺俺メソッドを追加できる
# classキーワードはクラスの宣言と言うよりもクラスコンテキストにあなたを連れて行くイメージ

# >> Hello
# >> Hello
# >> Hello
# >> Run options: 
# >> 
# >> # Running tests:
# >> 
# >> .
# >> 
# >> Finished tests in 0.003387s, 295.2465 tests/s, 295.2465 assertions/s.
# >> 
# >> 1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
# >> 
# >> ruby -v: ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
