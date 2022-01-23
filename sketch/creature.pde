
class Creature { 

  int initialDrawX;
  int initialDrawY;
  int drawX;
  int drawY;
  int type;
  String name;
  color c;
  int selectedMovement;
  float stopMovingRate;

  Creature (int drawX, int drawY, int type, String name, color c, float stopMovingRate) {
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
    if (getGridCellX() == 0) {
      tileGrid.cleanPreviousPosition(this);
      drawX = cellToCoord(MAX_COLS) - (1 * PIXEL_SIZE);
    }
  }

  void moveRight() {
    drawX = drawX + PIXEL_SIZE;
    drawY = cuantizeCoord(drawY) + (CELL_SIZE / 2);
    if (getGridCellX() == MAX_COLS - 1) {
      tileGrid.cleanPreviousPosition(this);
      drawX = PIXEL_SIZE;
    }
  }
  
  void moveUp() {
    drawY = drawY - PIXEL_SIZE;
    drawX = cuantizeCoord(drawX) + (CELL_SIZE / 2);
  }

  void moveDown() {
    drawY = drawY + PIXEL_SIZE;
    drawX = cuantizeCoord(drawX) + (CELL_SIZE / 2);
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

  void changeStopMovingRateTo(float stopMovingRate) {
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
