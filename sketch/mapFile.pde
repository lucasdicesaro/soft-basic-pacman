
class MapFile { 
  String[] lines;
  
  MapFile (int level) {
    lines = loadStrings("maps/" + level + "/map.txt");
  }
  
  TileGrid fillGrid() {
    TileGrid tileGrid = new TileGrid();
    String[] lines = getLines();
    for (int y = 0 ; y < lines.length && y < MAX_ROWS; y++) {
      String[] asciiCharacters = lines[y].split(",");
      for (int x = 0 ; x < asciiCharacters.length && x < MAX_COLS; x++) {
        tileGrid.setTileValue(x, y, Integer.parseInt(asciiCharacters[x]));
      }
    }
    return tileGrid;
  }
  
  void debug() {
    println("File content:");
    println("there are " + lines.length + " lines");
    for (int y = 0 ; y < lines.length && y < MAX_ROWS; y++) {
      String[] asciiCharacters = lines[y].split(",");
      for (int x = 0 ; x < asciiCharacters.length && x < MAX_COLS; x++) {
        print(asciiCharacters[x] + " ");
      }
      println("");
    }
  }

  String[] getLines() {
    return lines;
  }
} 
