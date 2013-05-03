require "domain_mapper/version"

module DomainMapper
  class Map
    def initialize(object_class, &block)
      @object_class = object_class
      @rules = []
      instance_eval &block
    end

    def attribute(attribute_name, hash_key)
      @rules << [attribute_name, hash_key]
    end

    def build_object(data_hash)
      object = @object_class.new
      @rules.each do |attribute_name, hash_key|
        instance_variable_name = instance_variable_symbol(attribute_name)
        value = data_hash[hash_key]
        object.instance_variable_set(instance_variable_name, value)
      end
      object
    end

    def serialize(object)
      fields = []
      @rules.each do |attribute_name, hash_key|
        instance_variable_name = instance_variable_symbol(attribute_name)
        value = object.instance_variable_get(instance_variable_name)
        fields << [hash_key, value]
      end
      Hash[fields]
    end

    def instance_variable_symbol(name)
      "@#{name}".to_sym
    end
  end
end
