class Ball_Straight implements Ball{
  float x;
  float y;
  float speedX;
  float diameter;
  color c;
  
  // Constructor
  Ball_Straight(float tempX, float tempY, float tempDiameter, color tempC) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = -2;
    c = tempC; 
  }
  
  void move() {
    // Add speed to location
    x = x + speedX;
  }
  
  void display() {
    fill(c); //set the drawing color
    ellipse(x,y,diameter,diameter); //draw a circle
  }
  
  //helper functions
  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  
 float top() {
   return y-diameter/2;
 }
 float bottom() {
   return y+diameter/2; 
 }
}
