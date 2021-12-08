final int PELLET_SIZE = 5;
final int POWER_PELLET_SIZE = 13;

void drawCreature(int drawX, int drawY, color c) {
  noStroke();
  fill(c);
  /* drawX, drawY are the center of the circle */
  circle(drawX, drawY, CREATURE_SIZE);
  stroke(0);
}

void drawCreatureCenter(int drawX, int drawY) {
  fill(color(0, 204, 255));
  circle(drawX, drawY, CREATURE_CENTER_SIZE);
}

/* Square drawing starts from left-up corner */
void drawWallCell(int drawX, int drawY) {
  fill(255);
  drawSquare(drawX, drawY);
}

void drawBlackCell(int drawX, int drawY) {
  fill(0);
  drawSquare(drawX, drawY);
}

/* cuantizeCoord(...) forces to any coordinate to start from left-up corner of a cell inside the grid */
void drawSquare(int drawX, int drawY) {
  /* drawX, drawY are the left-up corner of the square */
  square(cuantizeCoord(drawX), cuantizeCoord(drawY), SCALE);
}


/* These methods are used when we are working with grid positions */

void drawWallInCellGrid(int x, int y) {
  fill(255);
  /* drawX, drawY are the left-up corner of the square */
  square(cellToCoord(x), cellToCoord(y), SCALE);
}

void drawCorridorInCellGrid(int x, int y) {
  fill(0);
  drawSquare(cellToCoord(x), cellToCoord(y));
}

void drawPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  fill(255);
  circle(cellToCoord(x) + (SCALE / 2), cellToCoord(y) + (SCALE / 2), PELLET_SIZE);
}

void drawPowerPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  fill(255);
  circle(cellToCoord(x) + (SCALE / 2), cellToCoord(y) + (SCALE / 2), POWER_PELLET_SIZE);
}

void drawTarget(int x, int y, color c) {
  stroke(c);
  noFill();
  square(cellToCoord(x), cellToCoord(y), SCALE);
  stroke(0);
}

void drawPalletCounter() {
  int x = 4;
  int y = 0;
  tileGrid.cleanSection(x, x+1, y, y);
  textFont(f,16);
  fill(255);
  text(nf(pelletCounter, 3),cellToCoord(x), cellToCoord(y+1));
}
