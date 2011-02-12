class Runner
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/runner.png", true)
    @x = rand(game_window.width) 
    @y = rand(game_window.height)
    @speed = 10
  end
  
  def x
    @x
  end
  
  def y
    @y
  end
  
  def draw
    @icon.draw(@x,@y,1)
  end
  
  def move_left
    if @x <= 0
      @x = 0
    else
      @x = @x - @speed
    end
  end
  def touch?(hunters, wall)
    hunters.any? {|h| Gosu::distance(@x, @y, h.x, h.y) < 10} or
    wall.any? {|h| Gosu::distance(@x, @y, h.x, h.y) < 10}
  end
  def move_right
    if @x >=(@game_window.width - @icon.width)
      @x = @game_window.width - @icon.width
    else
      @x = @x + @speed
    end
  end
  
  def move_up
    if @y <= 0
      @y = 0
    else
      @y = @y - @speed
    end
  end
  
  def move_down
    if @y >= (@game_window.height-@icon.height)
      @y = @game_window.height - @icon.height
    else
      @y = @y + @speed
    end
  end
  
end
