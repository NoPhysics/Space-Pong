Ball ball; // Global Ball
Rocket player; // Player
Enemy enemy;// Enemy
int devolutions;

void setup(){
  size(800,600);
  ball = new Ball(width/2, height/2, 50); //create a new ball
  ball.speedX = 5; // Giving the ball speed in x-axis
  ball.speedY = random(-3,3); // Giving the ball speed in y-axis
  player = new Rocket(15, (height/2)+30, 30, 100, 0.5, 24);
  enemy=new Enemy(width-15, (height/2)+30, 30, 100, 0.5, 24);
  devolutions = 0;
}

void draw(){
  background(0); // Clear the window
  ball.move(); //calculate a new location for the ball
  ball.display(); // Draw the ball to the window
  borderCol();
  player.move();
  player.display();
  enemy.moveEnemy(ball);
  enemy.display();
  text("Speed: " + player.speedY,100,100); 
  text("Devolutions: " +devolutions,100,200);
}

void keyPressed() {
  if(keyCode == UP) {
    if(player.y>player.h/2){
      if(player.speedY - 12 > -player.maxSpeed && player.y+player.h/2 > 0){
        player.speedY += -12;
      }
    }
  }
  if(key == DOWN){
    if(player.y>player.h/2){
      if(player.speedY - 12 > -player.maxSpeed){
        player.speedY += -12;
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
  
  if(ball.left() < player.x && (abs(ball.y - player.y) <= player.h) && ball.speedX < 0) {
    ball.speedX = -ball.speedX;
    devolutions++;
  }
  
}
