require 'rubygems'
require 'gosu'
require 'hunter'
require 'runner'
require 'Bomb'

class MyGame < Gosu::Window
  def initialize
    super(1000, 1000, false)
    @runner = Runner.new(self)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 90)
    @hunters = 1.times.map {Hunter.new(self, @runner)}
    @bombs = [Bomb.new(self)]
    @running = true
    @start_time = Time.now
    @boom = false
    @wall = create_wall
  end
  
  def update
    if @running
      
      
      
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
    
      if button_down? Gosu::Button::KbSpace
        @hunters.each {|h| h.set_x_y}
      end
    
      @hunters.each {|hunter| hunter.chase}
      @wall.each {|hunter| hunter.cross_screen}
    end
    if Time.now < @start_time +3
    else
       1.times do
          @hunters << Hunter.new(self, @runner)
          @bombs << Bomb.new(self)
        end
      @start_time = Time.now
      @hunters.each {|h| h.change_speed}
    end
    @bombs.each do |bomb|
      @hunters.each do |hunter|
       if bomb.touch?(hunter)  
         @boom = true
       end
     end
    end
    if @runner.touch?(@hunters, @wall)  
      stop_game!
    end
  end
  def stop_game!
    @running = false
  end

  def draw
    if @boom
      @bombs.each {|b| b.boom}
      @boom = false
    end
    if @running==false
      @font.draw("Game Over ",30,30,5)
    end
    @bombs.each {|b| b.draw}
    @runner.draw
    @hunters.each {|hunter| hunter.draw}
    @wall.each {|hunter| hunter.draw}
  end
  
  def create_wall
    number_of_hunters = 25
    distance_between_hunters = (self.height/number_of_hunters).to_i
    (1..number_of_hunters).map {|count| Hunter.new(self, @runner, 0, distance_between_hunters * count)}
  end
  
end

game = MyGame.new
game.show
  