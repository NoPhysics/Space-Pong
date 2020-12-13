class Ball_Ballistic implements Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  float grav;
  
  // Constructor
  Ball_Ballistic(float tempX, float tempY, float tempDiameter, color tempC) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = -15;
    c = tempC;
    grav = 0.05;
  }
  
  void move() {
    // Add speed to location
    speedY = speedY + grav;
    x = x + speedX;
    y = y + speedY;
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
