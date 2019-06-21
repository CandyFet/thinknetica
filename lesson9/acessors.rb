module AccessorsCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
end

module ClassMethods
def attr_accessor_with_history(name)
  @variables_hash ||= {}
  var_name = "@#{name}".to_sym
  define_method(name) {instance_variable_get(var_name)}
  define_method("#{name}".to_sym) { |value| instance_variable_set(var_name, value) }
end

def strong_attr_accessor(name, class_type)

end
end

module InstanceMethods
  protected
  def register_variables(name, value)
    self.class.variables_hash.merge!(name: value)
  end
end
