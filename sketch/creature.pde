
class Creature { 

  int initialDrawX;
  int initialDrawY;
  int drawX;
  int drawY;
  int type;
  String name;
  color c;
  int selectedMovement;
  int stopMovingRate;

  Creature (int drawX, int drawY, int type, String name, color c, int stopMovingRate) {
    //window(672, 864);
    //grid(28, 35)
    // 672 / 28 = 24
    // 864 / 35 = 24
    this.initialDrawX = drawX;
    this.initialDrawY = drawY;
    this.drawX = drawX;
    this.drawY = drawY;
    this.type = type;
    this.name = name;
    this.c = c;
    this.selectedMovement = LEFT;
    this.stopMovingRate = stopMovingRate;
  }

  void respawn() {
    drawX = initialDrawX;
    drawY = initialDrawY;
    selectedMovement = LEFT;
  }

  void moveLeft() {
    drawX = drawX - PIXEL_SIZE;
    drawY = cuantizeCoord(drawY) + (CELL_SIZE / 2); // Forces Pacman to stay in the middle of the corridor
    if (getGridCellX() == MAZE_INIT_X) {
      // Tp from left to right
      tileGrid.cleanPreviousPosition(this);
      drawX = cellToCoord(MAZE_END_X) + SEVEN_PIXELS;
    }
  }

  void moveRight() {
    drawX = drawX + PIXEL_SIZE;
    drawY = cuantizeCoord(drawY) + (CELL_SIZE / 2);
    if (getGridCellX() == MAZE_END_X) {
      // Tp from right to left
      tileGrid.cleanPreviousPosition(this);
      drawX = cellToCoord(MAZE_INIT_X);
    }
  }
  
  void moveUp() {
    drawY = drawY - PIXEL_SIZE;
    drawX = cuantizeCoord(drawX) + (CELL_SIZE / 2);
    if (getGridCellY() == MAZE_INIT_Y - 1) {
      // Tp from top to bottom
      tileGrid.cleanPreviousPosition(this);
      drawY = cellToCoord(MAZE_END_Y) + SEVEN_PIXELS;
    }
  }

  void moveDown() {
    drawY = drawY + PIXEL_SIZE;
    drawX = cuantizeCoord(drawX) + (CELL_SIZE / 2);
    if (getGridCellY() == MAZE_END_Y + 1) {
      // Tp from bottom to top
      tileGrid.cleanPreviousPosition(this);
      drawY = cellToCoord(MAZE_INIT_Y);
    }
  }

  int getDrawX() {
    return drawX;
  }

  int getDrawY() {
    return drawY;
  }

  int getGridCellX() {
    return coordToCell(drawX);
  }

  int getGridCellY() {
    return coordToCell(drawY);
  }

  int getType() {
    return type;
  }

  int getSelectedMovement() {
    return selectedMovement;
  }

  String getName() {
    return name;
  }

  void changeStopMovingRateTo(int stopMovingRate) {
    this.stopMovingRate = stopMovingRate;
  }

  boolean shouldMoveMySelf() {
    return shouldMove(stopMovingRate);
  }

  void processMovement() {
  }

  void drawYourSelf() {
  }

  void debug() {
    //println(name + " CREATURE_SCALE: " + CREATURE_SCALE + " CREATURE_SIZE: " + CREATURE_SIZE + " creatureRadiusCells: " + creatureRadiusCells);
    println(name + "\tdraw X,Y: " + drawX + "," + drawY + "\tgrid pos X,Y: " + coordToCell(drawX) + "," + coordToCell(drawY) + "\tstopMovingRate: " + stopMovingRate + "\tselectedMovement: " + selectedMovement + "\tisCenterOfTheCell: " + tileGrid.isCenterOfTheCell(this));
  }
} 
