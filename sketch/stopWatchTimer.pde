
// Source https://forum.processing.org/one/topic/timer-in-processing.html
// Thanks to Chrisir
class StopWatchTimer {
  int startTime = 0, stopTime = 0;
  int startPausedTime = 0, totalPausedTime = 0;
  boolean running = false; 
  boolean pause = false; 
  void start() {
    startTime = millis();
    running = true;
    startPausedTime = 0;
    totalPausedTime = 0;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  void pause() {
    if (!pause) {
      startPausedTime = millis();
      pause = true;
    }
  }
  void resume() {
    if (pause) {
      totalPausedTime += millis() - startPausedTime;
      pause = false;
    }
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime - totalPausedTime);
    }
    else {
      elapsed = (stopTime - startTime - totalPausedTime);
    }
    return elapsed;
  }
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
  int hour() {
    return (getElapsedTime() / (1000*60*60)) % 24;
  }
}
