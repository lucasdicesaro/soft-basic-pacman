
class Interactor {
  Interactor () {  

  }

  void processMovements() {
    for(Creature creature : creatures) {
      if (creature.shouldMoveMySelf()) {
        creature.processMovement();
      }
    }

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
      } else {
        //delay(500);
        // TODO: Move eyes's ghost forward one position
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

  void changeGhostsModeTo(int mode) {
    for(Ghost ghost : ghosts) {
      ghost.changeModeTo(mode);
    }
  }
}
