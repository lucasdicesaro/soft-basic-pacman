
final int X_VELOCITY = 2;
final int Y_VELOCITY = 2;

MapFile mapFile;
TileGrid tileGrid;
Keyboard keyboard;

java.util.List<Creature> creatures = new ArrayList<>();
java.util.List<Ghost> ghosts = new ArrayList<>();
Pacman pacman;
Red red;
Pink pink;
Blue blue;
Orange orange;

int pelletCounter;
PFont f;

void setup() {
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  //size(224, 288); // PIXEL_SIZE = 1
  //size(448, 576); // PIXEL_SIZE = 2
  size(672, 864); // PIXEL_SIZE = 3
  //size(728, 936);  // PIXEL_SIZE = 3,25
  //size(784, 1008);  // PIXEL_SIZE = 3,5
  //size(840, 1080); // PIXEL_SIZE = 3,75
  //size(869, 1120); // PIXEL_SIZE =~ 3,88 ArrayIndexOutOfBoundsException on X-borders.
  // ArrayIndexOutOfBoundsException on X-borders: This is because creatures move jumping every X_VELOCITY pixels.
  // So they are jumping the center of cell where validations occurs
  //size(896, 1152); // PIXEL_SIZE = 4

  f = createFont("Arial",16,true); // STEP 2 Create Font
  initializeScaleVariables();

  keyboard = new Keyboard();
  pelletCounter = 0;

  mapFile = new MapFile();
  tileGrid = mapFile.fillGrid();
  tileGrid.renderGrid();
}

void draw() {
  if (!keyboard.isUserKeyReleased()) {
    pacman.setSelectedMovement(keyboard.getUserKeyPressed());
  }
  for(Ghost ghost : ghosts) {
    ghost.showTarget();
  }
  pacman.processMovement();
  for(Ghost ghost : ghosts) {
    ghost.processMovement();
  }

  tileGrid.refreshGrid();
  tileGrid.processCollisions();

  drawPalletCounter();
}

void keyPressed() {
  if (key == CODED) {
    // https://forum.processing.org/one/topic/holding-down-a-key-bug.html
    keyboard.setUserKeyPressed();
    pacman.setSelectedMovement(keyboard.getUserKeyPressed());
  } else if (key == 'd') {
    mapFile.debug();
    tileGrid.debug();
    for(Creature creature : creatures) {
      creature.debug();
    }
  } else if (key == 'c') {
    for(Ghost ghost : ghosts) {
      ghost.changeModeTo(CHASE);
    }
  } else if (key == 's') {
    for(Ghost ghost : ghosts) {
      ghost.changeModeTo(SCATTER);
    }
  } else if (key == 'f') {
    for(Ghost ghost : ghosts) {
      ghost.changeModeTo(FRIGHTENED);
    }
  }
}

void keyReleased() {
  keyboard.releaseUserKey();
}
