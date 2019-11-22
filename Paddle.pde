public class Paddle{
  
  private float x;
  private float y;
  private PImage pad;
  
  public Paddle(){
    pad = loadImage("./img/paddle.png");
    y = height - 60;
  }
  
  public float getPx(){
    return x;
  }
  
  public float getPy(){
    return y;
  }
  
  public void display(){
    x = mouseX;
    image(pad, x - 50, y); 
    //image(pad, (width/2) - 57, height-50);
  }
}
