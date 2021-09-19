public int score;
public int highScore;
public int health = 100;
public boolean moving;

class player { 
  int x, y;
  int h, w;
  int speed;
  public boolean moving = false; // player class where it loads the character movement, the health and the score.
  final int numFrames = 7;
  int currentFrame ;
  PImage[] img = new PImage[numFrames];
  PImage[] hue = new PImage[5]; // hue is for when the player crashes with a coin it shows golden hue around the player
  private String healthImg;

  player(int x, int y, int speed) {//player constractor 
    this.x = x;
    this.y = y;
    this.speed = speed;

    for (int i = 0; i < 5; i++) {
      String imageName = "hue" + i + ".png";
      hue[i] = loadImage(imageName);
      println(imageName);
    }
    for (int i = 0; i < numFrames; i++) {
      String imageName = "s" + nf(i, 2) + ".png";
      img[i] = loadImage(imageName);
      h = img[i].height;
      w = img[i].width;
      //println(imageName);
    }
  }

  void update() {

    render();
    move();
    health();
    drawHealth();
  }
  void render() {  

    if (!moving) {
      imageMode(CENTER); 
      image(img[4], x, y);
    } else {
      currentFrame = (currentFrame+1 )% numFrames;  // Use % to cycle through frames

      imageMode(CENTER);

      image(img[currentFrame % numFrames], x, y);
    }
  } 
  void move() {

    if (keyPressed==true && key == CODED) {

      moving= true;
      //println(keyCode);

      if (keyCode==LEFT && x>=80) { 
        x= x - speed;
      } 
      if (keyCode==RIGHT && x<=width-80) { 
        x = x +speed;
      } 
      if (keyCode==UP && y>=80) { 
        y = y - speed;
      } 
      if (keyCode==DOWN && y <=height-80) { 
        y = y + speed;
      }
    }
  }
  void drawHue() {
    imageMode(CENTER); 
    image(hue[currentFrame % 5], x, y);
  }
  void health() {
    println(health);
    switch(health) {
    case 100:
      healthImg = "health4";
      break;
    case 75:
      healthImg = "health3";
      break;
    case 50:
      healthImg = "health2";
      break;
    case 25:
      healthImg = "health1";
      break;
    case 0:
      healthImg = "health0";
      gameMode = 2;
      break;
    }
  }
  void drawHealth() {

    PImage currentHealth = loadImage(healthImg +".png");
    imageMode(CENTER);
    image(currentHealth, width/2, (currentHealth.width/2));
    println(currentHealth);
  }
  boolean crash(gold gold) {
    return abs(this.x - gold.x) < w/2 && abs(this.y - gold.y) < h/2;
  }//crash
  boolean crash(bat bat) {
    return abs(this.x - bat.x) < 50 && abs(this.y - bat.y) < 50;
  }//crash
}
