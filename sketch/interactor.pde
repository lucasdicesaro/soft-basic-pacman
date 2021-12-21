int pelletCounter;
StopWatchTimer powerPelletEffectTimer = new StopWatchTimer();

class Interactor {

  Interactor () {
  }

  void processIteration() {
    for(Creature creature : creatures) {
      if (creature.shouldMoveMySelf()) {
        creature.processMovement();
      }
    }

    tileGrid.refreshGrid();

    processPellets();

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
    if (powerPelletEffectTimer.running && powerPelletEffectTimer.second() >= getCurrentLevelVariables().powerPelletEffectDuration) {
      powerPelletEffectTimer.stop();
      pacman.changeStopMovingRateTo(PACMAN_NORMAL_STOP);
      for(Ghost ghost : ghosts) {
        if (ghost.isFrightened() && !ghost.isEaten()) {
          ghost.resumeToNormalMode();
        }
      }
    }

    if (tileGrid.isPellet(pacman) || tileGrid.isPowerPellet(pacman)) {
      pelletCounter++;
      if (tileGrid.isPowerPellet(pacman)) {
        pacman.changeStopMovingRateTo(PACMAN_FREIGHT_STOP);
        for(Ghost ghost : ghosts) {
          ghost.markAsFrightened();
        }
        powerPelletEffectTimer.start();
      }
      tileGrid.setCorridor(pacman); // Remove pellet from maze

      // TODO: Review this...
      // TODO: Calculate 244 dynamically on grid building
      if (pelletCounter == 244) {
        if (CURRENT_LEVEL < TOTAL_LEVELS) {
          // TODO: Add 'level completed' maze blinking
          startNextLevel();
        } else {
          println("THE END. BYE");
          delay(2000);
          exit();
        }
      }
    }
  }

  void startNextLevel() {
    addLevel();
    mapFile = new MapFile();
    tileGrid = mapFile.fillGrid();
    tileGrid.renderGrid();
    restartAfterLostLife();
    pelletCounter = 0;
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

  void changeGhostsModeTo(int mode) {
    for(Ghost ghost : ghosts) {
      ghost.changeModeTo(mode);
    }
  }
}
