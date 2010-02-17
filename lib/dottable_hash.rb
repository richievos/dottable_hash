module DottableHash
  def dottable!
    DottableHash::InstanceMethods.extend_nodes(self)
  end

  module InstanceMethods
    class << self
      def extend_nodes(node)
        return unless node.is_a?(Hash)
        node.extend(DottableHash::InstanceMethods)
        node.each do |k,v| extend_nodes(v) end
      end
    end
    
    def method_missing(*args)
      keys.map(&:to_s).include?(args.first.to_s) ? (self[args.first.to_s] || self[args.first.to_sym]) : super
    end
  end
end
Hash.send(:include, DottableHash)
