
final int X_VELOCITY = 3;
final int Y_VELOCITY = 3;

MapFile mapFile;
TileGrid tileGrid;
GameMode gameMode;

java.util.List<Creature> creatures = new ArrayList<>();
java.util.List<Ghost> ghosts = new ArrayList<>();
Pacman pacman;
Red red;
Pink pink;
Blue blue;
Orange orange;

void setup() {
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  size(672, 864);

  gameMode = new GameMode();

  mapFile = new MapFile();
  tileGrid = mapFile.fillGrid();
  tileGrid.renderGrid();
}

void draw() {
  for(Creature creature : creatures) {
    creature.processMovement();
  }
  tileGrid.refreshGrid();
}

void keyPressed() {
  if (key == CODED) {
     pacman.setSelectedMovement(keyCode);
  } else if (key == 'd') {
    //tileGrid.debug();
    for(Creature creature : creatures) {
      creature.debug();
    }
  } else if (key == 'c') {
    gameMode.changeModeTo(CHASE);
  } else if (key == 's') {
    gameMode.changeModeTo(SCATTER);
  } else if (key == 'f') {
    gameMode.changeModeTo(FRIGHTENED);
  }
}
