final int PACMAN_TYPE = 2;

class Pacman extends Creature { 

  Pacman (int drawX, int drawY) {
    super(drawX, drawY, PACMAN_TYPE, "Pacman", color(255, 204, 0));
  }
  
  void drawYourSelf() {
    drawCreature(drawX, drawY, c);
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

    if (tileGrid.isPellet(this) || tileGrid.isPowerPellet(this)) {
      pelletCounter++;
      if (tileGrid.isPowerPellet(this)) {
        for(Ghost ghost : ghosts) {
          ghost.changeModeTo(FRIGHTENED);
        }
      }
      tileGrid.setCorridor(this); // Remove pellet from maze
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
