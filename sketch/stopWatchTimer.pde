
// Source https://forum.processing.org/one/topic/timer-in-processing.html
// Thanks to Chrisir
class StopWatchTimer {
  int startTime = 0, stopTime = 0;
  boolean running = false; 
  boolean pause = false; 
  int puasedMillis = 0; 
  void start() {
    startTime = millis();
    running = true;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  void restart() {
    stop();
    start();
  }
  void pause() {
    if (!pause) {
      puasedMillis = millis();
      pause = true;
    }
  }
  void resume() {
    if (pause) {
      startTime = puasedMillis;
      pause = false;
    } else {
      start();
    }
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
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
