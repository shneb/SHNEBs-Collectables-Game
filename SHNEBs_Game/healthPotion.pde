class healthPotion extends gold{
 
  healthPotion(int x, int y,int  scoreValue, int  healthValue) {
    super(x, y, scoreValue, healthValue);
    
  }
  void render() {
    
    PImage[] img1 = new PImage[8];
    
    for (int i = 0; i < 8; i++) {
      String imageName = "HP" + i + ".png";
      img1[i] = loadImage(imageName);
      h= img1[i].height;
      w = img1[i].width;
    }

    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    imageMode(CENTER); 
    image(img1[(currentFrame)/3], this.x, this.y);
  }
}
