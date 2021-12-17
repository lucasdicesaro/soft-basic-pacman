final int GHOSTS_HOUSE_EXIT_X = 14;
final int GHOSTS_HOUSE_EXIT_Y = 14;

final int CHASE = 0;
final int SCATTER = 1;
final int FRIGHTENED = 2;

class Ghost extends Creature {

  int targetX;
  int targetY;
  int previousTargetX;
  int previousTargetY;
  boolean insideHouse;
  boolean scheduleReverseDirection;
  boolean eaten;
  int currentMode;
  int previousMode;

  Ghost (int drawX, int drawY, int type, String name, color c) {  
    super(drawX, drawY, type, name, c, PIXEL_SIZE * 75 / 100);
    targetX = 0;
    targetY = 0;
    previousTargetX = targetX;
    previousTargetY = targetY;
    insideHouse = true;
    scheduleReverseDirection = false;
    currentMode = CHASE;
    previousMode = CHASE;
    eaten = false;
  }
  
  void drawYourSelf() {
    if (eaten) {
      drawEyes(drawX, drawY, selectedMovement);
    } else if (!isFrightened()) {
      drawGhost(drawX, drawY, c);
      drawEyes(drawX, drawY, selectedMovement);
    } else {
      drawFrightenedGhost(drawX, drawY);
    }
    //drawBlackCell(drawX, drawY);
  }
  
  void processMovement() {
    
    if (insideHouse && hasToGoOutFromHouse()) {
      goOutFromHouse();
      insideHouse = false;
    }

    checkIfShouldReverseDirection();

    if (eaten && hasArrivedToDoor()) {
      respawn();
    }

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
    float min = 99999;
    int x = getGridCellX();
    int y = getGridCellY();
    float distance = 0;
    if (selectedMovement != DOWN && tileGrid.isNotWallOnCreatureUp(this)) {
      distance = dist(x, y-1, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = UP;
      }
    }
    if (selectedMovement != RIGHT && tileGrid.isNotWallOnCreatureLeft(this)) {
      distance = dist(x-1, y, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = LEFT;
      }
    }
    if (selectedMovement != UP && tileGrid.isNotWallOnCreatureDown(this)) {
      distance = dist(x, y+1, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = DOWN;
      }
    }
    if (selectedMovement != LEFT && tileGrid.isNotWallOnCreatureRight(this)) {
      distance = dist(x+1, y, targetX, targetY);
      if (min > distance) {
        min = distance;
        newMovement = RIGHT;
      }
    }

    return newMovement;
  }

  void changeModeTo(int newMode) {
    previousMode = currentMode;
    currentMode = newMode;
    scheduleReverseDirection();
  }

  boolean isChase() {
    return CHASE == currentMode;
  }

  boolean isScatter() {
    return SCATTER == currentMode;
  }

  boolean isFrightened() {
    return FRIGHTENED == currentMode;
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
    previousTargetX = targetX;
    previousTargetY = targetY;
    switch(currentMode) {
      case CHASE:
        setChaseTarget();
        break;
      case SCATTER:
        setScatterTarget();
        break;
      case FRIGHTENED:
        if (eaten) {
          setEatenTarget();
        } else {
          setFrightenedTarget();
        }
        break;
    }
  }

  void setChaseTarget() {
  }

  void setScatterTarget() {
  }

  void setFrightenedTarget() {
    if (isThereMoreThanOnePath()) {
      targetX = int(random(MAX_COLS));
      targetY = int(random(MAX_ROWS));
    }
  }

  boolean isThereMoreThanOnePath() {
    int paths = 0;
    if (selectedMovement != DOWN && tileGrid.isNotWallOnCreatureUp(this)) {
      paths++;
    }
    if (selectedMovement != RIGHT && tileGrid.isNotWallOnCreatureLeft(this)) {
      paths++;
    }
    if (selectedMovement != UP && tileGrid.isNotWallOnCreatureDown(this)) {
      paths++;
    }
    if (selectedMovement != LEFT && tileGrid.isNotWallOnCreatureRight(this)) {
      paths++;
    }
    return paths > 1;
  }

  void respawn() {
    eaten = false;
    changeModeTo(CHASE);
  }

  void setEatenTarget() {
    targetX = GHOSTS_HOUSE_EXIT_X;
    targetY = GHOSTS_HOUSE_EXIT_Y;
  }

  boolean hasArrivedToDoor() {
    return getGridCellX() == GHOSTS_HOUSE_EXIT_X && getGridCellY() == GHOSTS_HOUSE_EXIT_Y;
  }

  boolean hasToGoOutFromHouse() {
    return false;
  }

  void goOutFromHouse() {
    drawX = convertToCoordInCellCenter(GHOSTS_HOUSE_EXIT_X);
    drawY = convertToCoordInCellCenter(GHOSTS_HOUSE_EXIT_Y);
    selectedMovement = LEFT;
    tileGrid.cleanSection(10, 17, 15, 19); // Ghosts house.
  }

  void scheduleReverseDirection() {
    scheduleReverseDirection = true;
  }

  void setEaten(boolean eaten) {
    this.eaten = eaten;
  }

  void reset() {
    super.reset();
    currentMode = CHASE;
  }

  void showTarget() {
    tileGrid.cleanCell(previousTargetX, previousTargetY);
    drawTarget(targetX, targetY, c);
  }
} 
