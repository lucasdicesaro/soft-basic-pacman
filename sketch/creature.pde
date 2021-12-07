final float CREATURE_SCALE = 1.7;
final int CREATURE_SIZE = (int) (SCALE * CREATURE_SCALE);
final int CREATURE_CENTER_SIZE = 4;

class Creature { 

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
    this.drawX = drawX;
    this.drawY = drawY;
    this.type = type;
    this.name = name;
    this.c = c;
    creatureRadiusCells = coordToCell(CREATURE_SIZE/2)+1;
  } 

  void moveLeft() {
    drawX = drawX - X_VELOCITY;
  } 

  void moveRight() {
    drawX = drawX + X_VELOCITY;
  } 
  
  void moveUp() {
    drawY = drawY - Y_VELOCITY;
  } 

  void moveDown() {
    drawY = drawY + Y_VELOCITY;
  }

  int getDrawX() {
    return drawX;
  }

  int getDrawY() {
    return drawY;
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

  void processMovement() {
  }

  void drawYourSelf() {
  }

  void debug() {
    println(name + " draw X,Y: " + drawX + "," + drawY + " grid pos X,Y: " + coordToCell(drawX) + "," + coordToCell(drawY) + " CREATURE_SCALE: " + CREATURE_SCALE + " CREATURE_SIZE: " + CREATURE_SIZE + " creatureRadiusCells: " + creatureRadiusCells);
  }
} 
