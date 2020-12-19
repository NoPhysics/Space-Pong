class Lifes{
  float x;
  float y;
  float w;
  float h;
  
  Lifes(float tempX, float tempY){
    x = tempX;
    y = tempY;
  
  }
void display(){

    PImage img =loadImage("vida.png");
    imageMode(CENTER);
    image(img,x,y,50,50);
  
}

void setimage(){
    PImage img =loadImage("muerte.png");
    imageMode(CENTER);
    image(img,x,y,50,50);
}



}
  
