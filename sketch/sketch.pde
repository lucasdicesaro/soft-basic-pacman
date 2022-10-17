
MapFile mapFile;
TileGrid tileGrid;
Keyboard keyboard;
Interactor interactor;
StopWatchTimer stopWatchTimer;

java.util.List<Creature> creatures;
java.util.List<Ghost> ghosts;
Pacman pacman;
Red red;
Pink pink;
Blue blue;
Orange orange;

PFont f;

void setup() {
  fullScreen();
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  //size(224, 288); // PIXEL_SIZE = 1
  //size(448, 576); // PIXEL_SIZE = 2
  //size(672, 864); // PIXEL_SIZE = 3
  //size(896, 1152); // PIXEL_SIZE = 4
  //size(1120, 1440); // PIXEL_SIZE = 5
  background(0);

  f = createFont("Arial", 16, true);
  initializeScaleVariables();

  keyboard = new Keyboard();
  interactor = new Interactor();
  interactor.startNextLevel();

  // https://discourse.processing.org/t/keypressed-only-works-sometimes/22340/2
  surface.setVisible(true);  
}

void draw() {
  if (!keyboard.isUserKeyReleased()) {
    pacman.setSelectedMovement(keyboard.getUserKeyPressed());
  }

  interactor.processIteration();
}

void keyPressed() {
  if (key == CODED) {
    // https://forum.processing.org/one/topic/holding-down-a-key-bug.html
    keyboard.setUserKeyPressed();
    pacman.setSelectedMovement(keyboard.getUserKeyPressed());

  } else if (key == 'd') {
    printScaleVariables();
    mapFile.debug();
    tileGrid.debug();
    for(Creature creature : creatures) {
      creature.debug();
    }
  } else if (key == 'c') {
    interactor.changeGhostsModeTo(CHASE);
  } else if (key == 's') {
    interactor.changeGhostsModeTo(SCATTER);
  } else if (key == 'f') {
    interactor.changeGhostsModeTo(FRIGHTENED);
  } else if (key == 'q') {
    println("Terminated by the user. Bye.");
    exit();
  }
}

void keyReleased() {
  keyboard.releaseUserKey();
}
