class bat {
  final int numFrames = 4;  // The number of frames in the animation
  int currentFrame;
  PImage[] img = new PImage[numFrames];
  float x, y;
  float directiony = 3, directionx = 3;

  bat(float x, float y, float speed) {
    this.x=x;
    this.y=y;
    
    for (int i = 0; i < numFrames; i++) {
      String imageName = "bat" + i + ".png";
      img[i] = loadImage(imageName);
      //println(imageName);
    }
  }
  void update() {
    
    render();
    moveBat();
  }
  void render() { 
    
    currentFrame = (currentFrame+1 ) % numFrames;  // Use % to cycle through frames
    imageMode(CENTER); 
    image(img[(currentFrame)% numFrames], x, y);
  }
  void moveBat() { // bat movement

    x += directionx;
    y += directiony ;

    if (x>= width || x<=0) {
      directionx = -directionx;
    }
    if (y >= height || y<=0) {
      directiony = -directiony;
    }
  }
}
