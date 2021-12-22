int TOTAL_LEVELS = 2;
int CURRENT_LEVEL = 0;

Level[] levels = new Level[TOTAL_LEVELS];

void initializeLevelVariables() {
  int levelIndex = 0;
  levels[levelIndex++] = new Level(
    11,      // powerPelletEffectDuration
    7,       // scatterModeDuration1
    7 + 20,  // chaseModeDuration1
    7 + 20 + 7,
    7 + 20 + 7 + 20,
    7 + 20 + 7 + 20 + 5,
    7 + 20 + 7 + 20 + 5 + 20,
    7 + 20 + 7 + 20 + 5 + 20 + 5,
    0.8,   // PACMAN_NORMAL_SPEED
    0.71,  // PACMAN_REGULAR_PELLET_SPEED
    0.78,  // PACMAN_POWER_PELLET_SPEED
    0.9,   // PACMAN_FREIGHT_SPEED
    0.75,  // GHOST_NORMAL_SPEED
    0.5,   // GHOST_FREIGHT_SPEED
    1.0,   // GHOST_EYES_SPEED
    0.4    // GHOST_TUNNEL_SPEED
    );
  levels[levelIndex++] = new Level(
    11,      // powerPelletEffectDuration
    7,       // scatterModeDuration1
    7 + 20,  // chaseModeDuration1
    7 + 20 + 7,
    7 + 20 + 7 + 20,
    7 + 20 + 7 + 20 + 5,
    7 + 20 + 7 + 20 + 5 + 1033,
    7 + 20 + 7 + 20 + 5 + 1033 + 1,
    0.9,   // PACMAN_NORMAL_SPEED
    0.79,  // PACMAN_REGULAR_PELLET_SPEED
    0.83,  // PACMAN_POWER_PELLET_SPEED
    0.95,  // PACMAN_FREIGHT_SPEED
    0.85,  // GHOST_NORMAL_SPEED
    0.55,  // GHOST_FREIGHT_SPEED
    1.0,   // GHOST_EYES_SPEED
    0.45    // GHOST_TUNNEL_SPEED
  );
}

void addLevel() {
  CURRENT_LEVEL++;
}

Level getCurrentLevelVariables() {
  return levels[CURRENT_LEVEL-1];
}

class Level {
  int powerPelletEffectDuration;

  int scatterModeDuration1;
  int chaseModeDuration1;
  int scatterModeDuration2;
  int chaseModeDuration2;
  int scatterModeDuration3;
  int chaseModeDuration3;
  int scatterModeDuration4;
  //int chaseModeDuration4; Not needed. This is indefinite\

  float PACMAN_NORMAL_SPEED;
  float PACMAN_REGULAR_PELLET_SPEED;
  float PACMAN_POWER_PELLET_SPEED;
  float PACMAN_FREIGHT_SPEED;

  float GHOST_NORMAL_SPEED;
  float GHOST_FREIGHT_SPEED;
  float GHOST_EYES_SPEED;
  float GHOST_TUNNEL_SPEED;

  Level (int powerPelletEffectDuration, int scatterModeDuration1, int chaseModeDuration1, int scatterModeDuration2, int chaseModeDuration2, int scatterModeDuration3, int chaseModeDuration3, int scatterModeDuration4,
    float PACMAN_NORMAL_SPEED, float PACMAN_REGULAR_PELLET_SPEED, float PACMAN_POWER_PELLET_SPEED, float PACMAN_FREIGHT_SPEED, float GHOST_NORMAL_SPEED, float GHOST_FREIGHT_SPEED, float GHOST_EYES_SPEED,
    float GHOST_TUNNEL_SPEED) {
    this.powerPelletEffectDuration = powerPelletEffectDuration;

    this.scatterModeDuration1 = scatterModeDuration1;
    this.chaseModeDuration1 = chaseModeDuration1;
    this.scatterModeDuration2 = scatterModeDuration2;
    this.chaseModeDuration2 = chaseModeDuration2;
    this.scatterModeDuration3 = scatterModeDuration3;
    this.chaseModeDuration3 = chaseModeDuration3;
    this.scatterModeDuration4 = scatterModeDuration4;

    this.PACMAN_NORMAL_SPEED = PACMAN_NORMAL_SPEED;
    this.PACMAN_REGULAR_PELLET_SPEED = PACMAN_REGULAR_PELLET_SPEED;
    this.PACMAN_POWER_PELLET_SPEED = PACMAN_POWER_PELLET_SPEED;
    this.PACMAN_FREIGHT_SPEED = PACMAN_FREIGHT_SPEED;

    this.GHOST_NORMAL_SPEED = GHOST_NORMAL_SPEED;
    this.GHOST_FREIGHT_SPEED = GHOST_FREIGHT_SPEED;
    this.GHOST_EYES_SPEED = GHOST_EYES_SPEED;
    this.GHOST_TUNNEL_SPEED = GHOST_TUNNEL_SPEED;
  }
}
