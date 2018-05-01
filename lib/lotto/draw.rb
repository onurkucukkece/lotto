module Lotto
  # lib/lotto/draw.rb
  class Draw
    def play(options)
      @options = options
      @options[:for].nil? ? draw : draw_multiple
    end

    def pick(drawns = [])
      return rand(1..@options[:of]) if drawns.length.zero?
      (1..@options[:of]).reject { |n| drawns.include? n }.sample
    end

    def draw
      drawns = []
      @options[:pick].times { drawns << pick(drawns) }
      drawns
    end

    def draw_multiple
      coupons = []
      @options[:for].times { coupons << draw }
      coupons
    end
  end
end
