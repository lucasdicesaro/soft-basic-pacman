
class Pacman extends Creature { 
  int sprite;
  Pacman (int drawX, int drawY) {
    super(drawX, drawY, PACMAN_TYPE, "Pacman", color(255, 204, 0), PACMAN_NORMAL_STOP);
    sprite = 0;
  }

  void drawYourSelf() {
    if (isValidDirection(selectedMovement)) {
      sprite++;
      if (sprite > 11) {
        sprite = 0;
      }
    }
    drawPacman(drawX, drawY, c, selectedMovement, sprite);
    //drawCreatureCenter(drawX, drawY, color(0, 204, 255));
    //drawBlackCell(drawX, drawY);
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
    if (selectedMovement == movement) {
      return;
    }
    if (isValidDirection(movement)) {
      selectedMovement = movement;
    }
  }

  boolean isValidDirection(int movement) {
    return
    (movement == LEFT && tileGrid.isNotWallOnCreatureLeft(this) ||
     movement == RIGHT && tileGrid.isNotWallOnCreatureRight(this) ||
     movement == UP && tileGrid.isNotWallOnCreatureUp(this) ||
     movement == DOWN && tileGrid.isNotWallOnCreatureDown(this)
    );
  }
} 
