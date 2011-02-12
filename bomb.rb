class Bomb
  
  def initialize(game_window)
    @game_window = game_window
    @bomb = Gosu::Image.new(@game_window, "images/bomb.png" , true)
    @boom = Gosu::Image.new(@game_window, "images/boom.png" , true)
    @y = rand(@game_window.height)
    @x = rand(@game_window.width)
  end
  def touch?(hunter)
    Gosu::distance(@x, @y, hunter.x, hunter.y) < 10
  end
  def draw
    @bomb.draw(@x,@y, 6)
  end
  def boom
    @boom.draw(@x,@y,6)
  end
  
  def update
  end
  
  def shoot
  end
  
end