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
      case UP:
        moveUp();
        break;
      case DOWN:
        moveDown();
        break;
      case LEFT:
        moveLeft();
        break;
      case RIGHT:
        moveRight();
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
    (keyCode == LEFT ||
     keyCode == RIGHT ||
     keyCode == UP ||
     keyCode == DOWN
    );
  }

  boolean isValidMovementKey() {
     return key == CODED && (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN);
  }
} 
