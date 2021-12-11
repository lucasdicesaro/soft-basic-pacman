
final int ASCII_0 = 48;

class MapFile { 
  String[] lines;
  
  MapFile () {  
    lines = loadStrings("map_1.txt");
  }
  
  TileGrid fillGrid() {
    TileGrid tileGrid = new TileGrid();
    String[] lines = getLines();
    for (int y = 0 ; y < lines.length && y < MAX_ROWS; y++) {
      String[] asciiCharacters = lines[y].split(",");
      for (int x = 0 ; x < asciiCharacters.length && x < MAX_COLS; x++) {
        tileGrid.setTileValue(x, y, asciiToNumber(asciiCharacters[x]));
      }
    }
    return tileGrid;
  }
  
  void debug() {
    println("File content:");
    println("there are " + lines.length + " lines");
    for (int y = 0 ; y < lines.length && y < MAX_ROWS; y++) {
      for (int x = 0 ; x < lines[y].length() && x < MAX_COLS; x++) {
        print(lines[y].charAt(x));
      }
      println("");
    }
  }
  
  int asciiToNumber(String asciiCharacters) {
    return Integer.parseInt(asciiCharacters);
  }

  String[] getLines() {
    return lines;
  }
} 
