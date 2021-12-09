
class Keyboard {

  int userKeyPressed;

  Keyboard () {  
    releaseUserKey();
  }

  boolean isValidMovementKey() {
     return key == CODED && (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN);
  }
  
  void releaseUserKey() {
    userKeyPressed = -1;
  }
  
  boolean isUserKeyReleased() {
    return userKeyPressed == -1;
  }

  void setUserKeyPressed() {
    if (keyCode == userKeyPressed) {
      return;
    }
    releaseUserKey();
    if (isValidMovementKey()) {
      this.userKeyPressed = keyCode;
    }
  }

  int getUserKeyPressed() {
    return userKeyPressed;
  }
}
