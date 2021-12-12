final int PELLET_SIZE = 5;
final int POWER_PELLET_SIZE = 13;

color wallColor = color(33, 33, 222);
int pixelSize = SCALE / 8; // Simulates 8 pixels per cell

void drawCreature(int drawX, int drawY, color c) {
  noStroke();
  fill(c);
  /* drawX, drawY are the center of the circle */
  circle(drawX, drawY, CREATURE_SIZE);
  stroke(0);
}

void drawCreatureCenter(int drawX, int drawY, color c) {
  fill(c);
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
  text(nf(pelletCounter, 3), cellToCoord(x), cellToCoord(y+1));
}

/* Walls */

void drawBlueWallInCellGrid(int x, int y, int wallId) {
  drawCorridorInCellGrid(x, y);
  stroke(wallColor);
  strokeWeight(pixelSize);
  switch(wallId) {
    case DOUBLE_WALL_VERTICAL_LEFT:
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + SCALE); // Vertical line over the left side
      line(cellToCoord(x) + (pixelSize * 3), cellToCoord(y), cellToCoord(x) + (pixelSize * 3), cellToCoord(y) + SCALE); // Vertical line to 3 "pixels" from left cell side
      break;
    case DOUBLE_WALL_VERTICAL_RIGHT:
      line(cellToCoord(x) + SCALE - pixelSize, cellToCoord(y), cellToCoord(x) + SCALE - pixelSize, cellToCoord(y) + SCALE);; // Vertical line over the right cell side
      line(cellToCoord(x) + SCALE - (pixelSize * 4), cellToCoord(y), cellToCoord(x) + SCALE - (pixelSize * 4), cellToCoord(y) + SCALE); // Vertical line to 4 "pixels" from right cell side
      break;
    case DOUBLE_WALL_HORIZONTAL_TOP:
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + SCALE, cellToCoord(y)); // Horizontal line over the top cell side
      line(cellToCoord(x), cellToCoord(y) + (pixelSize * 3), cellToCoord(x)  + SCALE, cellToCoord(y) + (pixelSize * 3)); // Horizontal line to 3 "pixels" from top cell side
      break;
    case DOUBLE_CORNER_TOP_LEFT:
      drawWallInCellGrid(x, y);
      break;
    case DOUBLE_CORNER_TOP_RIGHT:
      drawWallInCellGrid(x, y);
      break;
    case DOUBLE_CORNER_BOTTOM_LEFT:
      drawWallInCellGrid(x, y);
      break;
    case DOUBLE_CORNER_BOTTOM_RIGHT:
      drawWallInCellGrid(x, y);
      break;
    case DOUBLE_WALL_HORIZONTAL_BOTTOM:
      line(cellToCoord(x), cellToCoord(y) + SCALE - pixelSize, cellToCoord(x) + SCALE, cellToCoord(y) + SCALE - pixelSize); // Horizontal line over the top cell side
      line(cellToCoord(x), cellToCoord(y) + SCALE - (pixelSize * 4), cellToCoord(x) + SCALE, cellToCoord(y) + SCALE - (pixelSize * 4)); // Horizontal line to 4 "pixels" from top cell side
      break;
    case SIMPLE_WALL_VERTICAL_LEFT:
      line(cellToCoord(x) + (pixelSize * 3), cellToCoord(y), cellToCoord(x) + (pixelSize * 3), cellToCoord(y) + SCALE); // Vertical line to 3 "pixels" from left cell side
      break;
    case SIMPLE_WALL_VERTICAL_RIGHT:
      line(cellToCoord(x) + SCALE - (pixelSize * 4), cellToCoord(y), cellToCoord(x) + SCALE - (pixelSize * 4), cellToCoord(y) + SCALE); // Vertical line to 4 "pixels" from right cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_TOP:
      line(cellToCoord(x), cellToCoord(y) + (pixelSize * 3), cellToCoord(x)  + SCALE, cellToCoord(y) + (pixelSize * 3)); // Horizontal line to 3 "pixels" from top cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_BOTTOM:
      line(cellToCoord(x), cellToCoord(y) + SCALE - (pixelSize * 4), cellToCoord(x) + SCALE, cellToCoord(y) + SCALE - (pixelSize * 4)); // Horizontal line to 4 "pixels" from top cell side
      break;
    case SIMPLE_CORNER_TOP_LEFT:
      drawWallInCellGrid(x, y);
      break;
    case SIMPLE_CORNER_TOP_RIGHT:
      drawWallInCellGrid(x, y);
      break;
    case SIMPLE_CORNER_BOTTOM_LEFT:
      line(cellToCoord(x) + (pixelSize * 5), cellToCoord(y), cellToCoord(x) + (pixelSize * 5), cellToCoord(y) + (pixelSize * 2));
      line(cellToCoord(x) + (pixelSize * 6), cellToCoord(y) + (pixelSize * 3), cellToCoord(x) + (pixelSize * 5), cellToCoord(y) + (pixelSize * 3));
      line(cellToCoord(x) + (pixelSize * 7), cellToCoord(y) + (pixelSize * 4), cellToCoord(x) + SCALE, cellToCoord(y) + (pixelSize * 4));
      break;
    case SIMPLE_CORNER_BOTTOM_RIGHT:
      drawWallInCellGrid(x, y);
      break;
  }

  // back to default
  strokeWeight(1);
  stroke(0);
}
