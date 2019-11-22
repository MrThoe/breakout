public class Ball{
  
  private float x;
  private float y;
  private float Vx;
  private float Vy;
  private float d;
  private boolean gameState;
  
  public Ball(){
    d = 20;
    gameState=false;
    Vx = random(10);
    Vy = -(15 - Vx);    
  }
  
  public Ball(float theD){
    d = theD;
    Vx = random(5);
    Vy = -(10 - Vx);
    gameState=false;
  }
  
  public void move(){
    if(x > width - d/2 || x < d/2){
      Vx *= -1;
    }
    if(y < d/2){
      y = d/2;
      Vy *= -1;
    }
    x = x + Vx;
    y = y + Vy;
    if(y > height){
      score.resetScore();
      gameState = false;
    }
  }
  
  public void display(){
    if(mousePressed){
      gameState = true;
    }
    if(!gameState){
      x = mouseX;
      y = height - 60 - (d/2);
    }
      circle(x, y, d);
  }
  
  public void checkPaddle(float padx, float pady){
    if(abs(x -padx) < 50 && abs(y - pady) < d/2){
      Vx = (x - padx)/5;  //Aim the ball
      y -= 5;  //Avoid 'double bounce'
      if(Vx > 10){
        Vx = 10;
      } else if (Vx < -10){
        Vx = -10;
      }  //CONSTRAIN -5 <= Vx <= 5
      Vy = -(15 - abs(Vx));
    } //END OF COLLISION
  } //END OF METHOD  
}
