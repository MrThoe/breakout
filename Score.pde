public class Score{
   private int score;
   private int highScore;
   
   public Score(){
     score = 0;
     highScore = 0;
     textSize(34);
   }
   
   public void display(){
     //Current Score (Bottom Left)
     fill(50,50,50,200);
     rect(10, height - 40, 200, 36, 4);
     fill(0, 255, 0);
     text("Score: " + score, 30, height - 10);
     
     //High Score (Bottom Right)
     fill(50,50,50,200);
     rect(width - 200, height - 40, 200, 36, 4);
     fill(0, 255, 0);
     text("High: " + highScore, width - 200, height - 10);       
     
   }
   
   public void changeScore(){
     score++;
     if(score > highScore){
       highScore = score;
     }
   }
   
   public void resetScore(){
     score = 0;
   }
}
