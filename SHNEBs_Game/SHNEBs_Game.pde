import processing.sound.*;    //importing processing sound library
SoundFile music, enemyHits, collected, buttonClick, nextLevel; 
player player; //declaring classes
bat bat;
gold gold;
bg background;
button[] button;

ArrayList<bat> batList = new ArrayList(); //array list for the enemy bat
ArrayList<gold> goldList = new ArrayList(); //array list for the colloctables money and coins

 private int gameMode; //globle varibles
 int numCoins;
 int numBats;
 int numMoney;

void setup() {
  size(960, 720); 
  frameRate(60);
  smooth();
  reset(); //reset is for when plaAgain button pressed it can go back to these values
}

void reset() {

  numCoins = 21;
  numBats = 5;
  numMoney = 5;

  background = new bg();
  player = new player(60, 80,10);
  
  declarButtons(); 
  declarLists();
  sounds();
}

void draw() {
  switch(gameMode) {  // game Mode used for moving between splash screens inro , outro and game play
  case 0:
    background.introScreen();   // game mode 0 is for the start splash screen
    break;
  case 1:  // game mode 2 is for the game play
    level1();
    break;
  case 2:   //game mode 1 is for the outro screen
    level2(); 
    break;
  case 3:
    background.nextLevel();
    break;
  case 4: 
    background.outroScreen();
    break;
  }
}
void level1() {

  gamePlay();
  if (score >= 3 && time >= 0) {
    gameMode= 3;
        nextLevel.play();
  } else if (time <= 0 ) {
    gameMode =4;
  }
}
void level2() {
  gamePlay();
  if (time <= 0 || health  <=0 || goldList.size()<= 0) {
    gameMode = 4;
  }
}
void gamePlay() {

  background.update(); 
  player.update();
  collision();
}
void collision() {  // renders objects

  for (int i = 0; i <batList.size(); i++) {
    bat part = batList.get(i);
    part.update();
    if (player.crash(part)) {
      batList.remove(i);
      health-=25;
      enemyHits.play();
    }
  }
  for (int i = goldList.size() - 1; i >= 0; i--) {
    gold part = goldList.get(i);
    part.render();
    if (player.crash(part)) {
      goldList.remove(i);
      score += part.scoreValue ;
      if (health != 100) {
        health += part.healthValue;
      }
      player.drawHue();
      collected.play();
    }
  }
}
void declarLists() {  // here we add objects to the array list

  for (int i =0; i<numBats; i++) {
    batList.add( new bat(floor(random(40, width-50)), floor(random(30, height-50)), 3));
  }
  for (int i =0; i<numCoins; i++) { 
    goldList.add( new gold(floor(random(40, width-50)), floor(random(50, height-50)), 1, 0));
  }
  for (int i =0; i<numMoney; i++) { //money is inherted class from the gold class and used Polymorphism
    goldList.add( new money(floor(random(40, width-50)), floor(random(50, height-50)), 2, 0));
  }
  for (int i =0; i<3; i++) { //money is inherted class from the gold class and used Polymorphism
    goldList.add( new healthPotion(floor(random(40, width-50)), floor(random(50, height-50)), 0, 25));
  }
}
void declarButtons() { //here the buttons added and placed

  button = new button[5];
  button[0] = new button((width/3), (height/3)+150, "playButton");
  button[1] = new button((width/2.4), (height/3)+300, "ExitButton");
  button[2] = new button((width/3.5), (height/3)+200, "PAButton");
  button[3] = new button((width/2.4), (height/3)+350, "ExitButton");
  button[4] = new button((width/3.5), (height/3)+200, "NLButton");
}
void sounds() { //here where sounds loaded

  music = new SoundFile(this, "music.wav");
  collected = new SoundFile(this, "coin.wav");
  enemyHits = new SoundFile(this, "EnemyHits.wav");
  buttonClick = new SoundFile(this, "ButtonClick.wav");
  nextLevel = new SoundFile(this, "NextLevel.wav");
}
void mousePressed() { // mousePressed for the buttons

  if (mouseX>button[0].x && mouseX <(button[0].x+button[0].w) && mouseY>button[0].y && mouseY <(button[0].y+button[0].h) && gameMode == 0  ) {
    gameMode = 1;
    buttonClick.play();

  }
  if (mouseX>button[1].x && mouseX <(button[1].x+button[1].w) && mouseY>button[1].y && mouseY <(button[1].y+button[1].h) && gameMode == 0 ) {
    exit();
    buttonClick.play();
  }
  if (mouseX>button[2].x && mouseX <(button[2].x+button[2].w) && mouseY>button[2].y && mouseY <(button[2].y+button[2].h) && gameMode == 4 ) {
    buttonClick.play();
    reset();
    score = 0;
    gameMode = 1;
    health = 100;
    time = 10;
    for (int i = 0; i<goldList.size(); i++ ) {
      goldList.remove(i);
    }
    for (int i =0; i<batList.size(); i++ ) {
      batList.remove(i);
    }
  }
  if (mouseX>button[4].x && mouseX <(button[4].x+button[4].w) && mouseY>button[4].y && mouseY <(button[4].y+button[4].h) && gameMode == 3 ) {
    buttonClick.play();
    gameMode = 2;
    reset();
    time = 10;
    health = 100;
    for (int i = 0; i<goldList.size(); i++ ) {
      goldList.remove(i);
    }
    for (int i = 0; i<batList.size(); i++ ) {
      batList.remove(i);
    }
  }

  if (mouseX>button[3].x && mouseX <(button[3].x+button[3].w) && mouseY>button[3].y && mouseY <(button[3].y+button[3].h) && gameMode ==4) {
    exit();
    buttonClick.play();
  }
}
void keyReleased() { //this for when the key released stops the player charcter from moving
  moving = false;
}
