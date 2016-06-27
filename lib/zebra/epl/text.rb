require "zebra/epl/printable"

module Zebra
  module Epl
    class Text
      include Printable

      attr_reader   :font_size

      def font_size=(f)
        FontSize.validate_font_size f
        @font_size = f
      end

      def print_mode=(mode)
        PrintMode.validate_mode mode
        @print_mode = mode
      end

      def print_mode
        @print_mode || PrintMode::NORMAL
      end

      def h_multiplier=(multiplier)
        HorizontalMultiplier.validate_multiplier multiplier
        @h_multiplier = multiplier
      end

      def h_multiplier
        @h_multiplier || HorizontalMultiplier::VALUE_1
      end

      def v_multiplier=(multiplier)
        VerticalMultiplier.validate_multiplier multiplier
        @v_multiplier = multiplier
      end

      def v_multiplier
        @v_multiplier || VerticalMultiplier::VALUE_1
      end

      def to_epl
        check_attributes
        ["A#{x}", y, rotation, font_size, h_multiplier, v_multiplier, print_mode, "\"#{data}\""].join(",")
      end

      private

      def check_attributes
        super
        raise MissingAttributeError.new("the font_size to be used is not given") unless @font_size
      end
    end
  end
end
