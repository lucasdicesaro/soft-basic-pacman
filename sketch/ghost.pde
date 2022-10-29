
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
  boolean inTunnel;
  java.util.List<UnitVector> route = new ArrayList<>();
  StopWatchTimer changeModeTimer = new StopWatchTimer();

  Ghost (int drawX, int drawY, int type, String name, color c) {  
    super(drawX, drawY, type, name, c, GHOST_NORMAL_STOP);
    respawn();
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
    super.drawYourSelf();// For debug purposes
  }
  
  void processMovement() {

    if (insideHouse && hasToGoOutFromHouse()) {
      goOutFromHouse();
      insideHouse = false;
    }

    if (eaten && hasArrivedToDoor()) {
      respawn();
    }

    checkIfShouldChangeMode();

    checkIfShouldReverseDirection();

    // Ghost only change its move, when it is in the center of the cell.
    if (tileGrid.isCenterOfTheCell(this)) {
      if (tileGrid.isTunnelBounds(this)) {
        inTunnel = !inTunnel;
      }
      setTarget();

      // Not used for the ghost "IA"
      if (showRoute && !insideHouse && tileGrid.isCenterOfTheCell(this)) {
        cleanPreviousRoute();
        route = new ArrayList<>();
        calculateRoute(name, selectedMovement, getGridCellX(), getGridCellY(), targetX, targetY, currentMode, 60, route); // 60 max iteration allowed (for unreachable targets)
      }

      // Used for the ghost "IA"
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

  void cleanPreviousRoute() {
    for (UnitVector cell : route) {
      tileGrid.cleanCell(cell.x, cell.y);
    }
  }

  int getCalculatedMovement(int selectedMovement) {

    int newMovement = -1;
    float min = 99999;
    int x = getGridCellX();
    int y = getGridCellY();
    float distance = 0;
    if (selectedMovement != DOWN && tileGrid.isNotWallOnCreatureUp(this) && isFrightenedOrIsNotUpRestricted()) {
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

  void calculateRoute(String ghostName, int currentMovement, int currentX, int currentY, int targetX, int targetY, int currentMode, int iteration, java.util.List<UnitVector> route) {

    if (iteration == 0 || currentX < 0 || currentY < 0 || currentX >= MAX_COLS || currentY >= MAX_ROWS || (currentX == targetX && currentY == targetY)) {
      return;
    }
    else {
      iteration--;
      int newMovement = -1;
      int newCurrentX = currentX;
      int newCurrentY = currentY;
      float min = 99999;
      float distance = 0;
      if (currentMovement != DOWN && tileGrid.isNotWallOnCreatureUp(currentX, currentY) && !tileGrid.isUpRestricted(currentX, currentY)) {
        distance = dist(currentX, currentY-1, targetX, targetY);
        if (min > distance) {
          min = distance;
          newMovement = UP;
          newCurrentY = currentY-1;
        }
      }
      if (currentMovement != RIGHT && tileGrid.isNotWallOnCreatureLeft(currentX, currentY)) {
        distance = dist(currentX-1, currentY, targetX, targetY);
        if (min > distance) {
          min = distance;
          newMovement = LEFT;
          newCurrentX = currentX-1;
        }
      }
      if (currentMovement != UP && tileGrid.isNotWallOnCreatureDown(currentX, currentY)) {
        distance = dist(currentX, currentY+1, targetX, targetY);
        if (min > distance) {
          min = distance;
          newMovement = DOWN;
          newCurrentY = currentY+1;
        }
      }
      if (currentMovement != LEFT && tileGrid.isNotWallOnCreatureRight(currentX, currentY)) {
        distance = dist(currentX+1, currentY, targetX, targetY);
        if (min > distance) {
          min = distance;
          newMovement = RIGHT;
          newCurrentX = currentX+1;
        }
      }

      route.add(new UnitVector(currentX, currentY, currentMovement));
      // TODO Add corner shapes for the route calculation
      if (newMovement == LEFT || newMovement == RIGHT) {
         drawHorizontalLine(currentX, currentY, c);
      } else {
         drawVerticalLine(currentX, currentY, c);
      }

      //println("currentX: " + nf(currentX, 2) + " currentY: " + nf(currentY, 2) + " targetX: " + nf(targetX, 2) + " targetY: " + nf(targetY, 2) + " ghostName: " + ghostName);
      calculateRoute(ghostName, newMovement, newCurrentX, newCurrentY, targetX, targetY, currentMode, iteration, route);
    }
  }

  void changeModeTo(int newMode) {
    if (newMode != currentMode) {
      previousMode = currentMode;
      currentMode = newMode;
      scheduleReverseDirection();
    }
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

  boolean isFrightenedOrIsNotUpRestricted() {
    return isFrightened() || !tileGrid.isUpRestricted(this);
  }

  void checkIfShouldChangeMode() {
    if (!isFrightened()) {
      if (changeModeTimer.second() >= getCurrentLevelVariables().scatterModeDuration1 &&
          changeModeTimer.second() < getCurrentLevelVariables().chaseModeDuration1) {// 20 seconds
        changeModeTo(CHASE);
      }
      if (changeModeTimer.second() >= getCurrentLevelVariables().chaseModeDuration1 &&
          changeModeTimer.second() < getCurrentLevelVariables().scatterModeDuration2) {// 7 seconds
        changeModeTo(SCATTER);
      }
      if (changeModeTimer.second() >= getCurrentLevelVariables().scatterModeDuration2 &&
          changeModeTimer.second() < getCurrentLevelVariables().chaseModeDuration2) {// 20 seconds
        changeModeTo(CHASE);
      }
      if (changeModeTimer.second() >= getCurrentLevelVariables().chaseModeDuration2 &&
          changeModeTimer.second() < getCurrentLevelVariables().scatterModeDuration3) {// 5 seconds
        changeModeTo(SCATTER);
      }
      if (changeModeTimer.second() >= getCurrentLevelVariables().scatterModeDuration3 &&
          changeModeTimer.second() < getCurrentLevelVariables().chaseModeDuration3) {// 20 seconds
        changeModeTo(CHASE);
      }
      if (changeModeTimer.second() >= getCurrentLevelVariables().chaseModeDuration3 &&
          changeModeTimer.second() < getCurrentLevelVariables().scatterModeDuration4) {// 5 seconds
        changeModeTo(SCATTER);
      }
      if (changeModeTimer.second() >= getCurrentLevelVariables().scatterModeDuration4) {// Indefinite
        changeModeTo(CHASE);
      }
    }
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
    super.respawn();
    insideHouse = true;
    scheduleReverseDirection = false;
    eaten = false;
    inTunnel = false;
    previousMode = SCATTER;
    changeModeTo(SCATTER);
    changeStopMovingRateTo(GHOST_NORMAL_STOP);
    changeModeTimer.start();
  }

  void resumeToNormalMode() {
    changeModeTo(previousMode);
    changeStopMovingRateTo(GHOST_NORMAL_STOP);
    changeModeTimer.resume();
  }

  void markAsFrightened() {
    if (!eaten) {
      changeModeTo(FRIGHTENED);
      changeStopMovingRateTo(GHOST_FREIGHT_STOP);
      changeModeTimer.pause();
    }
  }

  void markAsEaten() {
    eaten = true;
    changeStopMovingRateTo(GHOST_EYES_STOP);
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

  boolean isEaten() {
    return eaten;
  }

  boolean isInTunnel() {
    return inTunnel;
  }

  void goOutFromHouse() {
    drawX = convertToCoordInCellCenter(GHOSTS_HOUSE_EXIT_X);
    drawY = convertToCoordInCellCenter(GHOSTS_HOUSE_EXIT_Y);
    selectedMovement = LEFT;
    cleanGhostsHouse();
  }

  void cleanGhostsHouse() {
    // TODO: Make these coordinates to be relative.
    tileGrid.cleanSection(10, 15, 17, 19); // Ghosts house.
  }

  void scheduleReverseDirection() {
    scheduleReverseDirection = true;
  }

  int getPreviousTargetX() {
    return previousTargetX;
  }

  int getPreviousTargetY() {
    return previousTargetY;
  }

  void cleanTarget() {
    tileGrid.cleanCell(previousTargetX, previousTargetY);
  }

  void showTarget() {
    cleanTarget();
    if (targetX >= 0 && targetX < MAX_COLS && targetY >= 0 && targetY < MAX_ROWS) {
      previousTargetX = targetX;
      previousTargetY = targetY;
      drawTarget(targetX, targetY, c);
    }
  }

  boolean shouldMoveMySelf() {
    return shouldMove(inTunnel? GHOST_TUNNEL_STOP : stopMovingRate);
  }

  void debug() {
    super.debug();
    println("inTunnel: " + inTunnel + " changeModeTimer.second(): " + changeModeTimer.second() + " tileGrid.isUpRestricted(this): " + tileGrid.isUpRestricted(this) + " insideHouse: " + insideHouse);
  }
} 
