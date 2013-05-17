class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

my_obj = Greeting.new("Helloe") # => #<Greeting:0x10331ffe8 @text="Helloe">
my_obj.class # => Greeting
my_obj.class.instance_methods(false) # => ["welcome"]
my_obj.class.methods # => ["private_class_method", "inspect", "name", "tap", "clone", "public_methods", "__send__", "method_defined?", "instance_variable_defined?", "autoload", "equal?", "freeze", "extend", "send", "const_defined?", "methods", "ancestors", "module_eval", "hash", "dup", "object_id", "instance_methods", "public_method_defined?", "instance_variables", "class_variable_defined?", "eql?", "constants", "instance_eval", "id", "module_exec", "instance_method", "singleton_methods", "const_missing", "taint", "autoload?", "instance_variable_get", "frozen?", "to_enum", "private_method_defined?", "public_instance_methods", "display", "instance_of?", "superclass", "to_a", "included_modules", "const_get", "instance_exec", "type", "<", "protected_methods", "<=>", "class_eval", "==", "class_variables", ">", "===", "instance_variable_set", "enum_for", "protected_instance_methods", "protected_method_defined?", "respond_to?", "kind_of?", ">=", "method", "public_class_method", "to_s", "<=", "const_set", "allocate", "class", "new", "private_methods", "=~", "tainted?", "__id__", "class_exec", "untaint", "nil?", "private_instance_methods", "include?", "is_a?"]
=begin
C-c C-b	ブロックを評価
C-c C-x	メソッド定義ブロックを評価
C-c C-r	リージョンを評価
C-c C-z	インタプリタのウィンドウに移動
C-c C-l	ファイルをロードする

あと、評価用のキーバインドは 2ストローク目のControlを Meta に変えれば評価後、そのままインタプリタ用のウィンドウに移動できる。(例：C-c M-b => ブロックを評価してインタプリタウィンドウに移動)
=end
