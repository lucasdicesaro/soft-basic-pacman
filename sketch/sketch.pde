
final int X_VELOCITY = 3;
final int Y_VELOCITY = 3;

MapFile mapFile;
TileGrid tileGrid;

java.util.List<Creature> creatures = new ArrayList<>();
Pacman pacman;
Red red;

void setup() {
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  size(672, 864);

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
  }
}
