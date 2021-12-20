int pelletCounter;
StopWatchTimer powerPelletEffectTimer = new StopWatchTimer();

class Interactor {

  Interactor () {
    pelletCounter = 0;
  }

  void processMovements() {
    for(Creature creature : creatures) {
      if (creature.shouldMoveMySelf()) {
        creature.processMovement();
      }
    }

    processPellets();

    processCollisions();
  }

  void processCollisions() {
    Ghost collitionedGhost = checkCollisions();
    if (collitionedGhost != null) {
      if (!collitionedGhost.isFrightened()){
        // Pacman eaten by a ghost
        delay(2000);
        for(Creature creature : creatures) {
          tileGrid.cleanPreviousPosition(creature);
          creature.respawn();
        }
      } else if (!collitionedGhost.isEaten()) {
        delay(300);
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
    }
  }

  void changeGhostsModeTo(int mode) {
    for(Ghost ghost : ghosts) {
      ghost.changeModeTo(mode);
    }
  }
}
