final int BLUE_GHOST_TYPE = 5;
final int BLUE_GHOST_SCATTER_X = 27;
final int BLUE_GHOST_SCATTER_Y = 34;

class Blue extends Ghost {
  Blue (int x, int y) {  
    super(x, y, BLUE_GHOST_TYPE, "Inky", color(0, 255, 255)); 
  }

  void setChaseTarget() {
    int pacmanX = pacman.getGridCellX();
    int pacmanY = pacman.getGridCellY();
    switch(pacman.getSelectedMovement()){
      case UP:
        pacmanY = pacmanY - 2;
        pacmanX = pacmanX - 2; // Intentional bug
      break;
      case LEFT:
        pacmanX = pacmanX - 2;
        break;
      case DOWN:
        pacmanY = pacmanY + 2;
        break;
      case RIGHT:
        pacmanX = pacmanX + 2;
        break;
    }

    // Double of distance between Blinky and projected pacman (pacman + 2)
    targetX = calculateTarget(red.getGridCellX(), pacmanX);
    targetY = calculateTarget(red.getGridCellY(), pacmanY);
  }

  void setScatterTarget() {
    targetX = BLUE_GHOST_SCATTER_X;
    targetY = BLUE_GHOST_SCATTER_Y;
  }

  boolean hasToGoOutFromHouse() {
    return pelletCounter > 30;
  }

  int calculateTarget(int ghostCell, int pacmanCell) {
    int target = 0;
    int dist = abs(pacmanCell - ghostCell) * 2;
    if (pacmanCell < ghostCell) {
      // Pacman is on top/UP or LEFT of Red
      target = ghostCell - dist;
    } else if (pacmanCell > ghostCell) {
      // Pacman is under/DOWN or RIGHT of Red
      target = ghostCell + dist;
    }
    return target;
  }
}
