final int ORANGE_GHOST_TYPE = 6;
final int ORANGE_GHOST_SCATTER_GRID_X = 0;
final int ORANGE_GHOST_SCATTER_GRID_Y = 34;

class Orange extends Ghost {
  Orange (int x, int y) {  
    super(x, y, ORANGE_GHOST_TYPE, "Clyde", color(255, 184, 82)); 
  }

  void setChaseTarget() {
    int pacmanX = coordToCell(pacman.getDrawX());
    int pacmanY = coordToCell(pacman.getDrawY());    
    int thisX = coordToCell(this.getDrawX());
    int thisY = coordToCell(this.getDrawY());
    int distanceBetweenOrangeAndPacman = (int) dist(thisX, thisY, pacmanX, pacmanY);

    if (distanceBetweenOrangeAndPacman > 8) {
      targetX = pacmanX;
      targetY = pacmanY;
    } else {
      // Orange scatter target
      targetX = ORANGE_GHOST_SCATTER_GRID_X;
      targetY = ORANGE_GHOST_SCATTER_GRID_Y;
    }
  }

  void setScatterTarget() {
    targetX = ORANGE_GHOST_SCATTER_GRID_X;
    targetY = ORANGE_GHOST_SCATTER_GRID_Y;
  }

  boolean hasToGoOutFromHouse() {
    //return globalGame.getPelletCounter() > 60;
    return true;
  }
}