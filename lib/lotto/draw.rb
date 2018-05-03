module Lotto
  class Draw
    def play(options)
      @options = options
      @options[:for].nil? ? draw : draw_multiple
    end

    def draw
      drawns = []
      @options[:pick].times{ drawns << pick(drawns) }
      drawns
    end

    def draw_multiple
      coupons = []
      @options[:for].times{ coupons << draw }
      coupons
    end

    def pick(drawns = [])
      basket.reject { |n| drawns.include? n }.sample
    end

    def basket
      (1..@options[:of])
    end
  end
end