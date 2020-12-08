Ball ball; // Global Ball
Rocket player; // Player
Enemy enemy;// Enemy
int devolutions;
int speedAccumulation;

void setup(){
  fullScreen();
  ball = new Ball(width/2, height/2, 50); //create a new ball
  ball.speedX = 5; // Giving the ball speed in x-axis
  ball.speedY = random(-3,3); // Giving the ball speed in y-axis
  player = new Rocket(15, (height/2)+30, 60, 175, 0.5, 24);
  enemy=new Enemy(width-15, (height/2)+30, 30, 100, 0.5, 24);
  devolutions = 0;
  speedAccumulation = 0;
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
    if(player.y == 0) return; 
    if(player.y>player.h/2){
      if(player.speedY - 4 > -player.maxSpeed && player.y+player.h/2 > 0){
        player.speedY += -4;
      }
    }
  }
  if(keyCode == DOWN){
    if(player.y>player.h/2){
      if(player.speedY + 4 > 0){
        player.speedY -= -4;
      }
    }
  }
}

void keyReleased() {
   speedAccumulation = 0; 
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
