# -*- coding:utf-8 -*-
RUBY_VERSION # => "2.0.0"
"1.5.1 メソッド探索" # !> possibly useless use of a literal in void context
class MyClass
  def my_method # !> previous definition of my_method was here
    'my_method()'
  end
end

class MySubclass < MyClass
  
end

obj = MySubclass.new
obj.my_method # => "my_method()"

MySubclass.ancestors # => [MySubclass, MyClass, Object, Kernel, BasicObject]

Kernel.methods.sort # => [:!, :!=, :!~, :<, :<=, :<=>, :==, :===, :=~, :>, :>=, :Array, :Complex, :Float, :Hash, :Integer, :Rational, :String, :__callee__, :__dir__, :__id__, :__method__, :__send__, :`, :abort, :ancestors, :at_exit, :autoload, :autoload?, :binding, :block_given?, :caller, :caller_locations, :catch, :class, :class_eval, :class_exec, :class_variable_defined?, :class_variable_get, :class_variable_set, :class_variables, :clone, :const_defined?, :const_get, :const_missing, :const_set, :constants, :define_singleton_method, :display, :dup, :enum_for, :eql?, :equal?, :eval, :exec, :exit, :exit!, :extend, :fail, :fork, :format, :freeze, :frozen?, :gets, :global_variables, :hash, :include?, :included_modules, :inspect, :instance_eval, :instance_exec, :instance_method, :instance_methods, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :is_a?, :iterator?, :kind_of?, :lambda, :load, :local_variables, :loop, :method, :method_defined?, :methods, :module_eval, :module_exec, :name, :nil?, :object_id, :open, :p, :print, :printf, :private_class_method, :private_constant, :private_instance_methods, :private_method_defined?, :private_methods, :proc, :protected_instance_methods, :protected_method_defined?, :protected_methods, :public_class_method, :public_constant, :public_instance_method, :public_instance_methods, :public_method, :public_method_defined?, :public_methods, :public_send, :putc, :puts, :raise, :rand, :readline, :readlines, :remove_class_variable, :remove_instance_variable, :require, :require_relative, :respond_to?, :select, :send, :set_trace_func, :singleton_class, :singleton_methods, :sleep, :spawn, :sprintf, :srand, :syscall, :system, :taint, :tainted?, :tap, :test, :throw, :to_enum, :to_s, :trace_var, :trap, :trust, :untaint, :untrace_var, :untrust, :untrusted?, :warn]

class MyClass
  def testing_self
    @var = 10
    my_method()
    self
  end

  def my_method # !> method redefined; discarding old my_method
    @var = @var + 1
  end

end

o = MyClass.new
o.testing_self # => #<MyClass:0x007fb67a813b88 @var=11>

class MyClass
  self # => MyClass
  def hoge
    self # => #<MyClass:0x007fb67a8131b0>
  end
end

obj = MyClass.new
obj.hoge

module Printable
  def print
    'printable'
  end
  
  def prepare_cover
    #
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    #
  end

  def Print
    'print'
  end
end

class Book
  include Printable
  include Document

  #
end

b = Book.new
b.print_to_screen # => "printable"
Book.ancestors # => [Book, Document, Printable, Object, Kernel, BasicObject]


