class gold {
  final int numFrames = 9;  // The number of frames in the animation
  int currentFrame;
  PImage[] img = new PImage[numFrames];
  int x, y, speed, h, w;
  int scoreValue;
  int  healthValue;
  
  gold(int x, int y, int  scoreValue, int  healthValue) {
    
    this.x=x;
    this.y=y;
    this.scoreValue=scoreValue;
    this.healthValue=healthValue;
    
    for (int i = 0; i < numFrames; i++) {
      String imageName = "c" + nf(i, 2) + ".png";
      img[i] = loadImage(imageName);
      h= img[i].height;
      w = img[i].width;
    } 
  }
  void render() {

    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    imageMode(CENTER); 
    image(img[(currentFrame)/3], this.x, this.y);
  }
}
