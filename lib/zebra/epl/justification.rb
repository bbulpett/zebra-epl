module Zebra
  module Epl
    module Justification
      class InvalidJustificationError < StandardError; end

        LEFT = "L"
        CENTER = "C"
        RIGHT = "R"
        JUSTIFIED = "J"

      def self.valid_justification?(justification)
        [LEFT, CENTER, RIGHT, JUSTIFIED].include? justification
      end

      def self.validate_justification(justification)
        raise InvalidJustificationError unless valid_justification?(justification)
      end
    end
  end
end
