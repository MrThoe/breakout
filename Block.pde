public class Block{
  
  private float w;
  private float h;
  private float x;
  private float y;
  private int row;
  private int colors;
  public boolean state;
  public String e;
  
  public Block(){
    w = 100;
    h = 20;
    state = true;
    colors = 9;
  }
  
  public Block(int theW, int theH){
    w = theW;
    h = theH;
    state = true;
    colors = 8;
  }
  
  public Block(int theX, int theY, int theW, int theH){
    w = theW;
    h = theH;
    x = theX;
    y = theY;
    state = true;
    colors = 8;
  }
  
  public Block(int theX, int theY, int theW, int theH, int col){
    w = theW;
    h = theH;
    x = theX;
    y = theY;
    state = true;
    colors = col;
  }
  public void setLocation(int theX, int theY){
    x = theX;
    y = theY;
  }
  
  //Allows each row to be a different color.
  public void setColor(int theRow){
      row = theRow;
      if (row%colors==0){
        fill(155,0,0);
      } else if (row%colors==1){
        fill(255,0,0);
      } else if (row%colors==2){
        fill(255,155,0);
      } else if (row%colors==3){
        fill(155, 255, 0);
      } else if (row%colors==4){
        fill(0, 255, 0);
      } else if (row%colors==5){
        fill(0, 255, 155);
      } else if (row%colors==6){
        fill(0, 155, 255);
      } else if (row%colors==7){
        fill(0, 0, 255);
      } else if (row%colors==8){
        fill(0, 0, 155);
      } else if (row%colors==9){
        fill(0, 50, 100);
      } else { setColor(row - 10); } //Use recursion in the event they make more than 10 rows...
  }
  public void display(){
    setColor(row);
    if(state){
      rect(x, y, w, h, 2);
    }
  }
  
  /* This method takes in the Ball as an input and uses it to check if there is a collision or not
   * If there is a collision, it determines the edge and then responds by changing the state of the
   * block to false (disappears) and then changes the appropriate velocity of the ball.
   * This was the most difficult build of the game.  */
  public void checkBall(Ball b){
    
    e = checkEdge(b);
    
    if(e == "left"){
      state = false;
      score.changeScore();
      b.Vx *=-1;
    } else if (e == "right"){
      state = false;;
      score.changeScore();
      b.Vx *= -1;
    } else if (e == "top"){
      state = false;
      score.changeScore();
      b.Vy *= -1;
    } else if (e == "bottom"){
      state = false;
      score.changeScore();
      b.Vy *= -1;
    }
   } 
   
   //Get the edge of a collision with a block (if there is one) and returns that edge as a string
   public String checkEdge(Ball b){
    if((x - b.x < b.d/2)&&(x >  b.x)&&(y - b.y < h)&&(y  >  b.y)&& state){
      return "left";
    } else if ((b.x - x < b.d/2)&&(b.x  > x)&&(b.y - y < h)&&(b.y  > y)&& state){
      return "right";
    } else if ((b.y - y < b.d/2)&&(b.y > y)&&(b.x < x + w)&&(b.x >  x)&& state){
      return "top";
    } else if ((y - b.y < b.d/2)&&(b.y < y)&&(b.x < x + w)&&(b.x >  x)&& state){
      return "bottom";
    } else {
      return "none";
   }
  }
}
