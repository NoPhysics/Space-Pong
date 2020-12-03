class Enemy{
  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  float gravity = 0;
  float maxSpeed = 20;
  
  Enemy(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
  }
  
  Enemy(float tempX, float tempY, float tempW, float tempH, float grav, float max) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
    gravity = grav;
    maxSpeed = max;
  }
  
  //Movimiento automatico
  void moveEnemy(Ball pBall)
{
  float easing = abs(pBall.y) * 0.1;
  float targetY = pBall.y;
  if( targetY <= 0)
  {
    targetY = 15;
  }
  else if (targetY == height)
  {
    targetY = pBall.y-height/2;
  }
  y += (targetY-y)/ easing;
}

  void display(){
    fill(c);
    rect(x-w/2,y-h/2,w,h);
  } 
  
  //helper functions
  float left(){
    return x-w/2;
  }
  float right(){
    return x+w/2;
  }
  float top(){
    return y-h/2;
  }
  float bottom(){
    return y+h/2;
  }
}
