
int PACMAN_NORMAL_STOP;
int PACMAN_REGULAR_PELLET_STOP;
int PACMAN_POWER_PELLET_STOP;
int PACMAN_FREIGHT_STOP;

int GHOST_NORMAL_STOP;
int GHOST_FREIGHT_STOP;
int GHOST_EYES_STOP;
int GHOST_TUNNEL_STOP;

void initializeSpeedVariables() {
  
  PACMAN_NORMAL_STOP = calculateStopRate(getCurrentLevelVariables().PACMAN_NORMAL_SPEED);
  PACMAN_REGULAR_PELLET_STOP = calculateStopRate(getCurrentLevelVariables().PACMAN_REGULAR_PELLET_SPEED);
  PACMAN_POWER_PELLET_STOP = calculateStopRate(getCurrentLevelVariables().PACMAN_POWER_PELLET_SPEED);
  PACMAN_FREIGHT_STOP = calculateStopRate(getCurrentLevelVariables().PACMAN_FREIGHT_SPEED);

  GHOST_NORMAL_STOP = calculateStopRate(getCurrentLevelVariables().GHOST_NORMAL_SPEED);
  GHOST_FREIGHT_STOP = calculateStopRate(getCurrentLevelVariables().GHOST_FREIGHT_SPEED);
  GHOST_EYES_STOP = calculateStopRate(getCurrentLevelVariables().GHOST_EYES_SPEED);
  GHOST_TUNNEL_STOP = calculateStopRate(getCurrentLevelVariables().GHOST_TUNNEL_SPEED);
}

// frameRate = 60
// speed = 0,75
// 60 / (60 - (60 * 0,75)) = 4
// calculateStopRate = 4
// This means that a creature with speed=0,75 will stops every 4 frames.
// TODO If a ghost has %55 of speed, so its stopMovingRate will be 2,22. So module never is 0. So ghost never stops.
// workaround: round
int calculateStopRate(float speed) {
  return round(frameRate / (frameRate - (frameRate * speed)));
}

boolean shouldMove(float stopMovingRate) {
  if (stopMovingRate == 0)
    return true;
  return frameCount % stopMovingRate != 0;
}
