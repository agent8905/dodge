require 'rubygems'
require 'gosu'
require 'hunter'
require 'runner'

class MyGame < Gosu::Window
  def initialize
    super(1000, 1000, false)
    @runner = Runner.new(self)
    @hunters = 5.times.map {Hunter.new(self, @runner)}
  end
  
  def update
    if button_down? Gosu::Button::KbLeft
      @runner.move_left
    end
  
    if button_down? Gosu::Button::KbRight
      @runner.move_right
    end
  
    if button_down? Gosu::Button::KbUp
      @runner.move_up
    end
  
    if button_down? Gosu::Button::KbDown
      @runner.move_down
    end
    
    @hunters.each {|hunter| hunter.chase}
  end
  
  def draw
    @runner.draw
    @hunters.each {|hunter| hunter.draw}
  end
  
end

game = MyGame.new
game.show
  