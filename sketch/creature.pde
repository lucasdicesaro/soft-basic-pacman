
class Creature { 

  int initialDrawX;
  int initialDrawY;
  int drawX;
  int drawY;
  int type;
  String name;
  color c;
  int selectedMovement;
  int creatureRadiusCells;

  Creature (int drawX, int drawY, int type, String name, color c) {  
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
    creatureRadiusCells = coordToCell(CREATURE_SIZE/2)+1;
    selectedMovement = LEFT;
  }

  void reset() {
    drawX = initialDrawX;
    drawY = initialDrawY;
    selectedMovement = LEFT;
  }

  void moveLeft() {
    drawX = drawX - X_VELOCITY;
    drawY = cuantizeCoord(drawY) + (CELL_SIZE / 2); // Forces Pacman to stay in the middle of the corridor
  }

  void moveRight() {
    drawX = drawX + X_VELOCITY;
    drawY = cuantizeCoord(drawY) + (CELL_SIZE / 2);
  }
  
  void moveUp() {
    drawY = drawY - Y_VELOCITY;
    drawX = cuantizeCoord(drawX) + (CELL_SIZE / 2);
  }

  void moveDown() {
    drawY = drawY + Y_VELOCITY;
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
  
  int getCreatureRadiusCells() {
    return creatureRadiusCells;
  }

  String getName() {
    return name;
  }

  void processMovement() {
  }

  void drawYourSelf() {
  }

  void debug() {
    //println(name + " CREATURE_SCALE: " + CREATURE_SCALE + " CREATURE_SIZE: " + CREATURE_SIZE + " creatureRadiusCells: " + creatureRadiusCells);
    println(name + "\tdraw X,Y: " + drawX + "," + drawY + "\tgrid pos X,Y: " + coordToCell(drawX) + "," + coordToCell(drawY) + "\tselectedMovement: " + selectedMovement + "\tisCenterOfTheCell: " + tileGrid.isCenterOfTheCell(this));
  }
} 
