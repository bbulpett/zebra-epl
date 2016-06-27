module Zebra
  module Epl
    module Justification
      class JustificationError < StandardError; end

        LEFT        = "L"
        CENTER      = "C"
        RIGHT       = "R"
        JUSTIFIED   = "J"

      def self.valid_justification?(justification)
        ['L', 'C', 'R', 'J'].include?(justification)
      end

      def self.validate_justification(justification)
        raise InvalidJustificationError unless validate_justification?(justification)
      end
    end

  end
end
