final int CHASE = 0;
final int SCATTER = 1;
final int FRIGHTENED = 2;

class GameMode {
  int currentMode;
  int previousMode;
  
  GameMode () {  
    currentMode = CHASE;
    previousMode = CHASE;
  }
  
  void changeModeTo(int newMode) {
    previousMode = currentMode;
    currentMode = newMode;
    reverseDirectionForAllGhosts();
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

  void reverseDirectionForAllGhosts() {
    if (previousMode != FRIGHTENED) {
      for(Ghost ghost : ghosts) {
        ghost.scheduleReverseDirection();
      }
    }
  }
}
