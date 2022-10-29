
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

  if (!debugEnabled) {
    interactor.processIteration();
  }
}

void keyPressed() {
  if (key == CODED) {
    // https://forum.processing.org/one/topic/holding-down-a-key-bug.html
    keyboard.setUserKeyPressed();
    pacman.setSelectedMovement(keyboard.getUserKeyPressed());

    if (debugEnabled) {
      interactor.processIteration();
    }
  } else if (key == 'd') {
    printScaleVariables();
    mapFile.debug();
    tileGrid.debug();
    for(Creature creature : creatures) {
      creature.debug();
    }
    debugEnabled = !debugEnabled;
  } else if (key == 't') {
    for(Ghost ghost : ghosts) {
      ghost.cleanTarget();
    }
    showTarget = !showTarget;
  } else if (key == 'r') {
    for(Ghost ghost : ghosts) {
      ghost.cleanPreviousRoute();
    }
    showRoute = !showRoute;
  } else if (key == 'p') {
    showCurrentPosition = !showCurrentPosition;
  } else if (key == 'g') {
    showGrid = !showGrid;
    interactor.renderGrid();
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
