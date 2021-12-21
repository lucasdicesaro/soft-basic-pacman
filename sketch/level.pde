int TOTAL_LEVELS = 2;
int CURRENT_LEVEL = 0;

Level[] levels = new Level[TOTAL_LEVELS];

void initializeLevelVariables() {
  int levelIndex = 0;
  levels[levelIndex++] = new Level(
    11,
    7,
    7 + 20,
    7 + 20 + 7,
    7 + 20 + 7 + 20,
    7 + 20 + 7 + 20 + 5,
    7 + 20 + 7 + 20 + 5 + 20,
    7 + 20 + 7 + 20 + 5 + 20 + 5
  );
  // TODO: Change values for level 2
  levels[levelIndex++] = new Level(
    11,
    7,
    7 + 20,
    7 + 20 + 7,
    7 + 20 + 7 + 20,
    7 + 20 + 7 + 20 + 5,
    7 + 20 + 7 + 20 + 5 + 20,
    7 + 20 + 7 + 20 + 5 + 20 + 5
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
  //int chaseModeDuration4; Not needed. This is indefinite

  Level (int powerPelletEffectDuration, int scatterModeDuration1, int chaseModeDuration1, int scatterModeDuration2, int chaseModeDuration2, int scatterModeDuration3, int chaseModeDuration3, int scatterModeDuration4) {  
    this.powerPelletEffectDuration = powerPelletEffectDuration;
    this.scatterModeDuration1 = scatterModeDuration1;
    this.chaseModeDuration1 = chaseModeDuration1;
    this.scatterModeDuration2 = scatterModeDuration2;
    this.chaseModeDuration2 = chaseModeDuration2;
    this.scatterModeDuration3 = scatterModeDuration3;
    this.chaseModeDuration3 = chaseModeDuration3;
    this.scatterModeDuration4 = scatterModeDuration4;
  }
}
