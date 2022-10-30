final int RED_GHOST_SCATTER_GRID_X = 25;
final int RED_GHOST_SCATTER_GRID_Y = 0;

class Red extends Ghost {
  Red (int drawX, int drawY) {  
    super(drawX, drawY, RED_GHOST_TYPE, "Blinky", color(255, 0, 0)); 
  }

  void setChaseTarget() {
    targetX = pacman.getGridCellX();
    targetY = pacman.getGridCellY();
  }

  void setScatterTarget() {
    targetX = RED_GHOST_SCATTER_GRID_X;
    targetY = RED_GHOST_SCATTER_GRID_Y;
  }

  void respawn() {
    super.respawn();
    insideHouse = false;
  }
}
