int pelletCounter;
boolean levelCompleted;
boolean debugEnabled = false;
boolean showTarget = false;
boolean showGrid = false;
boolean showCurrentPosition = false;
StopWatchTimer powerPelletEffectTimer = new StopWatchTimer();

class Interactor {

  Interactor () {
  }

  void startNextLevel() {
    increaseLevel();
    initializeSpeedVariables();
    mapFile = new MapFile();
    tileGrid = mapFile.fillGrid();
    tileGrid.initializeSpecialVariables();
    tileGrid.renderGrid();
    restartAfterLostLife();
    pelletCounter = 0;
    levelCompleted = false;
  }

  void processIteration() {
    for(Creature creature : creatures) {
      if (creature.shouldMoveMySelf()) {
        creature.processMovement();
      }
    }

    processPellets();

    tileGrid.refreshGrid();

    if (levelCompleted) {
      // TODO: Add 'level completed' maze blinking
      startNextLevel();
    }

    processCollisions();
  }

  void processCollisions() {
    Ghost collitionedGhost = checkCollisions();
    if (collitionedGhost != null) {
      if (!collitionedGhost.isFrightened()){
        // Pacman eaten by a ghost
        restartAfterLostLife();
      } else if (!collitionedGhost.isEaten()) {
        delay(200);
        collitionedGhost.markAsEaten();
      }
    }
  }

  Ghost checkCollisions() {
    for(Ghost ghost : ghosts) {
      if (pacman.getGridCellX() == ghost.getGridCellX() &&
          pacman.getGridCellY() == ghost.getGridCellY()) {
         return ghost;
      }
    }
    return null;
  }

  void processPellets() {
    if (hasPowerPelletEffectFinished()) {
      powerPelletEffectTimer.stop();
      pacman.changeStopMovingRateTo(PACMAN_NORMAL_STOP);
      for(Ghost ghost : ghosts) {
        if (ghost.isFrightened() && !ghost.isEaten()) {
          ghost.resumeToNormalMode();
        }
      }
    }

    if (tileGrid.isAnyKindOfPellet(pacman)) {
      pelletCounter++;
      if (tileGrid.isPowerPellet(pacman)) {
        pacman.changeStopMovingRateTo(PACMAN_FREIGHT_STOP);
        for(Ghost ghost : ghosts) {
          ghost.markAsFrightened();
        }
        powerPelletEffectTimer.start();
      }
      // Remove pellet from maze
      if (tileGrid.isAnyKindOfPellet(pacman)) {
        if (tileGrid.isUpRestrictedPositionWithPellet(pacman)) {
          tileGrid.setUpRestrictedPositionWithoutPellet(pacman);
        } else {
          tileGrid.setCorridor(pacman);
        }
      }
    }
    if (pelletCounter == TOTAL_PELLETS && tileGrid.isCenterOfTheCell(pacman)) {
      levelCompleted = true;
    }
  }

  void renderGrid() {
    tileGrid.renderGrid();
  }

  boolean hasPowerPelletEffectFinished() {
    return powerPelletEffectTimer.running && powerPelletEffectTimer.second() >= getCurrentLevelVariables().powerPelletEffectDuration;
  }

  void restartAfterLostLife() {
    delay(2000);
    for(Ghost ghost : ghosts) {
      tileGrid.cleanPreviousTarget(ghost);
    }
    for(Creature creature : creatures) {
      tileGrid.cleanPreviousPosition(creature);
      creature.respawn();
    }
  }

  // Debbuging purposes
  void changeGhostsModeTo(int mode) {
    for(Ghost ghost : ghosts) {
      switch(mode) {
        case CHASE:
          ghost.previousMode = mode;
          ghost.resumeToNormalMode();
          break;
        case SCATTER:
          ghost.previousMode = mode;
          ghost.resumeToNormalMode();
          break;
        case FRIGHTENED:
          ghost.markAsFrightened();
          break;
      }
      ghost.changeModeTimer.stop();
    }
  }
}
