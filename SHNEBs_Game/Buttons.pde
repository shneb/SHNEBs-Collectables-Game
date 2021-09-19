class button{ // class buttons loads buttons and sets the values of x , y, 
              //height of the image and width of the image
  float x;
  float y;
  int w;
  int h;
  String button;
  PImage currentButton;
  
  button(float x , float y, String button){
    this.x=x;
    this.y=y;
    this.button= button;
    
  }

  void render(){
    
    PImage currentButton = loadImage(button+".png");
    this.w= currentButton.width;
    this.h= currentButton.height;
    imageMode(CORNERS);
    image(currentButton, x, y);

  }
}
