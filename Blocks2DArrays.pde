/** THE FOLLOWING GAME WAS MADE BY A HIGH SCHOOL TEACHER!!!
  * 
  * Breakout game in Processing (Java)
  * Date: 11/21/2019
  * @Author: Allen Thoe
  * @Clases Defined:  Block, Paddle, Ball, Score
  * @Param:  w = width desired for blocks, numRows
  *
  */

Block[][] blocks;
Paddle paddle;
Ball ball;
Score score;
int numBlocks, numRows, w, blockWidth, blockHeight, row, gameState;


void setup(){
  size(1000, 800);
  w = 100;
  numRows = 10;  
  createBlocks();
  paddle = new Paddle();
  ball = new Ball();
  score = new Score();
}


void draw(){
  if(gameState == 0){
    startGame();
  }
}

void createBlocks(){

  numBlocks = width/w;
  blockWidth = width/numBlocks;
  blockHeight = 20;    
  blocks = new Block[numRows][numBlocks];
  for(int i = 0; i < numRows; i++){
    blocks[i] = makeBlocks(numBlocks, i);
  }  
}

void startGame(){
  background(0); 
  showBlocks();  
  ball.checkPaddle(paddle.getPx(), paddle.getPy());  
  ball.move();
  paddle.display();
  score.display();
  ball.display();  
}
Block[] makeBlocks(int numBlocks, int row){
  Block[] theBlocks = new Block[numBlocks];
  for(int i = 0; i < numBlocks; i++)
  {
    theBlocks[i] = new Block(i*blockWidth, blockHeight*row, blockWidth, blockHeight, 10);
    theBlocks[i].setColor(row);
  } 
  return theBlocks;
}

void showBlocks(){
  for(int i = 0; i < numRows; i++)
  {
    for(int j = 0; j < numBlocks; j++)
    {
      blocks[i][j].display(); 
      blocks[i][j].checkBall(ball);
    }
  }  
}
