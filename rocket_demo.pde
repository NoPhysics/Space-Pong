ArrayList<Ball> balls; // Global Balls
Rocket player; // Player
Enemy enemy;// Enemy
Ball temp;
ball_factory factory; // Ball factory
int devolutions;
int speedAccumulation;
int time = millis();

void setup(){
  fullScreen();
  ball = new Ball(width/2, height/2, 50); //create a new ball
  ball.speedX = 5; // Giving the ball speed in x-axis
  ball.speedY = random(-3,3); // Giving the ball speed in y-axis
  player = new Rocket(15, (height/2)+30, 60, 175, 0.5, 24);
  balls = new ArrayList<Ball>();
  enemy=new Enemy(width-15, (height/2)+30, 30, 100, 0.5, 24);
  devolutions = 0;
  speedAccumulation = 0;
}

void draw(){
   if (millis() > time + 2000)
  {
    balls.add(factory.randomShoot(enemy.x, enemy.y));
    time = millis();
  }
  background(0); // Clear the window
  for (Ball i: balls) {
    i.move();
    i.display(); 
    print(i,"Balls");
  }
  for (int i = balls.size()-1; i >= 0; i--) { 
    print(i);
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    print(ball);
    ball.move();
    ball.display();
  }  
  balli.move();
  balli.display();
  player.move();
  player.display();
  enemy.moveEnemy(temp);
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

//  if (ball.bottom() > height) {
//    ball.speedY = -ball.speedY;
//  }

//  if (ball.top() < 0) {
//    ball.speedY = -ball.speedY;
//  }
  
//  if(ball.left() < player.x && (abs(ball.y - player.y) <= player.h) && ball.speedX < 0) {
//    ball.speedX = -ball.speedX;
//    devolutions++;
//  }
  
