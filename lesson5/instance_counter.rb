module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    @instances = 0
  end

  module ClassMethods
    attr_reader :instances
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances += 1
    end
  end
end