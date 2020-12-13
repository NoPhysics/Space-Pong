interface Ball {
  float x = 50;
  float y = 50;
  float speedX = -2;
  float speedY = -2;
  float diameter = 2;
  
  void move();
  
  void display();
  //helper functions
  float left();
  float right();
  float top();
  float bottom();

}
