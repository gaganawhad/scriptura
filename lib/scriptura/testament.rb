module Scriptura
  class Testament
    DATA = %w(Old New)

    attr_reader :name

    def initialize(name)
      fail ArgumentError unless DATA.include?(name)
      @name = name.capitalize
    end

    def string_id
      name.downcase
    end
  end
end
