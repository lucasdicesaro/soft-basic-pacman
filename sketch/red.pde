final int RED_GHOST_TYPE = 3;
final int RED_SCATTER_GRID_X = 25;
final int RED_SCATTER_GRID_Y = 0;

class Red extends Ghost {
  Red (int drawX, int drawY) {  
    super(drawX, drawY, RED_GHOST_TYPE, "Blinky", color(255, 0, 0)); 
    insideHouse = false;
  }

  void calculateChaseTarget() {
    targetX = coordToCell(pacman.getDrawX());
    targetY = coordToCell(pacman.getDrawY());
  }

  void calculateScatterTarget() {
    targetX = RED_SCATTER_GRID_X;
    targetY = RED_SCATTER_GRID_Y;
  }
}
