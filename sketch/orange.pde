final int ORANGE_GHOST_SCATTER_GRID_X = 0;
final int ORANGE_GHOST_SCATTER_GRID_Y = 34;

class Orange extends Ghost {
  Orange (int x, int y) {  
    super(x, y, ORANGE_GHOST_TYPE, "Clyde", color(255, 184, 82)); 
  }

  void setChaseTarget() {
    int pacmanX = pacman.getGridCellX();
    int pacmanY = pacman.getGridCellY();
    int thisX = this.getGridCellX();
    int thisY = this.getGridCellY();
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
    return pelletCounter > 60;
  }
}
