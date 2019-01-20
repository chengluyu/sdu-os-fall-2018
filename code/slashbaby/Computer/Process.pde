class Process{
  long pid,father;
  long priority,counter,state;
  float x,y,pWidth,pHeight;
  int scale;
  Process(JSONObject data){
    this.pid = data.getLong("pid");
    this.father = data.getLong("father");
    this.priority = data.getLong("priority");
    this.state = data.getLong("state");
    this.counter = data.getLong("counter");
    scale = 3;
  }
  
   void display(float xm,float ym, float pW, float pH, float minC, float maxC ,int mode ,int curPid){
     /**********************display the node********************************************************/
     if(mode == 0){
       x = xm;
       y = ym;
       pWidth = pW;
       pHeight = pH;
     }else{
       pWidth = 450;
       pHeight = 450;
       x = width / 2 - pWidth/2;
       y = height /2 - pHeight/2 + 70;
     }
     
     float hue = map(counter,minC,maxC,180,350);
     fill(hue,100,100);
     strokeWeight(7);
     stroke(0);
     if(state == 0){
       //draw triangle to indicate unrunnable
       float x1 = x;
       float y1 = y;
       float x2 = x + pWidth;
       float y2 = y;
       float x3 = x + pWidth / 2;
       float y3 = y + pHeight;
       triangle(x1,y1,x2,y2,x3,y3);
     }else if(state == 1){
       //draw a rect to indicate runable
       rect(x, y, pWidth, pHeight);
     }else if(state == 2){
       //draw a ellipse to indicate stop
       ellipse(x, y,pWidth,pHeight);
     }else if(state == 3){
       //draw a trapezoid
       beginShape();
       float x1 = x + pWidth/4;
       float y1 = y;
       float x2 = x + pWidth/4*3;
       float y2 = y;
       float x3 = x + pWidth;
       float y3 = y + pHeight / 2; 
       float x4 = x2;
       float y4 = y + pHeight;
       float x5 = x1;
       float y5 = y4;
       float x6 = x;
       float y6 = y3;
       vertex(x1,y1);
       vertex(x2,y2);
       vertex(x3,y3);
       vertex(x4,y4);
       vertex(x5,y5);
       vertex(x6,y6);
       vertex(x1,y1);
       endShape();
     }else{
       println("unknown state");
     }
     
     /******************************display the detail information of the process*******************************/
     
     //if it is current process, then it's red
     if(pid == curPid){
       fill(360,100,100);
     }else{
       fill(0,0,100);
     }
     
     //show information depends on the display mode of the os
     //state
     String  s;
     if(state == 0){
       s = "RUNNING".toLowerCase();
     }else if(state == 1){
       s = "INTERRUPTIBLE".toLowerCase();
     }else if(state == 2){
       s = "UNINTERRUPTIBLE".toLowerCase();
     }else if(state == 3){
       s = "ZOMBIE".toLowerCase();
     }else{
       s = "STOPPED".toLowerCase();
     }
     if(mode == 0){
       int fontSize = int(map(pWidth,100,150,25,45));
       PFont font = createFont("Arial Black",fontSize);
       textFont(font);
       text(String.valueOf(pid),x + pWidth / 5 * 2,y + pHeight / 5 * 3);
     }else{
       PFont font = createFont("Arial Black",30);
       int offsetX = 30;
       int offsetY = -15;
       textFont(font);
       text("Pid: " + String.valueOf(pid),x + pWidth / 5 + offsetX,y + pHeight / 7 + offsetY);
       text("Father: " + String.valueOf(father),x + pWidth / 5 + offsetX,y + pHeight / 7 * 2 + offsetY);
       text("Counter: " + String.valueOf(counter),x + pWidth / 5 + offsetX,y + pHeight / 7 * 3 + offsetY);
       text("S: " + s,x + pWidth / 5 + offsetX,y + pHeight / 7 * 4 + offsetY);
     }
     
   }
   
   boolean isSelected(float mx, float my){
     if( mx > x && mx < x+pWidth && my > y && my < y+pHeight){
       return true;
     }else{
       return false;
     }
   }
}