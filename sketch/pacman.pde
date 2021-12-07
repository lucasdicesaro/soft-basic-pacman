final int PACMAN_TYPE = 2;

class Pacman extends Creature { 

  Pacman (int drawX, int drawY) {
    super(drawX, drawY, PACMAN_TYPE, "Pacman", color(255, 204, 0));
    selectedMovement = LEFT;
  }
  
  void drawYourSelf() {
    drawCreature(drawX, drawY, c);
    
    drawCreatureCenter(drawX, drawY);
    
    drawBlackCell(drawX, drawY);
  }
  
  void processMovement() {
    switch(selectedMovement) {
      case LEFT:
        if (tileGrid.isNotWallOnCreatureLeft(this)) {
          moveLeft();
        }
        break;
      case RIGHT:
        if (tileGrid.isNotWallOnCreatureRight(this)) {
          moveRight();
        }
        break;
      case UP:
        if (tileGrid.isNotWallOnCreatureUp(this)) {
          moveUp();
        }
        break;
      case DOWN:
        if (tileGrid.isNotWallOnCreatureDown(this)) {
          moveDown();
        }
        break;
    }
  }

  void setSelectedMovement(int movement) {
    if (isValidMovement()) {
      selectedMovement = movement;
    }
  }

  boolean isValidMovement() {
    return isValidMovementKey() &&
    (keyCode == LEFT && tileGrid.isNotWallOnCreatureLeft(this) ||
     keyCode == RIGHT && tileGrid.isNotWallOnCreatureRight(this) ||
     keyCode == UP && tileGrid.isNotWallOnCreatureUp(this) ||
     keyCode == DOWN && tileGrid.isNotWallOnCreatureDown(this)
    );
  }

  boolean isValidMovementKey() {
     return key == CODED && (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN);
  }
} 
