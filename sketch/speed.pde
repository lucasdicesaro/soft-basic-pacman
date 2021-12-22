
float PACMAN_NORMAL_STOP;
float PACMAN_REGULAR_PELLET_STOP;
float PACMAN_POWER_PELLET_STOP;
float PACMAN_FREIGHT_STOP;

float GHOST_NORMAL_STOP;
float GHOST_FREIGHT_STOP;
float GHOST_EYES_STOP;
float GHOST_TUNNEL_STOP;

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

float calculateStopRate(float speed) {
  return frameRate / (frameRate - (frameRate * speed));
}

boolean shouldMove(float stopMovingRate) {
  // TODO If a ghost has %55 of speed, so its stopMovingRate will be 2,22. So module never is 0. So ghost never stops.
  // Ugly workaround: cast to int
  int stopMovingRateInt = (int) stopMovingRate;
  if (stopMovingRateInt == 0)
    return true;
  return frameCount % stopMovingRateInt != 0;
}
