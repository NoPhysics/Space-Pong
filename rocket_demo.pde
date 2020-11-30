Ball ball; // Global Ball
Rocket player; // Player


void setup(){
  size(800,600);
  ball = new Ball(width/2, height/2, 50); //create a new ball
  ball.speedX = 5; // Giving the ball speed in x-axis
  ball.speedY = random(-3,3); // Giving the ball speed in y-axis
  player = new Rocket(15, height/2, 30, 100, 0.5, 10);

}

void draw(){
  background(0); // Clear the window
  ball.move(); //calculate a new location for the ball
  ball.display(); // Draw the ball to the window
  borderCol();
  player.move();
  player.display();
  text(player.speedY,100,100);
}

void keyPressed() {
  if(keyCode == UP) {
    if(player.y>player.h/2){
      if(player.speedY - 4 > -player.maxSpeed){
        player.speedY += -4;
      }
    }
  }
  if(key == 'w'){
    if(player.y>player.h/2){
      if(player.speedY - 4 > -player.maxSpeed){
        player.speedY += -4;
      }
    }
  }
}

void borderCol() {
  if (ball.right() > width) { //if stuff between () is true, execute code between {}
    ball.speedX = -ball.speedX;
  }
   if (ball.left() < 0) {
    ball.speedX = -ball.speedX;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
}
