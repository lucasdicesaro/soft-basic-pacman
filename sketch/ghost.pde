final int GHOSTS_HOUSE_EXIT_X = 14;
final int GHOSTS_HOUSE_EXIT_Y = 14;

class Ghost extends Creature {

  int targetX;
  int targetY;
  boolean insideHouse;
  boolean scheduleReverseDirection;
  color frightenedColor = color(33, 33, 222);
  Ghost (int drawX, int drawY, int type, String name, color c) {  
    super(drawX, drawY, type, name, c);
    targetX = 0;
    targetY = 0;
    insideHouse = true;
    scheduleReverseDirection = false;
  }
  
  void drawYourSelf() {
    drawCreature(drawX, drawY, !gameMode.isFrightened() ? c : frightenedColor);
    //drawBlackCell(drawX, drawY);
    //drawTarget(targetX, targetY, c);
  }
  
  void processMovement() {
    
    if (insideHouse && hasToGoOutFromHouse()) {
      goOutFromHouse();
      insideHouse = false;
    }

    checkIfShouldReverseDirection();

    // Ghost only change its move, when it is in the center of the cell.
    if (tileGrid.isCenterOfTheCell(this)) {
      selectedMovement = getCalculatedMovement(selectedMovement);
    }

    switch(selectedMovement) {
      case LEFT:
        moveLeft();
        break;
      case RIGHT:
        moveRight();
        break;
      case UP:
        moveUp();
        break;
      case DOWN:
        moveDown();
        break;
    }
  }

  int getCalculatedMovement(int selectedMovement) {

    setTarget();

    int newMovement = -1;
    int min = 99999;
    int x = coordToCell(drawX);
    int y = coordToCell(drawY);
    int distance = 0;
    if (selectedMovement != DOWN && tileGrid.isNotWallOnCreatureUp(this)) {
      distance = (int) dist(x, y-1, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = UP;
      }
    }
    if (selectedMovement != RIGHT && tileGrid.isNotWallOnCreatureLeft(this)) {
      distance = (int) dist(x-1, y, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = LEFT;
      }
    }
    if (selectedMovement != UP && tileGrid.isNotWallOnCreatureDown(this)) {
      distance = (int) dist(x, y+1, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = DOWN;
      }
    }
    if (selectedMovement != LEFT && tileGrid.isNotWallOnCreatureRight(this)) {
      distance = (int) dist(x+1, y, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = RIGHT;
      }
    }

    return newMovement;
  }

  void checkIfShouldReverseDirection() {
    if (scheduleReverseDirection) {
      reverseDirection();
      scheduleReverseDirection = false;
    }
  }

  void reverseDirection() {
    switch(selectedMovement) {
      case UP:
        selectedMovement = DOWN;
        break;
      case DOWN:
        selectedMovement = UP;
        break;
      case LEFT:
        selectedMovement = RIGHT;
        break;
      case RIGHT:
        selectedMovement = LEFT;
        break;
    }
  }

  void setTarget() {
    if (gameMode.isChase()) {
      setChaseTarget();
    } else if (gameMode.isScatter()) {
      setScatterTarget();
    } else if (gameMode.isFrightened()) {
      setFrightenedTarget();
    }
  }

  void setChaseTarget() {
  }

  void setScatterTarget() {
  }

  void setFrightenedTarget() {
    //if (delayCounter == 0) {
      targetX = int(random(MAX_COLS));
      targetY = int(random(MAX_ROWS));
    //}
  }

  boolean hasToGoOutFromHouse() {
    return false;
  }

  void goOutFromHouse() {
    drawX = convertToCoordInCellCenter(GHOSTS_HOUSE_EXIT_X);
    drawY = convertToCoordInCellCenter(GHOSTS_HOUSE_EXIT_Y);
    selectedMovement = LEFT;
  }

  void scheduleReverseDirection() {
    scheduleReverseDirection = true;
  }
} 
