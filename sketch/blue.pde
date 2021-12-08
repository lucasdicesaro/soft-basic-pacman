final int BLUE_GHOST_TYPE = 5;
final int BLUE_GHOST_SCATTER_X = 27;
final int BLUE_GHOST_SCATTER_Y = 34;

class Blue extends Ghost {
  Blue (int x, int y) {  
    super(x, y, BLUE_GHOST_TYPE, "Inky", color(0, 255, 255)); 
  }

  void setChaseTarget() {
    int pacmanX = coordToCell(pacman.getDrawX());
    int pacmanY = coordToCell(pacman.getDrawY());
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

    // Double of distance between Blinky and projected pacman (pacman + 2).
    int redX = coordToCell(red.getDrawX());
    int distX = abs(pacmanX - redX) * 2;
    if (pacmanX < redX) {
      // Pacman is on the LEFT of Blinky
      targetX = redX - distX;
    } else if (pacmanX > redX) {
      // Pacman is on the RIGHT of Blinky
      targetX = redX + distX;
    }

    int redY = coordToCell(red.getDrawY());
    int distY = abs(pacmanY - redY) * 2;
    if (pacmanY < redY) {
      // Pacman is on top (UP) of Blinky
      targetY = redY - distY;
    } else if (pacmanY > redY) {
      // Pacman is under (DOWN) Blinky
      targetY = redY + distY;
    }
  }

  void setScatterTarget() {
    targetX = BLUE_GHOST_SCATTER_X;
    targetY = BLUE_GHOST_SCATTER_Y;
  }

  boolean hasToGoOutFromHouse() {
    //return globalGame.getPelletCounter() > 30;
    return true;
  }
}
