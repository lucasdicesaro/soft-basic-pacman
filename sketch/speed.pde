
float PACMAN_NORMAL_SPEED = 0.8;
float PACMAN_REGULAR_PELLET_SPEED = 0.71;
float PACMAN_POWER_PELLET_SPEED = 0.78;
float PACMAN_FREIGHT_SPEED = 0.8;

float GHOST_NORMAL_SPEED = 0.75;
float GHOST_FREIGHT_SPEED = 0.5;
float GHOST_EYES_SPEED = 0.9;
float GHOST_TUNNEL_SPEED = 0.4;

float PACMAN_NORMAL_STOP;
float PACMAN_REGULAR_PELLET_STOP;
float PACMAN_POWER_PELLET_STOP;
float PACMAN_FREIGHT_STOP;

float GHOST_NORMAL_STOP;
float GHOST_FREIGHT_STOP;
float GHOST_EYES_STOP;
float GHOST_TUNNEL_STOP;

void initializeSpeedVariables() {
  
  PACMAN_NORMAL_STOP = calculateStopRate(PACMAN_NORMAL_SPEED);
  PACMAN_REGULAR_PELLET_STOP = calculateStopRate(PACMAN_REGULAR_PELLET_SPEED);
  PACMAN_POWER_PELLET_STOP = calculateStopRate(PACMAN_POWER_PELLET_SPEED);
  PACMAN_FREIGHT_STOP = calculateStopRate(PACMAN_FREIGHT_SPEED);

  GHOST_NORMAL_STOP = calculateStopRate(GHOST_NORMAL_SPEED);
  GHOST_FREIGHT_STOP = calculateStopRate(GHOST_FREIGHT_SPEED);
  GHOST_EYES_STOP = calculateStopRate(GHOST_EYES_SPEED);
  GHOST_TUNNEL_STOP = calculateStopRate(GHOST_TUNNEL_SPEED);

}

float calculateStopRate(float speed) {
  return frameRate / (frameRate - (frameRate * speed));
}

boolean shouldMove(float stopMovingRate) {
  return frameCount % stopMovingRate != 0;
}
