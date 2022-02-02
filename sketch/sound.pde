import processing.sound.*;

class Sound {

  SoundFile gameStart;
  SoundFile siren;
  SoundFile munch1;
  SoundFile munch2;
  SoundFile eatGhost;
  SoundFile pacDeath;
  SoundFile eyes;
  SoundFile powerPellet;
  boolean sirenPlaying;
  boolean powerPelletPlaying;
  boolean eyesPlaying;

  Sound () {
    gameStart = getSoundFile("game_start.wav");
    siren = getSoundFile("siren.mp3");
    powerPellet = getSoundFile("power_pellet.wav");
    munch1 = getSoundFile("munch_1.wav");
    munch2 = getSoundFile("munch_2.wav");
    eatGhost = getSoundFile("eat_ghost.wav");
    pacDeath = getSoundFile("pac_death.wav");
    eyes = getSoundFile("eyes.mp3");
    sirenPlaying = false;
    powerPelletPlaying = false;
    eyesPlaying = false;
  }

  void playGameStart() {
    gameStart.play();
  }

  void playEatGhost() {
    eatGhost.play();
  }

  void playPacDeath() {
    stopAll();
    pacDeath.play();
  }
 
  void playMunch() {
    if (pelletCounter % 2 == 0) munch1.play(); else munch2.play();
  }

  void playPowerPellet() {
    siren.stop();
    powerPellet.loop();
    sirenPlaying = false;
    powerPelletPlaying = true;
  }

  void playSiren() {
    powerPellet.stop();
    siren.loop();
    sirenPlaying = true;
    powerPelletPlaying = false;
  }

  void stopAll() {
    siren.stop();
    powerPellet.stop();
    eyes.stop();
    sirenPlaying = false;
    powerPelletPlaying = false;
    eyesPlaying = false;
  }

  void playEyes() {
    powerPellet.stop(); 
    // We don't set powerPelletPlaying = false; 
    // We need to know if 'powerPellet' sound was playing before 'eyes' starts.
    eyes.loop();
    eyesPlaying = true;
  }

  void stopEyes() {
    eyes.stop();
    eyesPlaying = false;
  }

  boolean isSirenPlaying() {
    return sirenPlaying;
  }

  boolean isPowerPelletPlaying() {
    return powerPelletPlaying;
  }

  boolean isEyesPlaying() {
    return eyesPlaying;
  }

  void debug() {
    println("sirenPlaying: " + sirenPlaying + " powerPelletPlaying: " + powerPelletPlaying + " eyesPlaying: " + eyesPlaying);
  }
}
