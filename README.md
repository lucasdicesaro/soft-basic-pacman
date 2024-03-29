# Yet another Pacman...

### Power pills

![](gifs/power-pill.gif)
![](gifs/eaten.gif)

### Ghosts targets and routes (press 't' or 'r'. Please, see the key list below)

![](gifs/ghosts-routes.gif)
![](gifs/scatter-mode.gif)

### The <a href="https://www.youtube.com/watch?v=4Wvp0q64Q08" target="_blank">ghosts loop</a>

![](gifs/known-loop.gif)


## Instructions

![Screenshot1](sketch/demo/demo1.png)

1. Download <a href="https://github.com/lucasdicesaro/soft-basic-pacman/archive/refs/heads/main.zip" target="_blank">this code</a> and unzip it.
2. Download <a href="https://processing.org/download" target="_blank">Processing</a> and unzip it (<a href="https://www.youtube.com/watch?v=cVyy5EUVt4g" target="_blank">See how to download and install Processing</a>)
3. Once Processing is installed and open, select `File` from the menu and find the `sketch.pde` file in the `sketch` folder downloaded in step 1.
4. Once you've opened the file, select Run (play button)
5. Enjoy!

Note: If you want a Pac-Man with sound, please checkout <a href="https://github.com/lucasdicesaro/soft-basic-pacman/tree/pacman_with_sound" target="_blank">this branch</a>.

![Screenshot2](sketch/demo/demo2.png)

## <a href="https://github.com/lucasdicesaro/soft-basic-pacman/blob/main/sketch/sketch.pde#L52" target="_blank">Keys</a>

### Pacman keys

Pacman movement: keyboard arrow keys.


### Debug keys

- p - Position: Shows the current tile for each character.
- t - Target: Shows ghost targets
- r - Route: Shows ghost routes
- g - Grid: Shows screen grid
- d - Debug: Shows frame by frame on key-press
- c - Chase: Forces the chase mode.
- s - Scatter: Forces the scatter mode.
- f - Frightened: Forces the Frightened mode.
- q - Quit.


## Credits

 Special thanks to Chad Birch and Jamey Pittman for sharing your investigations:
 - Chad Birch's article <a href="https://gameinternals.com/understanding-pac-man-ghost-behavior" target="_blank">Understanding Pac-Man Ghost Behavior</a> and 
 - Jamey Pittman's article <a href="https://www.gamedeveloper.com/design/the-pac-man-dossier" target="_blank">The Pac-Man Dossier</a>


![Screenshot3](sketch/demo/demo3.png) 

## Backlog

- ~~Add timer for power pellet effect~~
- ~~Work on characters and maze design~~
- ~~Handle individual ghosts speed (eg. under power pellet effect ghosts should slow)~~
- ~~Revert to normal ghosts speed when power pellet effect finishes~~
- ~~Complete the level when Pacman eats all pellets~~
- ~~Add timer for mode changes~~
- ~~Count pellets on maze building~~
- ~~Add Up movement restriction for ghosts on the 4 special cells~~
- ~~Connect the teleport tunnel~~
- ~~Slow down ghosts speed when they walk through teleport tunnel~~
- ~~Increasing speed, decreasing mode times, infinite levels~~
- Limit Pacman lives
- Blinking ghosts when power pill effect finishes
- Add timer for ghost go out from its home
- Pacman animation when he is eaten
- Ghost animation when it enters to ghosts house
- Grid animation when level completes
- Fruit
- Sound
