ArrayList<Ball> balls; // Global Balls
Rocket player; // Player
Enemy enemy;// Enemy
Ball temp;
ball_factory factory; // Ball factory
int devolutions;
int speedAccumulation;
int time = millis();
int score;
int life;
Lifes [] lifes;
Lifes life1;
Lifes life2;
Lifes life3;
boolean gameOver;

void setup(){
  fullScreen();
  player = new Rocket(80, (height/2)+30, 60, 175, 0.5, 24);
  balls = new ArrayList<Ball>();
  enemy=new Enemy(width-80, 100, 30, 100, 0.5, 24);
  devolutions = 0;
  speedAccumulation = 0;
  gameOver = false;
  factory = new ball_factory();
  lifes=new Lifes[3];
  life1=new Lifes((width/2+20),200);
  life2=new Lifes((width/2+60),200);
  life3= new Lifes((width/2+100),200);
  lifes [0]= life1;
  lifes [1]= life2;
  lifes [2]= life3;
  life=lifes.length;
  textSize(40);
  
  
}

void draw(){
  if(gameOver) {
      clear();
      text("GAME OVER. Your final score is " + score,width/2-20,height/2-20); 
  
  } else {
      if (millis() > time + 2000)
      {
        balls.add(factory.randomShoot(enemy.x, enemy.y));
        time = millis();
        score += 100;
      }
      background(0); // Clear the window
      for (int i = balls.size()-1; i >= 0; i--) { 
        // An ArrayList doesn't know what it is storing so we have to cast the object coming out
        Ball ball = balls.get(i);
        if(ball.move()) {
          balls.remove(i);
        }
        // change to actual game over when its time
        if(ball.collision(player.x, player.y, player.w, player.h)) {
          life--;
          lifes[life].setimage();
          if (life <= 0) gameOver = true; 
          balls.remove(i);
        }
        ball.display();
      }  
      player.move();
      player.display();
      enemy.moveEnemy();
      enemy.display();
      for(int i=0; i<lifes.length;i++){
        lifes[i].display();
      }
      text("Score: " + score,width/2-20,100); 
      
  }
}

void keyPressed() {
  if(keyCode == UP) {
    player.speedY = 0;
    if(player.y == 0) return; 
    if(player.y>player.h/2){
      if(player.speedY - 6 > -player.maxSpeed && player.y+player.h/2 > 0){
        player.speedY += -6;
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

//void borderCol() {
//  if (ball.right() > width) { //if stuff between () is true, execute code between {}
//    ball.speedX = -ball.speedX;
//  }
//   if (ball.left() < 0) {
//    ball.speedX = -ball.speedX;
//  }

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
