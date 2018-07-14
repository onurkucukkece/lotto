# lib/lotto/draw.rb
module Lotto
  # lib/lotto/draw.rb
  class Draw
    def play(options)
      @options = options
      @options[:for].nil? ? draw : draw_multiple
    end

    def draw
      drawns = []
      @options[:include].each{ |n| drawns << n } unless @options[:include].nil?
      count = @options[:include] ? @options[:pick] - @options[:include].count : @options[:pick]
      count.times{ drawns << pick(drawns) }
      drawns
    end

    def draw_multiple
      coupons = []
      @options[:for].times { coupons << draw }
      coupons
    end

    def pick(drawns = [])
      basket.reject { |n| drawns.include? n }.sample
    end

    def basket
      numbers = (1..@options[:of])
      numbers = numbers.reject{ |n| @options[:include].include? n } unless @options[:include].nil?
      numbers = numbers.reject{ |n| @options[:exclude].include? n } unless @options[:exclude].nil?
      numbers
    end
  end
end
