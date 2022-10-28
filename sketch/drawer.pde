
color wallColor = color(25, 25, 166);
color eyesColor = color(33, 33, 222);
color frightenedColor = color(33, 33, 222);

void drawPacman(int drawX, int drawY, color c, int selectedMovement, int pacmanSprite) {
  switch(pacmanSprite) {
    case 0:
    case 1:
    case 2:
    case 3:
      drawClosedPacman(drawX, drawY, c);
      break;
    case 4:
    case 5:
    case 6:
    case 7:
      drawPacmanSemiOpen(drawX, drawY, c, selectedMovement);
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      drawPacmanOpen(drawX, drawY, c, selectedMovement);
      break;
  }
}

void drawClosedPacman(int drawX, int drawY, color c) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
  line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);
  line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
  line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY, drawX + SIX_PIXELS, drawY);
  line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);
  line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);
  line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
  line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPacmanSemiOpen(int drawX, int drawY, color c, int selectedMovement) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  switch(selectedMovement) {
    case LEFT:
      line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);
      line(drawX - THREE_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
      line(drawX, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);
      line(drawX + THREE_PIXELS, drawY, drawX + SIX_PIXELS, drawY);
      line(drawX, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);
      line(drawX - THREE_PIXELS, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);
      line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
      line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);
      break;
    case RIGHT:
      line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);
      line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX + THREE_PIXELS, drawY - TWO_PIXELS);
      line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX, drawY - ONE_PIXEL);
      line(drawX - SIX_PIXELS, drawY, drawX - THREE_PIXELS, drawY);
      line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX, drawY + ONE_PIXEL);
      line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX + THREE_PIXELS, drawY + TWO_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);
      line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
      line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);
      break;
    case UP:
      line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX - THREE_PIXELS, drawY - FIVE_PIXELS);
      line(drawX + THREE_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);

      line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX - THREE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX + THREE_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);

      line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX - TWO_PIXELS, drawY - THREE_PIXELS);
      line(drawX + TWO_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);

      line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX - TWO_PIXELS, drawY - TWO_PIXELS);
      line(drawX + TWO_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);

      line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX - TWO_PIXELS, drawY - ONE_PIXEL);
      line(drawX + TWO_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY, drawX - ONE_PIXEL, drawY);
      line(drawX + ONE_PIXEL, drawY, drawX + SIX_PIXELS, drawY);

      line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX - ONE_PIXEL, drawY + ONE_PIXEL);
      line(drawX + ONE_PIXEL, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX - ONE_PIXEL, drawY + TWO_PIXELS);
      line(drawX + ONE_PIXEL, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);

      line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);
      line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
      line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);
      break;
    case DOWN:
      line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);

      line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX - ONE_PIXEL, drawY - TWO_PIXELS);
      line(drawX + ONE_PIXEL, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);

      line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX - ONE_PIXEL, drawY - ONE_PIXEL);
      line(drawX + ONE_PIXEL, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY, drawX - ONE_PIXEL, drawY);
      line(drawX + ONE_PIXEL, drawY, drawX + SIX_PIXELS, drawY);

      line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX - TWO_PIXELS, drawY + ONE_PIXEL);
      line(drawX + TWO_PIXELS, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX - TWO_PIXELS, drawY + TWO_PIXELS);
      line(drawX + TWO_PIXELS, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);

      line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX - TWO_PIXELS, drawY + THREE_PIXELS);
      line(drawX + TWO_PIXELS, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);

      line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX - THREE_PIXELS, drawY + FOUR_PIXELS);
      line(drawX + THREE_PIXELS, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);

      line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX - THREE_PIXELS, drawY + FIVE_PIXELS);
      line(drawX + THREE_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
      break;
  }

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPacmanOpen(int drawX, int drawY, color c, int selectedMovement) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  switch(selectedMovement) {
    case LEFT:
      line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - TWO_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
      line(drawX - ONE_PIXEL, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);
      line(drawX + ONE_PIXEL, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
      line(drawX + TWO_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);
      line(drawX + THREE_PIXELS, drawY, drawX + SIX_PIXELS, drawY);
      line(drawX + TWO_PIXELS, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);
      line(drawX + ONE_PIXEL, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);
      line(drawX, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);
      line(drawX - ONE_PIXEL, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);
      line(drawX - TWO_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
      line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);
      break;
    case RIGHT:
      line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + TWO_PIXELS, drawY - FIVE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + ONE_PIXEL, drawY - FOUR_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX, drawY - THREE_PIXELS);
      line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX - ONE_PIXEL, drawY - TWO_PIXELS);
      line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX - TWO_PIXELS, drawY - ONE_PIXEL);
      line(drawX - SIX_PIXELS, drawY, drawX - THREE_PIXELS, drawY);
      line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX - TWO_PIXELS, drawY + ONE_PIXEL);
      line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX - ONE_PIXEL, drawY + TWO_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX, drawY + THREE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX + ONE_PIXEL, drawY + FOUR_PIXELS);
      line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX + TWO_PIXELS, drawY + FIVE_PIXELS);
      line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);
      break;
    case UP:
      line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX - FIVE_PIXELS, drawY - TWO_PIXELS);
      line(drawX + FIVE_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);

      line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX - FOUR_PIXELS, drawY - ONE_PIXEL);
      line(drawX + FOUR_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY, drawX - THREE_PIXELS, drawY);
      line(drawX + THREE_PIXELS, drawY, drawX + SIX_PIXELS, drawY);

      line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX - TWO_PIXELS, drawY + ONE_PIXEL);
      line(drawX + TWO_PIXELS, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX - ONE_PIXEL, drawY + TWO_PIXELS);
      line(drawX + ONE_PIXEL, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);

      line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);
      line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
      line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);
      break;
    case DOWN:
      line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);

      line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX - ONE_PIXEL, drawY - TWO_PIXELS);
      line(drawX + ONE_PIXEL, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);

      line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX - TWO_PIXELS, drawY - ONE_PIXEL);
      line(drawX + TWO_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY, drawX - THREE_PIXELS, drawY);
      line(drawX + THREE_PIXELS, drawY, drawX + SIX_PIXELS, drawY);

      line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX - FOUR_PIXELS, drawY + ONE_PIXEL);
      line(drawX + FOUR_PIXELS, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);

      line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX - FIVE_PIXELS, drawY + TWO_PIXELS);
      line(drawX + FIVE_PIXELS, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);
      break;
  }

  // back to default
  strokeWeight(1);
  stroke(0);
}


void drawGhost(int drawX, int drawY, color c) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  // ghost body
  line(drawX - ONE_PIXEL, drawY - SEVEN_PIXELS, drawX + TWO_PIXELS, drawY - SEVEN_PIXELS);
  line(drawX - THREE_PIXELS, drawY - SIX_PIXELS, drawX + FOUR_PIXELS, drawY - SIX_PIXELS);
  line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FIVE_PIXELS, drawY - FIVE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + SIX_PIXELS, drawY - FOUR_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + SIX_PIXELS, drawY - THREE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
  line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX + SEVEN_PIXELS, drawY - ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY, drawX + SEVEN_PIXELS, drawY);
  line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX + SEVEN_PIXELS, drawY + ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX + SEVEN_PIXELS, drawY + TWO_PIXELS);
  line(drawX - SIX_PIXELS, drawY + THREE_PIXELS, drawX + SEVEN_PIXELS, drawY + THREE_PIXELS);
  line(drawX - SIX_PIXELS, drawY + FOUR_PIXELS, drawX + SEVEN_PIXELS, drawY + FOUR_PIXELS);

  // ghost fringes
  strokeCap(PROJECT); // Point appears square. This is for point() function.
  point(drawX - SIX_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - FIVE_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - THREE_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - TWO_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - ONE_PIXEL, drawY + FIVE_PIXELS);
  point(drawX + TWO_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + THREE_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + SIX_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + SEVEN_PIXELS, drawY + FIVE_PIXELS);

  point(drawX - SIX_PIXELS, drawY + SIX_PIXELS);
  point(drawX - TWO_PIXELS, drawY + SIX_PIXELS);
  point(drawX - ONE_PIXEL, drawY + SIX_PIXELS);
  point(drawX + TWO_PIXELS, drawY + SIX_PIXELS);
  point(drawX + THREE_PIXELS, drawY + SIX_PIXELS);
  point(drawX + SEVEN_PIXELS, drawY + SIX_PIXELS);

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawFrightenedGhost(int drawX, int drawY) {
  drawGhost(drawX, drawY, frightenedColor);

  // Frightened face
  strokeWeight(PIXEL_SIZE);
  stroke(255);
  // Left eye
  line(drawX - TWO_PIXELS, drawY - TWO_PIXELS, drawX - ONE_PIXEL, drawY - TWO_PIXELS);
  line(drawX - TWO_PIXELS, drawY - ONE_PIXEL, drawX - ONE_PIXEL, drawY - ONE_PIXEL);
  // Right eye
  line(drawX + TWO_PIXELS, drawY - TWO_PIXELS, drawX + THREE_PIXELS, drawY - TWO_PIXELS);
  line(drawX + TWO_PIXELS, drawY - ONE_PIXEL, drawX + THREE_PIXELS, drawY - ONE_PIXEL);
  // Mouth
  point(drawX - FIVE_PIXELS, drawY + THREE_PIXELS);
  line(drawX - FOUR_PIXELS, drawY + TWO_PIXELS, drawX - THREE_PIXELS, drawY + TWO_PIXELS);
  line(drawX - TWO_PIXELS, drawY + THREE_PIXELS, drawX - ONE_PIXEL, drawY + THREE_PIXELS);
  line(drawX, drawY + TWO_PIXELS, drawX + ONE_PIXEL, drawY + TWO_PIXELS);
  line(drawX + TWO_PIXELS, drawY + THREE_PIXELS, drawX + THREE_PIXELS, drawY + THREE_PIXELS);
  line(drawX + FOUR_PIXELS, drawY + TWO_PIXELS, drawX + FIVE_PIXELS, drawY + TWO_PIXELS);
  point(drawX + SIX_PIXELS, drawY + THREE_PIXELS);

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawEyes(int drawX, int drawY, int selectedMovement) {
  strokeWeight(PIXEL_SIZE);
  switch(selectedMovement) {
    case LEFT:
      // Left eye
      stroke(255);
      line(drawX - FOUR_PIXELS, drawY - FOUR_PIXELS, drawX - THREE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX - TWO_PIXELS, drawY - THREE_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - TWO_PIXELS, drawX - TWO_PIXELS, drawY - TWO_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - ONE_PIXEL, drawX - TWO_PIXELS, drawY - ONE_PIXEL);
      line(drawX - FOUR_PIXELS, drawY, drawX - THREE_PIXELS, drawY);

      // Left pupil
      stroke(eyesColor);
      line(drawX - FIVE_PIXELS, drawY - TWO_PIXELS, drawX - FOUR_PIXELS, drawY - TWO_PIXELS);
      line(drawX - FIVE_PIXELS, drawY - ONE_PIXEL, drawX - FOUR_PIXELS, drawY - ONE_PIXEL);

      // Right eye
      stroke(255);
      line(drawX + TWO_PIXELS, drawY - FOUR_PIXELS, drawX + THREE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX + ONE_PIXEL, drawY - THREE_PIXELS, drawX + FOUR_PIXELS, drawY - THREE_PIXELS);
      line(drawX + ONE_PIXEL, drawY - TWO_PIXELS, drawX + FOUR_PIXELS, drawY - TWO_PIXELS);
      line(drawX + ONE_PIXEL, drawY - ONE_PIXEL, drawX + FOUR_PIXELS, drawY - ONE_PIXEL);
      line(drawX + TWO_PIXELS, drawY, drawX + THREE_PIXELS, drawY);

      // Right pupil
      stroke(eyesColor);
      line(drawX + ONE_PIXEL, drawY - TWO_PIXELS, drawX + TWO_PIXELS, drawY - TWO_PIXELS);
      line(drawX + ONE_PIXEL, drawY - ONE_PIXEL, drawX + TWO_PIXELS, drawY - ONE_PIXEL);
      break;
    case RIGHT:
      // Left eye
      stroke(255);
      line(drawX - TWO_PIXELS, drawY - FOUR_PIXELS, drawX - ONE_PIXEL, drawY - FOUR_PIXELS);
      line(drawX - THREE_PIXELS, drawY - THREE_PIXELS, drawX, drawY - THREE_PIXELS);
      line(drawX - THREE_PIXELS, drawY - TWO_PIXELS, drawX, drawY - TWO_PIXELS);
      line(drawX - THREE_PIXELS, drawY - ONE_PIXEL, drawX, drawY - ONE_PIXEL);
      line(drawX - TWO_PIXELS, drawY, drawX - ONE_PIXEL, drawY);

      // Left pupil
      stroke(eyesColor);
      line(drawX - ONE_PIXEL, drawY - TWO_PIXELS, drawX, drawY - TWO_PIXELS);
      line(drawX - ONE_PIXEL, drawY - ONE_PIXEL, drawX, drawY - ONE_PIXEL);

      // Right eye
      stroke(255);
      line(drawX + FOUR_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX + THREE_PIXELS, drawY - THREE_PIXELS, drawX + SIX_PIXELS, drawY - THREE_PIXELS);
      line(drawX + THREE_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
      line(drawX + THREE_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);
      line(drawX + FOUR_PIXELS, drawY, drawX + FIVE_PIXELS, drawY);

      // Right pupil
      stroke(eyesColor);
      line(drawX + FIVE_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
      line(drawX + FIVE_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);
      break;
    case UP:
      // Left eye
      stroke(255);
      line(drawX - THREE_PIXELS, drawY - SIX_PIXELS, drawX - TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX - ONE_PIXEL, drawY - FIVE_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - FOUR_PIXELS, drawX - ONE_PIXEL, drawY - FOUR_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - THREE_PIXELS, drawX - ONE_PIXEL, drawY - THREE_PIXELS);
      line(drawX - THREE_PIXELS, drawY - TWO_PIXELS, drawX - TWO_PIXELS, drawY - TWO_PIXELS);

      // Left pupil
      stroke(eyesColor);
      line(drawX - THREE_PIXELS, drawY - SIX_PIXELS, drawX - TWO_PIXELS, drawY - SIX_PIXELS);
      line(drawX - THREE_PIXELS, drawY - FIVE_PIXELS, drawX - TWO_PIXELS, drawY - FIVE_PIXELS);

      // Right eye
      stroke(255);
      line(drawX + THREE_PIXELS, drawY - SIX_PIXELS, drawX + FOUR_PIXELS, drawY - SIX_PIXELS);
      line(drawX + TWO_PIXELS, drawY - FIVE_PIXELS, drawX + FIVE_PIXELS, drawY - FIVE_PIXELS);
      line(drawX + TWO_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
      line(drawX + TWO_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);
      line(drawX + THREE_PIXELS, drawY - TWO_PIXELS, drawX + FOUR_PIXELS, drawY - TWO_PIXELS);

      // Right pupil
      stroke(eyesColor);
      line(drawX + THREE_PIXELS, drawY - SIX_PIXELS, drawX + FOUR_PIXELS, drawY - SIX_PIXELS);
      line(drawX + THREE_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
      break;
    case DOWN:
      // Left eye
      stroke(255);
      line(drawX - THREE_PIXELS, drawY - FOUR_PIXELS, drawX - TWO_PIXELS, drawY - FOUR_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - THREE_PIXELS, drawX - ONE_PIXEL, drawY - THREE_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - TWO_PIXELS, drawX - ONE_PIXEL, drawY - TWO_PIXELS);
      line(drawX - FOUR_PIXELS, drawY - ONE_PIXEL, drawX - ONE_PIXEL, drawY - ONE_PIXEL);
      line(drawX - THREE_PIXELS, drawY, drawX - TWO_PIXELS, drawY);

      // Left pupil
      stroke(eyesColor);
      line(drawX - THREE_PIXELS, drawY - ONE_PIXEL, drawX - TWO_PIXELS, drawY - ONE_PIXEL);
      line(drawX - THREE_PIXELS, drawY, drawX - TWO_PIXELS, drawY);

      // Right eye
      stroke(255);
      line(drawX + THREE_PIXELS, drawY - FOUR_PIXELS, drawX + FOUR_PIXELS, drawY - FOUR_PIXELS);
      line(drawX + TWO_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);
      line(drawX + TWO_PIXELS, drawY - TWO_PIXELS, drawX + FIVE_PIXELS, drawY - TWO_PIXELS);
      line(drawX + TWO_PIXELS, drawY - ONE_PIXEL, drawX + FIVE_PIXELS, drawY - ONE_PIXEL);
      line(drawX + THREE_PIXELS, drawY, drawX + FOUR_PIXELS, drawY);

      // Right pupil
      stroke(eyesColor);
      line(drawX + THREE_PIXELS, drawY - ONE_PIXEL, drawX + FOUR_PIXELS, drawY - ONE_PIXEL);
      line(drawX + THREE_PIXELS, drawY, drawX + FOUR_PIXELS, drawY);
      break;
  }

  // back to default
  strokeWeight(1);
  stroke(0);
}

// It draws a square starting from left-up corner
void drawWallCell(int drawX, int drawY) {
  stroke(255);
  drawSquare(drawX, drawY);
}

// Pixel coordinates
void drawBlackCell(int drawX, int drawY) {
  stroke(0);
  drawSquare(drawX, drawY);
}

void drawBlackSquareRightSideOutsideMaze(int drawX, int drawY) {
  drawCorridorInCellGrid(coordToCell(drawX) + 1, coordToCell(drawY) - 1);
  drawCorridorInCellGrid(coordToCell(drawX) + 1, coordToCell(drawY));
  drawCorridorInCellGrid(coordToCell(drawX) + 1, coordToCell(drawY) + 1);
}

void drawBlackSquareLeftSideOutsideMaze(int drawX, int drawY) {
  drawCorridorInCoord(drawX - CELL_SIZE, drawY - CELL_SIZE);
  drawCorridorInCoord(drawX - CELL_SIZE, drawY);
}

// Grid positions
void drawCorridorInCellGrid(int x, int y) {
  stroke(0);
  drawSquare(cellToCoord(x), cellToCoord(y));
}

void drawCorridorInCoord(int coordX, int coordY) {
  stroke(0);
  drawSquare(coordX, coordY);
}

void drawInvisibleWallInCellGrid(int x, int y) {
  stroke(0);
  drawSquare(cellToCoord(x), cellToCoord(y));
}

/* cuantizeCoord(...) forces to any coordinate to start from left-up corner of a cell inside the grid */
void drawSquare(int drawX, int drawY) {
  /* drawX, drawY are the left-up corner of the square */
  strokeWeight(PIXEL_SIZE);
  strokeCap(PROJECT); // Point appears square.
  for (int pixelY = 0; pixelY < 8; pixelY++) {
    for (int pixelX = 0; pixelX < 8; pixelX++) {
       point(drawX + (PIXEL_SIZE * pixelX), drawY + (PIXEL_SIZE * pixelY));
    }
  }
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  stroke(255);
  strokeWeight(PIXEL_SIZE);
  strokeCap(PROJECT); // Point appears square.
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + THREE_PIXELS);
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FOUR_PIXELS);
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + THREE_PIXELS);
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FOUR_PIXELS);
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPowerPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  stroke(255);
  strokeWeight(PIXEL_SIZE);
  line(cellToCoord(x) + TWO_PIXELS, cellToCoord(y), cellToCoord(x) + FIVE_PIXELS, cellToCoord(y));
  line(cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + ONE_PIXEL, cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + ONE_PIXEL);
  line(cellToCoord(x), cellToCoord(y) + TWO_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + TWO_PIXELS);
  line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + THREE_PIXELS);
  line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FOUR_PIXELS);
  line(cellToCoord(x), cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FIVE_PIXELS);
  line(cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + SIX_PIXELS, cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + SIX_PIXELS);
  line(cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + SEVEN_PIXELS);
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawCreatureCenter(int drawX, int drawY) {
  fill(color(0, 204, 255));
  circle(drawX, drawY, CREATURE_CENTER_SIZE);
}

void drawPos(int x, int y) {
  drawEmptySquare(cellToCoord(x), cellToCoord(y), color(124, 252, 0));
}

void drawTarget(int x, int y, color c) {
  drawEmptySquare(cellToCoord(x), cellToCoord(y), c);
}

void drawTile(int x, int y) {
  drawEmptySquare(cellToCoord(x), cellToCoord(y), color(255, 255, 255));
}

void drawEmptySquare(int drawX, int drawY, color c) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  line(drawX, drawY, drawX + SEVEN_PIXELS, drawY);
  line(drawX, drawY, drawX, drawY + SEVEN_PIXELS);
  line(drawX + SEVEN_PIXELS, drawY, drawX + SEVEN_PIXELS, drawY + SEVEN_PIXELS);
  line(drawX, drawY + SEVEN_PIXELS, drawX + SEVEN_PIXELS, drawY + SEVEN_PIXELS);
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPalletCounter(int x, int y) {
  textFont(f,16);
  fill(255);
  text(nf(pelletCounter, 3), cellToCoord(x), cellToCoord(y+1));
}

void drawCurrentLevel(int x, int y) {
  textFont(f,16);
  fill(255);
  text(nf(CURRENT_LEVEL, 3), cellToCoord(x), cellToCoord(y+1));
}

/* Walls */
void drawBlueWallInCellGrid(int x, int y, int wallId) {
  drawCorridorInCellGrid(x, y);
  stroke(wallColor);
  strokeWeight(PIXEL_SIZE);
  strokeCap(PROJECT); // Point appears square. This is for point() function.
  switch(wallId) {
    case TEST_CELL:
      drawTestCellInCellGrid(x, y);
      break;
    case DOUBLE_WALL_VERTICAL_LEFT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the left side
      // Inside line
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line to 4 "pixels" (base + THREE_PIXELS) from left cell side
      break;
    case DOUBLE_WALL_VERTICAL_RIGHT:
      // Outside line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the right cell side
      // Inside line
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line to 5 "pixels" from right cell side
      break;
    case DOUBLE_WALL_HORIZONTAL_TOP:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y)); // Horizontal line over the top cell side
      // Inside line
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + THREE_PIXELS); // Horizontal line to 4 "pixels" from top cell side
      break;
    case DOUBLE_WALL_HORIZONTAL_BOTTOM:
      // Outside line
      line(cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Horizontal line over the bottom cell side
      // Inside line
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line to 5 "pixels" from top cell side
      break;
    case DOUBLE_CORNER_TOP_LEFT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y)); // Horizontal line over the top cell side
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the left side
      // Inside corner
      doubleCornerTopLeft(x, y);
      break;
    case DOUBLE_CORNER_TOP_RIGHT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y)); // Horizontal line over the top cell side
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the right cell side
      // Inside corner
      doubleCornerTopRight(x, y);
      break;
    case DOUBLE_CORNER_BOTTOM_LEFT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the left side
      line(cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Horizontal line over the bottom cell side
      // Inside corner
      doubleCornerBottomLeft(x, y);
      break;
    case DOUBLE_CORNER_BOTTOM_RIGHT:
      // Outside line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the right cell side
      line(cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Horizontal line over the bottom cell side
      // Inside corner
       doubleCornerBottomRight(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_LEFT:
      // Outside horizontal top line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y)); // Horizontal line over the top cell side
      // Inside corner
      doubleCornerTopLeft(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_RIGHT:
      // Outside horizontal top line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y)); // Horizontal line over the top cell side
      // Inside corner
      doubleCornerTopRight(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_BOTTOM_LEFT:
      // Outside vertical left line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the left side
      // Inside corner
      doubleCornerBottomLeft(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_TOP_LEFT:
      // Outside vertical left line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the left side
      // Inside corner
      doubleCornerTopLeft(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_BOTTOM_RIGHT:
      // Outside vertical right line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the right cell side
      // Inside corner
      doubleCornerBottomRight(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_TOP_RIGHT:
      // Outside vertical right line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line over the right cell side
      // Inside corner
      doubleCornerTopRight(x, y);
      break;
    case SIMPLE_WALL_VERTICAL_LEFT:
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line to 4 "pixels" from left cell side
      break;
    case SIMPLE_WALL_VERTICAL_RIGHT:
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line to 5 "pixels" from right cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_TOP:
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + THREE_PIXELS); // Horizontal line to 4 "pixels" from top cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_BOTTOM:
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line to 5 "pixels" from top cell side
      break;
    case SIMPLE_CORNER_TOP_LEFT:
      line(cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      point(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + FIVE_PIXELS); // Point between lines
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + SIX_PIXELS, cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line
      break;
    case SIMPLE_CORNER_TOP_RIGHT:
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      point(cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + FIVE_PIXELS); // Point between lines
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + SIX_PIXELS, cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line
      break;
    case SIMPLE_CORNER_BOTTOM_LEFT:
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + ONE_PIXEL); // Horizontal line
      point(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + TWO_PIXELS); // Point between lines
      line(cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + THREE_PIXELS); // Vertical line
      break;
    case SIMPLE_CORNER_BOTTOM_RIGHT:
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + ONE_PIXEL); // Horizontal line
      point(cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + TWO_PIXELS); // Point between lines
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + THREE_PIXELS); // Vertical line
      break;
    case SIMPLE_CONVEX_CORNER_TOP_LEFT:
      doubleCornerTopLeft(x, y);
      break;
    case SIMPLE_CONVEX_CORNER_TOP_RIGHT:
      doubleCornerTopRight(x, y);
      break;
    case SIMPLE_CONVEX_CORNER_BOTTOM_LEFT:
      doubleCornerBottomLeft(x, y);
      break;
    case SIMPLE_CONVEX_CORNER_BOTTOM_RIGHT:
      doubleCornerBottomRight(x, y);
      break;
  }
  // back to default
  strokeWeight(1);
  stroke(0);
}

void doubleCornerBottomLeft(int x, int y) {
  line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
  line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
}

void doubleCornerTopLeft(int x, int y) {
  line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + THREE_PIXELS); // Horizontal line
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
  line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line
}

void doubleCornerBottomRight(int x, int y) {
  line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
  line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
}

void doubleCornerTopRight(int x, int y) {
  line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + THREE_PIXELS); // Horizontal line
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
  line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + SEVEN_PIXELS); // Vertical line
}


void drawTestCellInCellGrid(int x, int y) {
  for (int pixelY = 0; pixelY < 8; pixelY++) {
    for (int pixelX = 0; pixelX < 8; pixelX++) {
       stroke(color(random(200), random(200), random(200)));
       point(cellToCoord(x) + (PIXEL_SIZE * pixelX), cellToCoord(y) + (PIXEL_SIZE * pixelY));
    }
  }
  // back to wall color
  stroke(wallColor);
}

void drawTestCellInCoord(int coordX, int coordY) {
  for (int pixelY = 0; pixelY < 8; pixelY++) {
    for (int pixelX = 0; pixelX < 8; pixelX++) {
       stroke(color(random(200), random(200), random(200)));
       point(coordX + (PIXEL_SIZE * pixelX), coordY + (PIXEL_SIZE * pixelY));
    }
  }
  // back to wall color
  stroke(wallColor);
}
