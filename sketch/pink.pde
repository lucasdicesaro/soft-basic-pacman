final int PINK_GHOST_TYPE = 4;
final int PINK_GHOST_SCATTER_GRID_X = 2;
final int PINK_GHOST_SCATTER_GRID_Y = 0;

class Pink extends Ghost {
  Pink (int x, int y) {  
    super(x, y, PINK_GHOST_TYPE, "Pinky", color(255, 184, 255)); 
  }

  void setChaseTarget() {
    int pacmanX = pacman.getGridCellX();
    int pacmanY = pacman.getGridCellY();
    targetX = pacmanX;
    targetY = pacmanY;
    switch(pacman.getSelectedMovement()){
      case UP:
        targetY = pacmanY - 4;
        targetX = pacmanX - 4; // Intentional bug
      break;
      case LEFT:
        targetX = pacmanX - 4;
        break;
      case DOWN:
        targetY = pacmanY;
        break;
      case RIGHT:
        targetX = pacmanY;
        break;
    }
  }

  void setScatterTarget() {
    targetX = PINK_GHOST_SCATTER_GRID_X;
    targetY = PINK_GHOST_SCATTER_GRID_Y;
  }

  boolean hasToGoOutFromHouse() {
    return true;
  }
} 
