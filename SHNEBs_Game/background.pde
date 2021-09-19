public float time = 10;

class bg {
  PImage bg1 = loadImage("MazeBG.png");

  color textColor = color(255, 255, 255, 255);
  int textSize = 28;
  PImage splashScreen = loadImage("SplashScreen.png");
  PFont pixelFont = createFont ("EarlyGameBoy.ttf", 32);

  bg() {
  }
  
  void update() {

    render();
    timer();
    drawScore();
    highScore();
  }
  void render() {

    imageMode(CORNERS); 
    image(bg1, 0, 0);
  }  
  void timer() {

    time -= 0.016;
    fill(textColor);
    textAlign(CENTER);
    textFont(pixelFont, textSize);
    text("time:" + floor(time), 100, 40);
  }
  void drawScore() {

    fill(textColor);
    textFont(pixelFont, textSize);
    textAlign(CENTER);
    text(score, width-30, 40);
  }
  void highScore() {

    if (score >= highScore) {
      highScore = score;
    }
  }
  void introScreen() {

    imageMode(CORNERS); 
    image(splashScreen, 0, 0);
    button[0].render();
    button[1].render();
  }
  void nextLevel() {

    imageMode(CORNERS); 
    image(splashScreen, 0, 0);
    button[4].render();
    textAlign(CENTER);
    text("Your score is:" + score, width/2, height/2);
  }
  void outroScreen() {

    imageMode(CORNERS); 
    image(splashScreen, 0, 0);
    fill(255);
    textFont(pixelFont, textSize);
    textAlign(CENTER);
    text("Your score is:" + score, width/2, height/2);

    fill(252, 186, 3);
    text("The highest Score:" + highScore, width/2, (height/3)+175);
    button[2].render();
    button[3].render();
  }
}
