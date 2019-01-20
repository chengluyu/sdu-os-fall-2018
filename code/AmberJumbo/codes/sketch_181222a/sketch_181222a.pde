node n1;
PFont f;
String typing = "";
String saved = "";
node[] n = new node[64];
int num_of_proc = 0;
int[] event_time = new int[100];
color color0 = color(255, 255, 255);
color color1 = color(179, 208, 237);
color color2 = color(138, 183, 227);
color color3 = color(34, 89, 144);
color color4 = color(2, 4, 7);
color color5 = color(153,204,255);
color color6 = color(255,204,238);
color color7 = color(68,187,187);
color color8 = color(217,191,244);
color chosen = color(233, 155, 177);
color stat0 = color(255, 177, 112);
color stat1 = color(202, 170, 251);
color stat2 = color(142, 232, 193);
color stat3 = color(126, 126, 126);
color green = stat2;
int main_memory_x = 625;
int main_memory_y = 100;
int main_memory_w = 250;
int main_memory_l = 700;
void setup(){
  smooth(4);
  background(color1);
  size(1600, 900);
//  frameRate(4);
  for(int i=0;i<36;i++){
    event_time[i] = 2000*(i+1);
  }
  event_time[36] = 2000*37+23000;
  for(int i=37;i<100;i++){
    event_time[i]=23000+2000*(i+1);
  }
}

void draw(){
  textFont(createFont("Arial", 10, true));
  fill(0);
  //text(millis() / 1000, 0, 10);
  fill(chosen);
  noStroke();
  rect(30, 820, 100, 60, 10, 10, 10, 10);
  fill(color0);
  textFont(createFont("Arial", 20, true));
  text("chosen", 48, 855, -1); 
  fill(stat0);
  noStroke();
  rect(160, 820, 100, 60, 10, 10, 10, 10);
  fill(color0);
  textFont(createFont("Arial", 20, true));
  text("state 0", 178, 855, -1); 
  fill(stat1);
  noStroke();
  rect(290, 820, 100, 60, 10, 10, 10, 10);
  fill(color0);
  textFont(createFont("Arial", 20, true));
  text("state 1", 308, 855, -1); 
  fill(stat2);
  noStroke();
  rect(420, 820, 100, 60, 10, 10, 10, 10);
  fill(color0);
  textFont(createFont("Arial", 20, true));
  text("state 2", 438, 855, -1);  
  fill(stat3);
  noStroke();
  rect(550, 820, 100, 60, 10, 10, 10, 10);
  fill(color0);
  textFont(createFont("Arial", 20, true));
  text("state 3", 568, 855, -1); 
  fill(color3);
  strokeWeight(3);
  stroke(color3);
  int time = millis();
  int start = 0;
  if(time < 150000)
  {
    background(color1);
    init_shed();
  }
  if(time >= 150000 && time <= 153000){
    fill(255);
    strokeWeight(3);
    stroke(color3);
    rect(1400, 50, 150, 800, 20, 20, 20, 20);
    for(int i=1; i<16; i++){
      line(1400, 50+50*i, 1550, 50+50*i); 
    }
    fill(color3);
    textFont(createFont("Arial", 30, true));
    text("ss", 1360, 190, -1); 
    text("esp", 1345, 240, -1); 
    text("cs", 1360, 290, -1); 
    text("eip", 1350, 340, -1); 
    text("ds", 1360, 390, -1); 
    text("es", 1360, 440, -1); 
    text("fs", 1365, 490, -1);
    text("edx", 1340, 540, -1); 
    text("ecx", 1340, 590, -1); 
    text("ebx", 1340, 640, -1); 
    text("eax", 1340, 690, -1); 
    text("signr", 1320, 740, -1); 
    
  
    //cmd
    fill(255);
    textFont(createFont("Arial", 30, true));
    text("Command Line", 970, 80); 
    strokeWeight(3);
    stroke(color3);
    rect(900, 100, 350, 40, 10, 10, 10, 10);
    textFont(createFont("Arial", 26, true));
    fill(color4);
    text(typing, 900, 130);
    fill(255);
    rect(900, 350, 350, 500, 20, 20, 20, 20);  
    fill(color3);
    textFont(createFont("Arial", 35, true));
    text("INFORMATION", 950, 400, -1); 
  }
  if(153000 <= time && time <= 156000){
    start = 153000;
    create_proc0(start);
  }
  if(156000 <= time && time <= 159000){
    start = 156000;
    create_proc1(start);
  }
  if(159000 <= time && time <= 235000){
    show_proc1(159000, 1, 0, 15, 
              1, 155272,4092,917504,23,30319,
              3,21992,33,
              23,23,23,
              26802,15,514,155248,23);
  }
  if(235000 <= time && time <= 238000){
    start = 235000;
    choose_proc1(start);
  }
  if(238000 <= time && time <= 241000){
    start = 238000;
    create_proc2(start);
  }
  if(241000 <= time && time <= 244000){
    start = 241000;
    choose_proc2(start);
  }
  if(244000 <= time && time <= 247000){
    start = 244000;
    create_proc3(start);
  }
  if(247000 <= time && time <= 250000){
    start = 247000;
    exit_proc2(start);
  }
  if(250000 <= time && time <= 286000){
    start = 250000;
    delete_proc(250000);//36s
  }
  if(286000 <= time && time <= 289000){
    start = 286000;
    do_exit_2(start);//change 3's father
  }
  if(289000 <= time && time <= 292000){
    start = 289000;
    line222(start);   
  }
  if(292000 <= time && time <= 295000){
    start = 292000;
    release2(start);
  }
  if(295000 <= time && time <= 298000){
    start = 295000;
    create_proc4(start);
  }
  if(298000 <= time && time <= 301000){
    start = 298000;
    choose_proc4(start);
  }
  if(301000 <= time && time <= 304000){
    start = 301000;
    create_proc5(start);
  }
  if(304000 <= time && time <= 307000){
    start = 304000;
    choose_proc5(start);
  }
  if(307000 <= time && time <= 310000){
    start = 307000;
    exit_5(start);
  }
  if(310000 <= time && time <= 313000){
    start = 310000;
    do_exit_5(start);
  }
  if(313000 <= time && time <= 316000){
    start = 313000;
    release_5(start);
  }
  if(316000 <= time && time <= 326000){
    //need a long time to idle proc0
    start = 316000;
    choose_proc_520(start);
  }
  if(326000 <= time && time <= 329000){
    start = 326000;
    choose_proc_3652(start);
  }
  if(329000 <= time && time <= 332000){
    start = 329000;
    create_proc6(start);
  }
  if(332000 <= time && time <= 335000){
    start = 332000;
    choose_proc6(start);
  }
  if(335000 <= time && time <= 338000){
    start = 335000;
    exit_6(start);
  }
  if(338000 <= time && time <= 341000){
    start = 338000;
    do_exit_6(start);
  }
  if(341000 <= time && time <= 344000){
    start = 341000;
    release_6(start);
  }
  if(344000 <= time && time <= 351000){
    //need a long time to idle proc0
    start = 344000;
    choose_proc_520(start);
  }
  if(351000 <= time && time <= 354000){
    start = 351000;
    choose_proc_7733(start);
  }
  if(354000 <= time && time <= 357000){
    start = 354000;
    create_proc7(start);
  }
  if(357000 <= time && time <= 360000){
    start = 357000;
    choose_proc7(start);
  }
  if(360000 <= time && time <= 363000){
    start = 360000;
    exit_7(start);
  }
  if(363000 <= time && time <= 366000){
    start = 363000;
    do_exit_7(start);
  }
  if(366000 <= time && time <= 369000){
    start = 366000;
    release_7(start);
  }
  if(369000 <= time && time <= 372000){
    //need a long time to idle proc0
    start = 369000;
    choose_proc_520(start);
  }
  if(372000 <= time && time <= 375000){
    start = 372000;
    choose_proc_7854(start);
  }
  if(375000 <= time && time <= 378000){
    start = 375000;
    create_proc8(start);
  }
  if(378000 <= time && time <= 381000){
    start = 378000;
    choose_proc8(start);
  }
  if(381000 <= time && time <= 384000){
    start = 381000;
    exit_8(start);
  }
  if(384000 <= time && time <= 387000){
    start = 384000;
    do_exit_8(start);
  }
  if(387000 <= time && time <= 390000){
    //need a long time to idle proc0
    start = 387000;
    release_8(start);
  }
  if(390000 <= time && time <= 400000){
    //need a long time to idle proc0
    start = 390000;
    choose_proc_520(start);
  }
}

void initial(){
  
}

void create_proc0(int start){
  int time = millis();
  node_transparency(time, start);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1); 
  fill(color3);
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 0", 930, 460, -1); 
}

void create_proc1(int start){
  int time = millis();
  node_transparency(time, start);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  node_line(400, 150, 400, 200, time, start);
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1); //300+50, 200+60
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 1", 930, 460, -1); 
}

void choose_proc1(int start){
  background(color1);
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1); 
  fill(color4);
  line(400, 150, 400, 200);
  fill(chosen);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1);
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("0002 5E70", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0000 68A2", 1420, 340, -1);  
  
  //cmd
  fill(255);
  textFont(createFont("Arial", 30, true));
  text("Command Line", 970, 80); 
  strokeWeight(3);
  stroke(color3);
  rect(900, 100, 350, 40, 10, 10, 10, 10);
  textFont(createFont("Arial", 26, true));
  fill(color4);
  text(typing, 900, 130);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sys_pause.", 920, 460, -1); 
  text("Procedure 1's counter is 15.", 920, 500, -1); 
}

void create_proc2(int start){
  int time = millis();
  node_transparency(time, start);
  n[2] = new node(100, 350, 200, 100);
  n[2].paint_trangle();
  node_line(400, 300, 200, 350, time, start);
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 2", 150, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 2", 930, 460, -1); 
}

void choose_proc2(int start){
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1); 
  fill(color4);
  line(400, 150, 400, 200);
  fill(stat1);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  fill(color4);
  line(400, 300, 200, 350);
  fill(chosen);
  n[2] = new node(100, 350, 200, 100);
  n[2].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 2", 150, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sys_waitpid.", 920, 460, -1); 
  text("Procedure 2's counter is 15.", 920, 500, -1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("0002 5E50", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0000 69B0", 1420, 340, -1); 
}

void create_proc3(int start){
  int time = millis();
  node_transparency(time, start);
  n[3] = new node(100, 500, 200, 100);
  n[3].paint_trangle();
  node_line(200, 450, 200, 500, time, start);
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 3", 150, 560, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 3", 930, 460, -1); 
}

void exit_proc2(int start){
  fill(stat3);
  //stroke(color1);
  //strokeWeight(5);
  n[2] = new node(100, 350, 200, 100);
  n[2].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 2", 150, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("EXIT PROCEDURE 2", 940, 460, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
}

//change 3's father
void do_exit_2(int start){
  background(color1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("03FF FD6C", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0003 98AF", 1420, 340, -1); 

  //cmd
  fill(255);
  textFont(createFont("Arial", 30, true));
  text("Command Line", 970, 80); 
  strokeWeight(3);
  stroke(color3);
  rect(900, 100, 350, 40, 10, 10, 10, 10);
  textFont(createFont("Arial", 26, true));
  fill(color4);
  text(typing, 900, 130);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by do_exit 2.", 920, 460, -1); 
  text("Procedure 3's counter is 15.", 920, 500, -1); 
  
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1);
  line(400, 150, 400, 200);
  fill(stat0);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  line(400, 300, 200, 350);
  fill(stat3);
  n[2] = new node(100, 350, 200, 100);
  n[2].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 2", 150, 410, -1); 
  int pos_x = 100;
  int pos_y = 500;
  int time = millis();
  if(time - start < 1500)
  {
    float pos_x_d = 400*(time - start)/1500;
    float pos_y_d = 150*(time - start)/1500;
    fill(chosen);
    //stroke(color1);
    rect(pos_x+pos_x_d,pos_y-pos_y_d, 200, 100, 10, 10, 10, 10); 
    fill(255);
    textFont(createFont("Arial", 35, true));
    text("pid = 3", pos_x+pos_x_d+50, pos_y-pos_y_d+60, -1);
    fill(color3);
    stroke(color3);
    node_line(400, 300, 600, 350, time, start);
    //fill(stat1);
    //stroke(color3);
  }
  else
  {
    fill(chosen);
    stroke(color3);
    rect(500, 350, 200, 100, 10, 10, 10, 10); 
    fill(255);
    textFont(createFont("Arial", 35, true));
    text("pid = 3", 550, 410, -1);
    line(400, 300, 600, 350);
  }
}

void line222(int start){
  fill(chosen);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  fill(stat1);
  n[3] = new node(500, 350, 200, 100);
  n[3].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 3", 550, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sys_pause.", 920, 460, -1); 
  text("Procedure 1's counter is 13.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF FF84", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 
}

//distroy_proc2
void release2(int start){
  background(color1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF FF84", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 
  

  //cmd
  fill(255);
  textFont(createFont("Arial", 30, true));
  text("Command Line", 970, 80); 
  strokeWeight(3);
  stroke(color3);
  rect(900, 100, 350, 40, 10, 10, 10, 10);
  textFont(createFont("Arial", 26, true));
  fill(color4);
  text(typing, 900, 130);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by release 2.", 920, 460, -1); 
  text("Procedure 1's counter is 12.", 920, 500, -1); 
 
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1);
  line(400, 150, 400, 200);
  fill(chosen);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  int pos_x = 500;
  int time = millis();
  if(time - start < 1500)
  {
    float pos_x_d = 400*(time - start)/1500;
    fill(stat1);
    //stroke(color1);
    rect(pos_x-pos_x_d,350, 200, 100, 10, 10, 10, 10); 
    fill(255);
    textFont(createFont("Arial", 35, true));
    text("pid = 3", pos_x-pos_x_d+50, 410, -1);
    fill(color3);
    stroke(color3);
    node_line(400, 300, 200, 350, time, start);
    //fill(stat1);
    //stroke(color3);
  }
  else
  {
    fill(stat1);
    stroke(color3);
    rect(100, 350, 200, 100, 10, 10, 10, 10); 
    fill(255);
    textFont(createFont("Arial", 35, true));
    text("pid = 3", 150, 410, -1);
    line(400, 300, 200, 350);
  }
}

void create_proc4(int start){
  int time = millis();
  node_transparency(time, start);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  node_line(400, 300, 600, 350, time, start);
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 4", 930, 460, -1); 
}

void choose_proc4(int start){
  fill(stat1);
  line(400, 150, 400, 200);
  fill(stat1);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sys_waitpid.", 920, 460, -1); 
  text("Procedure 4's counter is 15.", 920, 500, -1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("0002 5E50", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0000 6A5A", 1420, 340, -1);  
}

void create_proc5(int start){
  int time = millis();
  node_transparency(time, start);
  n[5] = new node(500, 500, 200, 100);
  n[5].paint_trangle();
  node_line(600, 450, 600, 500, time, start);  
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 5", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 5", 930, 460, -1); 
}

void choose_proc5(int start){
  fill(stat2);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(chosen);
  n[5] = new node(500, 500, 200, 100);
  n[5].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 5", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sleep_on.", 920, 460, -1); 
  text("Procedure 5's counter is 15.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("03FF F0B4", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0003 98AF", 1420, 340, -1); 
}


void exit_5(int start)
{
  fill(stat3);
  n[5] = new node(500, 500, 200, 100);
  n[5].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 5", 550, 560, -1); 
  fill(255);
}

void do_exit_5(int start)
{
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1);  
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("EXIT PROCEDURE 5", 940, 460, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
}

void release_5(int start){
  background(color1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF BF24", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 

  //cmd
  fill(255);
  textFont(createFont("Arial", 30, true));
  text("Command Line", 970, 80); 
  strokeWeight(3);
  stroke(color3);
  rect(900, 100, 350, 40, 10, 10, 10, 10);
  textFont(createFont("Arial", 26, true));
  fill(color4);
  text(typing, 900, 130);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by release.", 920, 460, -1); 
  text("Procedure 4's counter is 6.", 920, 500, -1); 
  
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1);
  line(400, 150, 400, 200);
  fill(stat1);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  line(400, 300, 200, 350);
  fill(stat1);
  n[3] = new node(100, 350, 200, 100);
  n[3].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 3", 150, 410, -1); 
  line(400, 300, 600, 350);
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
}


void choose_proc_520(int start){
  fill(chosen);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1); 
  fill(color3);
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 0", 930, 460, -1); 
  fill(stat1);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 17, true));
  text("Schedule is called by interruptible_sleep_on.", 910, 460, -1); 
  textFont(createFont("Arial", 21, true));
  text("Procedure 0's counter is 14.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("0002 00D4", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 
}

void choose_proc_3652(int start){
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1); 
  fill(color3);
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 0", 930, 460, -1); 
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sys_pause.", 920, 460, -1); 
  text("Procedure 4's counter is 7.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF BE84", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 
  fill(color3);
  textFont(createFont("Arial", 25, true));  
  text("cd", 1050, 130, -1); 
}

void create_proc6(int start){
  int time = millis();
  node_transparency(time, start);
  n[6] = new node(500, 500, 200, 100);
  n[6].paint_trangle();
  node_line(600, 450, 600, 500, time, start);  
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 6", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 6", 930, 460, -1); 
}

void choose_proc6(int start){
  fill(stat2);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(chosen);
  n[6] = new node(500, 500, 200, 100);
  n[6].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 6", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sleep_on.", 920, 460, -1); 
  text("Procedure 6's counter is 15.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("03FF F0B4", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0003 98AF", 1420, 340, -1); 
}


void exit_6(int start)
{
  fill(stat3);
  n[6] = new node(500, 500, 200, 100);
  n[6].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 6", 550, 560, -1); 
  fill(255);
}

void do_exit_6(int start)
{
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1);  
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("EXIT PROCEDURE 6", 940, 460, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
}

void release_6(int start){
  background(color1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF BF24", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 

  //cmd
  fill(255);
  textFont(createFont("Arial", 30, true));
  text("Command Line", 970, 80); 
  strokeWeight(3);
  stroke(color3);
  rect(900, 100, 350, 40, 10, 10, 10, 10);
  textFont(createFont("Arial", 26, true));
  fill(color4);
  text(typing, 900, 130);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by release.", 920, 460, -1); 
  text("Procedure 4's counter is 6.", 920, 500, -1); 
  
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1);
  line(400, 150, 400, 200);
  fill(stat1);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  line(400, 300, 200, 350);
  fill(stat1);
  n[3] = new node(100, 350, 200, 100);
  n[3].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 3", 150, 410, -1); 
  line(400, 300, 600, 350);
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
}




void choose_proc_7733(int start){
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1); 
  fill(color3);
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 0", 930, 460, -1); 
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sys_pause.", 920, 460, -1); 
  text("Procedure 4's counter is 7.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF BE84", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 
  fill(color3);
  textFont(createFont("Arial", 25, true));  
  text("ls", 1050, 130, -1); 
}

void create_proc7(int start){
  int time = millis();
  node_transparency(time, start);
  n[7] = new node(500, 500, 200, 100);
  n[7].paint_trangle();
  node_line(600, 450, 600, 500, time, start);  
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 7", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 7", 930, 460, -1); 
}

void choose_proc7(int start){
  fill(stat2);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(chosen);
  n[7] = new node(500, 500, 200, 100);
  n[7].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 7", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sleep_on.", 920, 460, -1); 
  text("Procedure 7's counter is 15.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("03FF F0B4", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0003 98AF", 1420, 340, -1); 
}


void exit_7(int start)
{
  fill(stat3);
  n[7] = new node(500, 500, 200, 100);
  n[7].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 7", 550, 560, -1); 
  fill(255);
}

void do_exit_7(int start)
{
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1);  
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("EXIT PROCEDURE 7", 940, 460, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
}

void release_7(int start){
  background(color1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF BF24", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 

  //cmd
  fill(255);
  textFont(createFont("Arial", 30, true));
  text("Command Line", 970, 80); 
  strokeWeight(3);
  stroke(color3);
  rect(900, 100, 350, 40, 10, 10, 10, 10);
  textFont(createFont("Arial", 26, true));
  fill(color4);
  text(typing, 900, 130);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by release.", 920, 460, -1); 
  text("Procedure 4's counter is 6.", 920, 500, -1); 
  
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1);
  line(400, 150, 400, 200);
  fill(stat1);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  line(400, 300, 200, 350);
  fill(stat1);
  n[3] = new node(100, 350, 200, 100);
  n[3].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 3", 150, 410, -1); 
  line(400, 300, 600, 350);
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
}




void choose_proc_7854(int start){
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1); 
  fill(color3);
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 0", 930, 460, -1); 
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sys_pause.", 920, 460, -1); 
  text("Procedure 4's counter is 7.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF BE84", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 
  fill(color3);
  textFont(createFont("Arial", 25, true));  
  text("ls", 1050, 130, -1); 
}

void create_proc8(int start){
  int time = millis();
  node_transparency(time, start);
  n[8] = new node(500, 500, 200, 100);
  n[8].paint_trangle();
  node_line(600, 450, 600, 500, time, start);  
  fill(0);
  textFont(createFont("Arial", 35, true));
  text("pid = 8", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("CREATE PROCEDURE 8", 930, 460, -1); 
}

void choose_proc8(int start){
  fill(stat2);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
  fill(chosen);
  n[8] = new node(500, 500, 200, 100);
  n[8].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 8", 550, 560, -1);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by sleep_on.", 920, 460, -1); 
  text("Procedure 8's counter is 15.", 920, 500, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0017", 1420, 190, -1); 
  text("03FF F0B4", 1420, 240, -1); 
  text("0000 000F", 1420, 290, -1); 
  text("0003 98AF", 1420, 340, -1); 
}


void exit_8(int start)
{
  fill(stat3);
  n[8] = new node(500, 500, 200, 100);
  n[8].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 8", 550, 560, -1); 
  fill(255);
}

void do_exit_8(int start)
{
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1);  
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 26, true));
  text("EXIT PROCEDURE 8", 940, 460, -1); 
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
}

void release_8(int start){
  background(color1);
  //STACK
  fill(255);
  strokeWeight(3);
  stroke(color3);
  rect(1400, 50, 150, 800, 20, 20, 20, 20);
  for(int i=1; i<16; i++){
    line(1400, 50+50*i, 1550, 50+50*i); 
  }
  fill(color3);
  textFont(createFont("Arial", 30, true));
  text("ss", 1360, 190, -1); 
  text("esp", 1345, 240, -1); 
  text("cs", 1360, 290, -1); 
  text("eip", 1350, 340, -1); 
  text("ds", 1360, 390, -1); 
  text("es", 1360, 440, -1); 
  text("fs", 1365, 490, -1);
  text("edx", 1340, 540, -1); 
  text("ecx", 1340, 590, -1); 
  text("ebx", 1340, 640, -1); 
  text("eax", 1340, 690, -1); 
  text("signr", 1320, 740, -1); 
  textFont(createFont("Arial", 23, true));  
  text("0000 0010", 1420, 190, -1); 
  text("00FF BF24", 1420, 240, -1); 
  text("0000 0008", 1420, 290, -1); 
  text("0000 6EBE", 1420, 340, -1); 

  //cmd
  fill(255);
  textFont(createFont("Arial", 30, true));
  text("Command Line", 970, 80); 
  strokeWeight(3);
  stroke(color3);
  rect(900, 100, 350, 40, 10, 10, 10, 10);
  textFont(createFont("Arial", 26, true));
  fill(color4);
  text(typing, 900, 130);
  fill(255);
  rect(900, 350, 350, 500, 20, 20, 20, 20);
  fill(color3);
  textFont(createFont("Arial", 35, true));
  text("INFORMATION", 950, 400, -1); 
  textFont(createFont("Arial", 21, true));
  text("Schedule is called by release.", 920, 460, -1); 
  text("Procedure 4's counter is 6.", 920, 500, -1); 
  
  fill(stat1);
  n[0] = new node(300, 50, 200, 100);
  n[0].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 0", 350, 110, -1);
  line(400, 150, 400, 200);
  fill(stat1);
  n[1] = new node(300, 200, 200, 100);
  n[1].paint_trangle();
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 1", 350, 260, -1);
  line(400, 300, 200, 350);
  fill(stat1);
  n[3] = new node(100, 350, 200, 100);
  n[3].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 3", 150, 410, -1); 
  line(400, 300, 600, 350);
  fill(chosen);
  n[4] = new node(500, 350, 200, 100);
  n[4].paint_trangle(); 
  //line(200, 350, 400, 300);
  fill(255);
  textFont(createFont("Arial", 35, true));
  text("pid = 4", 550, 410, -1); 
}


void keyPressed(){
  if(key == '\n'){
    saved = typing;
    typing = "";
  }
  else{
   typing = typing + key; 
  }
}

void node_transparency(int time, int start){
  if(time - start < 255 * 200){
      fill(255, (time - start) / 200);
    }
    else{
     fill(255, 255); 
    }
}

void node_line(int x1, int y1, int x2, int y2, int time, int start){
  if(time - start < 2000){
      line(x1, y1, x1 + (time - start) * (x2 - x1) / 2000, y1 + (time - start) * (y2 - y1)/ 2000);
    }
    else{
      line(x1, y1, x2, y2);
    }
}

void clear_all(int start){
   node_transparency(millis(), start);
   noStroke();
   rect(0, 0, 1600, 900);
}

void delete_proc(int start){
   background(color1);
   if(millis() - start > 0 && millis() - start < 34000){
      if(millis() - start < 2000){
         translate( -800 + (millis() - start) * 800 / 2000, 0);
         stroke(0);
         task_struct(100, 100, 700, 600, start);
      }
      else{
         stroke(0);
         task_struct(100, 100, 700, 600, start);
      }
      if(millis() - start > 2000){
         if(millis() - start < 4000){
           if((millis() - start) % 500 < 350){
              strokeWeight(3);
              stroke(220, 20, 60);
              noFill();
              rect(100, 273.91, 600, 21.74); 
           }
         }
      }
      if(millis() - start > 4000){
         strokeWeight(3);
         extend_line(700, 284.78, 800, 284.78, 1000, start + 4000);
         if(millis() - start > 5000){
            triangle(810, 284.78, 800, 290.55, 800, 279.01); 
         }
      }
      if(millis() - start > 5000){
         fill(0, (millis() - start - 5000) * 255 / 1000);
         textFont(createFont("Arial", 20));
         text("current_pid = 2", 820, 290);
      }
      if(millis() - start > 6000){
          fill(0, (millis() - start - 6000) * 255 / 1000);
          strokeWeight(3);
          stroke(3);
          line(100, 750, 1500, 750);
          line(100, 850, 1500, 850);
          for(int i=0; i<=5; i++){
             strokeWeight(3);
             line(100 + i * 100, 750, 100 + i * 100, 850);
             line(1500 - i * 100, 750, 1500 - i * 100, 850);
          }
          fill(100);
          rect(100, 750, 100, 100);
          rect(300, 750, 100, 100);
          if(millis() - start < 31000){
             fill(100, 255 - (millis() - start - 30000) * 255 / 500);
             rect(200, 750, 100, 100);
          }
          
          fill(0);
          textFont(createFont("Arial", 24));
          text("task[1]", 115, 805);
          text("task[2]", 215, 805);
          text("task[3]", 315, 805);
          text("task[4]", 415, 805);
          text("task[5]", 515, 805);
          text("task[60]", 1015, 805);
          text("task[61]", 1115, 805);
          text("task[62]", 1215, 805);
          text("task[63]", 1315, 805);
          text("task[64]", 1415, 805);
          textFont(createFont("Arial", 30));
          text("task[]", 10,805);
          textFont(createFont("Arial", 48));
          text("· · · · · ·", 710, 820);
      }
      if(millis() - start > 7000){
         fill(0);
         textFont(createFont("Arial", 20));
         text("Find whose father is pid_2:", 100, 675); 
         for(int i=0; i<10; i++){
            if(i <= 4){
               noFill();
               strokeWeight(5);
               stroke(220, 20, 60, (millis() - start - 7000 - i * 300) * 255 / 300);
               if(millis() - start - 7000 - i * 300 > 300){
                   stroke(0);
                   strokeWeight(3);
               }
               rect(100 + i * 100, 750, 100, 100);
            }
            else{
               noFill();
               strokeWeight(5);
               stroke(220, 20, 60, (millis() - start - 7000 - i * 300) * 255 / 300);
               if(millis() - start - 7000 - i * 300 > 300){
                   stroke(0);
                   strokeWeight(3);
               }
               rect(1000 + (i - 5) * 100, 750, 100, 100);
            }
         }
      }
      if(millis() - start > 10000){
         if(millis() - start < 12000){
            if((millis() - start) % 500 < 350){
               noFill();
               strokeWeight(5);
               stroke(220, 20, 60);
               rect(300, 750, 100, 100); 
            }
         }
         else{
            noFill();
            strokeWeight(5);
            stroke(220, 20, 60);
            rect(300, 750, 100, 100);
         }
      }
      if(millis() - start > 12000){
         strokeWeight(3);
         stroke(0);
         extend_line(350, 750, 350, 650, 1000, start + 12000);
         extend_line(350, 650, 850, 650, 1000, start + 13000);
         extend_line(850, 650, 850, 400, 1000, start + 14000);
      }
      if(millis() - start > 15000){
         fill(0);
         triangle(850, 390, 855.77, 400, 844.23, 400); 
         text("task[3] -> father = ", 820, 360);
         if(millis() - start < 16000){
            fill(0, 255);
            text("2", 990, 360);
         }
         if(16000 < millis() - start && millis() - start < 17000){
            fill(0, 255 - (millis() - start - 16000) * 255 / 1000 );
            text("2", 990, 360);
         }
         if(17000 < millis() - start){
            fill(0, (millis() - start - 17000) * 255 / 1000);
            text("1", 990, 360);
         }
      }
      
      if(millis() - start > 18000){
         extend_line(250, 750, 250, 700, 1000, start + 18000);
         extend_line(250, 700, 1450, 700, 1000, start + 19000);
         extend_line(1450, 700, 1450, 400, 1000, start + 20000);
         extend_line(1450, 400, 1350, 400, 1000, start + 21000);
         if(millis() - start > 22000){
            triangle(1340, 400, 1350, 405.77, 1350, 394.23);
         }
      }
      
      if(millis() - start > 22000){
         fill(0);
         triangle(850, 390, 855.77, 400, 844.23, 400); 
         text("task[2] -> state = ", 1050, 360);
         if(millis() - start < 23000){
            fill(0, 255);
            text("0", 1220, 360);
         }
         if(23000 < millis() - start && millis() - start < 24000){
            fill(0, 255 - (millis() - start - 23000) * 255 / 1000 );
            text("0", 1220, 360);
         }
         if(24000 < millis() - start){
            fill(0, (millis() - start - 24000) * 255 / 1000);
            text("3", 1220, 360);
         }
      }
      if(millis() - start > 25000){
         fill(0);
         triangle(850, 390, 855.77, 400, 844.23, 400); 
         text("task[2] -> exit_code = ", 1050, 410);
         if(millis() - start < 26000){
            fill(0, 255);
            text("0", 1250, 410);
         }
         if(26000 < millis() - start && millis() - start < 27000){
            fill(0, 255 - (millis() - start - 26000) * 255 / 1000 );
            text("0", 1250, 410);
         }
         if(27000 < millis() - start){
            fill(0, (millis() - start - 27000) * 255 / 1000);
            text("0", 1250, 410);
         }
      }
      if(millis() - start > 28000){
         fill(0);
         triangle(850, 390, 855.77, 400, 844.23, 400); 
         text("task[2] -> signal = ", 1050, 460);
         if(millis() - start < 29000){
            fill(0, 255);
            text("0", 1220, 460);
         }
         if(29000 < millis() - start && millis() - start < 30000){
            fill(0, 255 - (millis() - start - 29000) * 255 / 1000 );
            text("0", 1220, 460);
         }
         if(30000 < millis() - start){
            fill(0, (millis() - start - 30000) * 255 / 1000);
            text("65536", 1220, 460);
         }
      }
      if(millis() - start > 32000){
         noStroke();
         fill(color1, (millis() - start - 32000) * 255 / 2000);
         rect(0, 0, 1600, 900);
      }
   }
}

void show_proc1(int start, int last_pid, int pid, int priority, 
                int jiffies, long ebp,long edi,long esi,long gs,long none,
                long ebx,long ecx,long edx,
                long fs,long es,long ds,
                long eip,long cs,long eflags,long esp,long ss){
   background(color1);
   if(millis() - start > 73000 && millis() - start < 76000){
      translate((millis() - start - 72000) * 1600 / 3000, 0); 
   } 
   else{
      translate(0, 0);
   }
   if(0 < millis() - start && millis() - start < 45000){
       if(millis() - start > 500){
          fill(color3, (millis() - start - 500) * 255 / 1000);
          strokeWeight(3);
          stroke(3,  (millis() - start - 500) * 255 / 1000);
          line(100, 50, 1500, 50);
          line(100, 150, 1500, 150);
          for(int i=0; i<=5; i++){
            line(100 + i * 100, 50, 100 + i * 100, 150);
            line(1500 - i * 100, 50, 1500 - i * 100, 150);
          }
          textFont(createFont("Arial", 24));
          text("task[1]", 115, 105);
          text("task[2]", 215, 105);
          text("task[3]", 315, 105);
          text("task[4]", 415, 105);
          text("task[5]", 515, 105);
          text("task[60]", 1015, 105);
          text("task[61]", 1115, 105);
          text("task[62]", 1215, 105);
          text("task[63]", 1315, 105);
          text("task[64]", 1415, 105);
          textFont(createFont("Arial", 30));
          text("task[]", 10,105);
          textFont(createFont("Arial", 48));
          text("· · · · · ·", 710, 120); 
       }
       if(millis() - start > 1500){
          if(millis() - start < 2500){
            triangle(150, 900 - (millis() - start - 1500) * 750 / 1000, 144.23, 910 - (millis() - start - 1500) * 750 / 1000, 155.77, 910 - (millis() - start - 1500) * 750 / 1000);
            line(150, 910 - (millis() - start - 1500) * 750 / 1000, 150, 930 - (millis() - start - 1500) * 750 / 1000);
          }
          else{
            triangle(150, 150, 144.23, 160, 155.77, 160);
            line(150, 160, 150, 180);
            textFont(createFont("Arial", 20));
            text("avaliable", 85, 200);
          }
       }
       if(millis() - start > 2500){
          text("father's task_struct",190, 245);
          task_struct(50.0, 250.0, 500.0, 850.0, start + 2500);
       }
       if(millis() - start > 3000){
          strokeWeight(3);
          if(millis() - start < 4000){
             extend_line(180, 150, 180, 200, 1000, start + 3000);
          }
          else{
            line(180, 150, 180, 200); 
            if(millis() - start < 6000){
              extend_line(180, 200, 880, 200, 2000, start + 4000);
             }
             else{
               line(180, 200, 880, 200);
               if(millis() - start < 7000){
                 extend_line(880, 200, 880, 240, 1000, start + 6000);
               }
               else{
                  line(880, 200, 880, 240);
                  triangle(880, 250, 874.23, 240, 885.77, 240);
               }
             }
          }
       }
       if(millis() - start > 7000){
          strokeWeight(3);
          if(millis() - start <= 9000){
            if((millis() - start) % 500 <= 350 && (millis() - start) % 500 >= 0){
               fill(green);
               noStroke();
               rect(540, 535, 250, 30);
               triangle(870, 550, 790, 596.189, 790, 503.811);
               fill(0);
               textFont(createFont("Arial", 20));
               text("copy father's task_struct", 540, 530);
            }
          }
          else{
            fill(green);
            noStroke();
            rect(540, 535, 250, 30);
            triangle(870, 550, 790, 596.189, 790, 503.811);
            fill(0);
            textFont(createFont("Arial", 20));
            text("copy father's task_struct", 540, 530);
            strokeWeight(3);
            stroke(3);
            textFont(createFont("Arial", 20));
            text("his task_struct", 1050, 245);
            task_struct(880, 250, 1330, 850, start + 9000);
          }
          
         if(millis() - start >= 9500 && millis() - start <= 11000){
            fill(0);
            textFont(createFont("Arial", 20));
            text("update his task_struct", 1600 - (millis() - start - 9500) * 250 / 1500, 550); 
         }
         if(millis() - start <= 12000 && millis() - start >= 11000){
            textFont(createFont("Arial", 20));
            text("update his task_struct", 1350, 550);
         }
         if(millis() - start >= 12000 && millis() - start <= 13500){
            fill(0);
            textFont(createFont("Arial", 20));
            text("update his task_struct", 1350 + (millis() - start - 12000) * 250 / 1500, 550); 
         }
       }
       if(millis() - start > 13500){
          update_task_struct(880, 250, 600.0 / 23.0,  start + 13500, last_pid, pid, priority, 
                    jiffies, ebp, edi, esi, gs, none,
                    ebx, ecx, edx,
                    fs, es, ds,
                    eip, cs, eflags, esp, ss) ;     
       }
       if(millis() - start > 38000){
           if(millis() - start < 40000){
               if((millis() - start) % 500 <= 350 && (millis() - start) % 500 >= 0){
                  noFill();
                  strokeWeight(3);
                  stroke(color(220, 20, 60));
                  rect(880, 250 + 600.0 * 22 / 23.0, 450, 600.0 / 23);
               }
                 
           }
           else{
              noFill();
              strokeWeight(3);
              stroke(color(220, 20, 60));
              rect(880, 250 + 600.0 * 22 / 23.0, 450, 600.0 / 23);
           }
       }
       if(millis() - start > 42000){
          noStroke();
          fill(255, (millis() - start - 40000) * 255 / 5000);
          rect(0, 0, 1600, 900);
          fill(255);
          strokeWeight(1);
          rect(880, 250 + 600.0 * 22 / 23, 450, 600.0 / 23);
          fill(0);
          textFont(createFont("Arial", 15));
          text("struct tss_struct tss", 890, 845);
          noFill();
          strokeWeight(3);
          stroke(color(220, 20, 60));
          rect(880, 250 + 600.0 * 22 / 23.0, 450, 600.0 / 23);
       }
       
    }
    if(millis() - start > 45000 && millis() - start < 76000){
       if(millis() - start < 48000){
          fill(255);
          strokeWeight(1);
          rect(880 - (millis() - start- 45000) * 780 / 3000, 250 + 600.0 * 22 / 23 - (millis() - start- 45000) * 383 / 3000, 450, 600.0 / 23);
          fill(0);
          textFont(createFont("Arial", 15));
          text("struct tss_struct tss", 890 - (millis() - start- 45000) * 780 / 3000, 250 + 622.0 * 22 / 23 - (millis() - start- 45000) * 383 / 3000);
          noFill();
          strokeWeight(3);
          stroke(color(220, 20, 60));
          rect(880 - (millis() - start- 45000) * 780 / 3000, 250 + 600.0 * 22 / 23 - (millis() - start- 45000) * 383 / 3000, 450, 600.0 / 23);
       }
       else{
          fill(255);
          strokeWeight(1);
          rect(100, 440, 450, 600.0 / 23);
          fill(0);
          textFont(createFont("Arial", 15));
          text("struct tss_struct tss", 110, 462);
          noFill();
          strokeWeight(3);
          stroke(color(220, 20, 60));
          rect(100, 440, 450, 600.0 / 23);
       }
       if(millis() - start > 48000){
          extend_line(550, 440, 800, 150, 1000, start + 48000);
          extend_line(550, 440 + 600 / 23, 800, 750, 1000, start + 48000);
       }
       if(millis() - start > 49500){
          tss(800, 150, 1500, 750, start + 49500); 
       }
       if(millis() - start > 52000){
          update_tss(800, 150, 600 / 26, start + 52000, last_pid, pid, priority, 
                    jiffies, ebp, edi, esi, gs, none,
                    ebx, ecx, edx,
                    fs, es, ds,
                    eip, cs, eflags, esp, ss); 
       }
    }
   //if(millis() - start > 7500){
   //   tss(1050.0, 250.0, 1550.0, 850.0, start + 7500);
   //}
}

void update_tss(int x1, int y1, float spacing,
                int start, int last_pid, int pid, int priority, 
                int jiffies, long ebp,long edi,long esi,long gs,long none,
                long ebx,long ecx,long edx,
                long fs,long es,long ds,
                long eip,long cs,long eflags,long esp,long ss){
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 25, 350, spacing, 2000, start);
   move_text("back_link: " + str(0), x1+5 + 350, y1-5 + spacing * 26, 2000, start + 1000);
   move_rect(color(152,251,152), x1, y1 + spacing * 24, 700, spacing, 2000, start + 1000);
   move_text("PAGE_SIZE + (long)p", x1+5, y1-5 + spacing * 25, 2000, start + 2000);
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 23, 350, spacing, 2000, start + 2000);
   move_text("ss0: 0x10", x1+5 + 350, y1-5 + spacing * 24, 2000, start + 3000);
   move_rect(color(152,251,152), x1, y1 + spacing * 17, 700, spacing, 2000, start + 3000);
   move_text("eip: " + str(eip), x1+5, y1-5 + spacing * 18, 2000, start + 4000);
   move_rect(color(152,251,152), x1, y1 + spacing * 16, 700, spacing, 2000, start + 4000);
   move_text("eflags: " + str(eflags), x1+5, y1-5 + spacing * 17, 2000, start + 5000);
   move_rect(color(152,251,152), x1, y1 + spacing * 15, 700, spacing, 2000, start + 5000);
   move_text("eax: " + str(0), x1+5, y1-5 + spacing * 16, 2000, start + 6000);
   move_rect(color(152,251,152), x1, y1 + spacing * 14, 700, spacing, 2000, start + 6000);
   move_text("ecx: " + str(ecx), x1+5, y1-5 + spacing * 15, 2000, start + 7000);
   move_rect(color(152,251,152), x1, y1 + spacing * 13, 700, spacing, 2000, start + 7000);
   move_text("edx: " + str(edx), x1+5, y1-5 + spacing * 14, 2000, start + 8000);
   move_rect(color(152,251,152), x1, y1 + spacing * 12, 700, spacing, 2000, start + 8000);
   move_text("ebx: " + str(ebx), x1+5, y1-5 + spacing * 13, 2000, start + 9000);
   move_rect(color(152,251,152), x1, y1 + spacing * 11, 700, spacing, 2000, start + 9000);
   move_text("esp: " + str(esp), x1+5, y1-5 + spacing * 12, 2000, start + 10000);
   move_rect(color(152,251,152), x1, y1 + spacing * 10, 700, spacing, 2000, start + 10000);
   move_text("ebp: " + str(ebp), x1+5, y1-5 + spacing * 11, 2000, start + 11000);
   move_rect(color(152,251,152), x1, y1 + spacing * 9, 700, spacing, 2000, start + 11000);
   move_text("esi: " + str(esi), x1+5, y1-5 + spacing * 10, 2000, start + 12000);
   move_rect(color(152,251,152), x1, y1 + spacing * 8, 700, spacing, 2000, start + 12000);
   move_text("edi: " + str(edi), x1+5, y1-5 + spacing * 9, 2000, start + 13000);
   
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 7, 350, spacing, 2000, start + 13000);
   move_text("es: " + str(es&65535), x1+5 + 350, y1-5 + spacing * 8, 2000, start + 14000);
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 6, 350, spacing, 2000, start + 14000);
   move_text("cs: " + str(cs&65535), x1+5 + 350, y1-5 + spacing * 7, 2000, start + 15000);
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 5, 350, spacing, 2000, start + 15000);
   move_text("ss: " + str(ss&65535), x1+5 + 350, y1-5 + spacing * 6, 2000, start + 16000);
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 4, 350, spacing, 2000, start + 16000);
   move_text("ds: " + str(ds&65535), x1+5 + 350, y1-5 + spacing * 5, 2000, start + 17000);
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 3, 350, spacing, 2000, start + 17000);
   move_text("fs: " + str(fs&65535), x1+5 + 350, y1-5 + spacing * 4, 2000, start + 18000);
   move_rect(color(152,251,152), x1 + 350, y1 + spacing * 2, 350, spacing, 2000, start + 18000);
   move_text("gs: " + str(gs&65535), x1+5 + 350, y1-5 + spacing * 3, 2000, start + 19000);
   
}

void update_task_struct(int x1, int y1, float spacing,
                int start, int last_pid, int pid, int priority, 
                int jiffies, long ebp,long edi,long esi,long gs,long none,
                long ebx,long ecx,long edx,
                long fs,long es,long ds,
                long eip,long cs,long eflags,long esp,long ss){
   move_rect(color(152,251,152), x1, y1, 450, spacing, 2000, start);
   move_text("TASK_UNINTERRUPTIBLE", x1+5, y1-5 + spacing, 2000, start + 2000);
   move_rect(color(152,251,152), x1, y1 + spacing * 8, 450, spacing, 2000, start + 4000);
   move_text("pid:" + str(last_pid) + " father_pid:" + str(pid) + " leader:" + str(0), x1+5, y1-5 + spacing * 9, 2000, start + 6000);
   move_rect(color(152,251,152), x1, y1 + spacing * 1, 450, spacing, 2000, start + 8000);
   move_text("counter:" + str(priority), x1+5, y1-5 + spacing * 2, 2000, start + 10000);
   move_rect(color(152,251,152), x1, y1 + spacing * 3, 450, spacing, 2000, start + 12000);
   move_text("signal:" + str(0), x1+5, y1-5 + spacing * 4, 2000, start + 14000);
   move_rect(color(152,251,152), x1, y1 + spacing * 11, 450, spacing, 2000, start + 16000);
   move_text("alarm:" + str(0), x1+5, y1-5 + spacing * 12, 2000, start + 18000);
   move_rect(color(152,251,152), x1, y1 + spacing * 12, 450, spacing, 2000, start + 20000);
   move_text("utime:" + str(0) + " stime:" + str(0) + " cutime:" + str(0) + " cstime:" + str(0) + " start_time:" + str(jiffies), x1+5, y1-5 + spacing * 13, 2000, start + 22000);
}


void task_struct(float x1, float y1, float x2, float y2, int start){
    int alpha = (millis() - start) / 10;
    float spacing = (y2 - y1) / 23;
    noFill();
    strokeWeight(1);
    for(int i=0; i<23; i++){
      rect(x1, y1 + i * spacing, x2 - x1, spacing); 
    }
    textFont(createFont("Arial", 15));
    fill(0);
    text("long state", x1 + 10, y1 + spacing - 5);
    text("long counter", x1 + 10, y1 + 2 * spacing - 5);
    text("long priority", x1 + 10, y1 + 3 * spacing - 5);
    text("long signal", x1 + 10, y1 + 4 * spacing - 5);
    text("struct sigaction sigcation[32]", x1 + 10, y1 + 5 * spacing - 5);
    text("long blocked", x1 + 10, y1 + 6 * spacing - 5);
    text("int exit_code", x1 + 10, y1 + 7 * spacing - 5);
    text("unsigned long start_code, end_code, end_ data, brk, start_stack", x1 + 10, y1 + 8 * spacing - 5);
    text("long pid, father, pgrp, session, leader", x1 + 10, y1 + 9 * spacing - 5);
    text("unsigned short uid, euid, suid", x1 + 10, y1 + 10 * spacing - 5);
    text("unsigned short git, egid, sgid", x1 + 10, y1 + 11 * spacing - 5);
    text("long alarm", x1 + 10, y1 + 12 * spacing - 5);
    text("long utime, stime, cutime, cstime, start_time", x1 + 10, y1 + 13 * spacing - 5);
    text("unsigned short used_math", x1 + 10, y1 + 14 * spacing - 5);
    text("int tty", x1 + 10, y1 + 15 * spacing - 5);
    text("unsigned short used_math", x1 + 10, y1 + 16 * spacing - 5);
    text("stuct m_inode * pwd", x1 + 10, y1 + 17 * spacing - 5);
    text("stuct m_inode * root", x1 + 10, y1 + 18 * spacing - 5);
    text("stuct m_inode * executable", x1 + 10, y1 + 19 * spacing - 5);
    text("unsigned long close_on_exec", x1 + 10, y1 + 20 * spacing - 5);
    text("struct file * filp[NR_OPEN]", x1 + 10, y1 + 21 * spacing - 5);
    text("struct desc_struct ldt[3]", x1 + 10, y1 + 22 * spacing - 5);
    text("struct tss_struct tss, ", x1 + 10, y1 + 23 * spacing - 5);
}

void tss(float x1, float y1, float x2, float y2, int start){
   int alpha = (millis() - start) / 10;
   float half_width = (x2 - x1) / 2;
   float spacing = (y2 - y1) / 26;
   if(millis() - start < 2000){
      noStroke();
   }
   else{
      strokeWeight(1); 
   }
   
   fill(255, 192, 203, alpha);
   rect(x1, y1, half_width, spacing);
   fill(200, alpha);
   rect(x1 + half_width, y1, half_width, spacing);
   
   fill(200, alpha);
   rect(x1, y1 + spacing, half_width, spacing);
   fill(255, 192, 203, alpha);
   rect(x1 + half_width, y1 + spacing, half_width, spacing); 
   
   for(int i=2; i<=7; i++){
     fill(200, alpha);
     rect(x1, y1 + spacing * float(i), half_width, spacing);
     fill(green, alpha);
     rect(x1 + half_width, y1 + spacing * float(i), half_width, spacing);  
   }
   for(int i=8; i<=17; i++){
      fill(green, alpha);
      rect(x1, y1 + spacing * float(i), x2 - x1, spacing);
   }
   fill(255, 192, 203, alpha);
   rect(x1, y1 + spacing * 18, x2 - x1, spacing);
   rect(x1, y1 + spacing * 20, x2 - x1, spacing);
   rect(x1, y1 + spacing * 22, x2 - x1, spacing);
   rect(x1, y1 + spacing * 24, x2 - x1, spacing);
   rect(x1 + half_width, y1 + spacing * 19, half_width, spacing);
   rect(x1 + half_width, y1 + spacing * 21, half_width, spacing);
   rect(x1 + half_width, y1 + spacing * 23, half_width, spacing);
   fill(200, alpha);
   rect(x1, y1 + spacing * 19, half_width, spacing);
   rect(x1, y1 + spacing * 21, half_width, spacing);
   rect(x1, y1 + spacing * 23, half_width, spacing);
   rect(x1, y1 + spacing * 25, half_width, spacing);
   fill(green, alpha);
   rect(x1 + half_width, y1 + spacing * 25, half_width, spacing);
   
   if(millis() - start > 2000){
     textFont(createFont("Arial", 15));
     fill(0);
     text("GS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 3);
     text("FS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 4);
     text("DS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 5);
     text("SS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 6);
     text("CS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 7);
     text("ES", 3 * x2 / 4 + x1 / 4, y1 + spacing * 8);
     text("SS2", 3 * x2 / 4 + x1 / 4, y1 + spacing * 20);
     text("SS1", 3 * x2 / 4 + x1 / 4, y1 + spacing * 22);
     text("SS0", 3 * x2 / 4 + x1 / 4, y1 + spacing * 24);
     text("qianyirenwulianjie", 3 * x2 / 4 + x1 / 4, y1 + spacing * 26);
     
     text("EDI", x2 / 2 + x1 / 2, y1 + spacing * 9);
     text("ESI", x2 / 2 + x1 / 2, y1 + spacing * 10);
     text("EBP", x2 / 2 + x1 / 2, y1 + spacing * 11);
     text("ESP", x2 / 2 + x1 / 2, y1 + spacing * 12);
     text("EBX", x2 / 2 + x1 / 2, y1 + spacing * 13);
     text("EDX", x2 / 2 + x1 / 2, y1 + spacing * 14);
     text("ECX", x2 / 2 + x1 / 2, y1 + spacing * 15);
     text("EAX", x2 / 2 + x1 / 2, y1 + spacing * 16);
     text("EFLAGS", x2 / 2 + x1 / 2, y1 + spacing * 17);
     text("EIP", x2 / 2 + x1 / 2, y1 + spacing * 18);
     text("CR3(PDBR)", x2 / 2 + x1 / 2, y1 + spacing * 19);
     text("ESP2", x2 / 2 + x1 / 2, y1 + spacing * 21);
     text("ESP1", x2 / 2 + x1 / 2, y1 + spacing * 23);
     text("ESP0", x2 / 2 + x1 / 2, y1 + spacing * 25);
     
   }
}


void extend_line(int x1, float y1, int x2, float y2, int last_time, int start){
  if(millis() - start > 0){
     if(millis() - start < last_time){
        line(x1, y1, x1 + (millis() - start) * (x2 - x1) / last_time, y1 + (millis() - start) * (y2 - y1)/ last_time);
     }
     else{
        line(x1, y1, x2, y2);
     } 
  }
}

void move_text(String str, float x1, float y1, int time, int start){
  if(millis() - start < time){
     fill(0);
     text(str, 1600 - (millis() - start) * (1600.0 - x1) / time, y1); 
  }
  else{
     fill(0);
     text(str, x1, y1);
  }
}
//shijishangshishenchangjuxing
void move_rect(color c, float x1, float y1, float wid, float len, int time, int start){
  if(0 < millis() - start && millis() - start < time){
     fill(c);
     rect(x1 + wid - (millis() - start) * wid / time, y1, (millis() - start) * wid / time , len); 
  }
  if(millis() - start > time){
     fill(c);
     rect(x1, y1, wid, len);
  }
}void init_shed(){
  // main memory
  fill(255);
  strokeWeight(3);
  stroke(color3);  
  rect(main_memory_x, main_memory_y, main_memory_w, main_memory_l, 20, 20, 20, 20);
  line(main_memory_x, main_memory_y+100, main_memory_x+main_memory_w, main_memory_y+100);
  textSize(23);
  fill(100);
  text("0xA0000",main_memory_x-105,main_memory_y+110);//520,210
  text("0x90200",main_memory_x-105,main_memory_y+335);
  text("0x90000",main_memory_x-105,main_memory_y+365);
  int time = millis(); 
  // bootsect.s part
  fill(100);
  if(time>0&&time<event_time[3]){//draw bootsect.s
    text("0x7c0",main_memory_x-105,main_memory_y+585);
    drawBootsect(time);
  }
  if(time>event_time[3]&&time<event_time[12]){//draw setup.s m
    fill(100);
    drawSetup(time);
  }
  if(time>event_time[4]){//draw system
    fill(100);
    text("0x10000",main_memory_x-105,main_memory_y+535);
    if(time<=event_time[6])
      drawSystem(time);
  }
  // setup.s part
  if(time>event_time[5]){
    drawParameters(time);
  }
  if(time>event_time[6]){
    moveSystem(time);
  }
  if(time>event_time[7]&&time<event_time[13]){
    //line(main_memory_x+main_memory_w,main_memory_y+330,main_memory_x+main_memory_w+150,main_memory_y+230);
    showLine(main_memory_x+main_memory_w,main_memory_y+300,main_memory_x+main_memory_w+100,main_memory_y+220,time-event_time[7],event_time[8]-event_time[7]);
    showLine(main_memory_x+main_memory_w,main_memory_y+330,main_memory_x+main_memory_w+100,main_memory_y+410,time-event_time[7],event_time[8]-event_time[7]);
    showLine(main_memory_x+main_memory_w,main_memory_y+600,main_memory_x+main_memory_w+100,main_memory_y+550,time-event_time[7],event_time[8]-event_time[7]);
    showLine(main_memory_x+main_memory_w-7,main_memory_y+700,main_memory_x+main_memory_w+100,main_memory_y+750,time-event_time[7],event_time[8]-event_time[7]);
  }
  if(time>event_time[8]&&time<event_time[13]){
    showMemory(main_memory_x+main_memory_w+100-12,main_memory_y+220,main_memory_w,190,time-event_time[8],event_time[9]-event_time[8],1);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+220+47,main_memory_x+main_memory_w*2+100-12,main_memory_y+220+47,time-event_time[8],event_time[9]-event_time[8]);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+220+95,main_memory_x+main_memory_w*2+100-12,main_memory_y+220+95,time-event_time[8],event_time[9]-event_time[8]);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+220+142,main_memory_x+main_memory_w*2+100-12,main_memory_y+220+142,time-event_time[8],event_time[9]-event_time[8]);
    showMemory(main_memory_x+main_memory_w+100-12,main_memory_y+550,main_memory_w,200,time-event_time[8],event_time[9]-event_time[8],1);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+550+25,main_memory_x+main_memory_w*2+100-12,main_memory_y+550+25,time-event_time[8],event_time[9]-event_time[8]);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+550+50,main_memory_x+main_memory_w*2+100-12,main_memory_y+550+50,time-event_time[8],event_time[9]-event_time[8]);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+550+75,main_memory_x+main_memory_w*2+100-12,main_memory_y+550+75,time-event_time[8],event_time[9]-event_time[8]);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+550+100,main_memory_x+main_memory_w*2+100-12,main_memory_y+550+100,time-event_time[8],event_time[9]-event_time[8]);
    showLine(main_memory_x+main_memory_w+100-12,main_memory_y+550+125,main_memory_x+main_memory_w*2+100-12,main_memory_y+550+125,time-event_time[8],event_time[9]-event_time[8]);
    textSize(20);
    fill(0);
    text("Data segment descriptor",main_memory_x+main_memory_w+100-8,main_memory_y+220+33);
    text("Code segment descriptor",main_memory_x+main_memory_w+100-8,main_memory_y+220+81);
    text("NULL",main_memory_x+main_memory_w+100+75,main_memory_y+220+128);
    text("Setup.s",main_memory_x+main_memory_w+100+70,main_memory_y+220+176);
    textSize(20);
    text("lib code",main_memory_x+main_memory_w+100+90,main_memory_y+550+15);
    text("fs code",main_memory_x+main_memory_w+100+90,main_memory_y+550+40);
    text("mm code",main_memory_x+main_memory_w+100+90,main_memory_y+550+65);
    text("kernel code",main_memory_x+main_memory_w+100+90,main_memory_y+550+90);
    text("main.c",main_memory_x+main_memory_w+100+90,main_memory_y+550+115);
    textSize(20);
    text("head.s",main_memory_x+main_memory_w+100+80,main_memory_y+550+160);
  }
  if(time>event_time[9]&&time<event_time[13]){
    showMemory2(main_memory_x+main_memory_w+100-12,main_memory_y+220,main_memory_w,47,time-event_time[9],event_time[10]-event_time[9],1);
    showMemory2(main_memory_x+main_memory_w+100-12,main_memory_y+220+47,main_memory_w,48,time-event_time[9],event_time[10]-event_time[9],2);
    fill(0);
    text("Data segment descriptor",main_memory_x+main_memory_w+100-8,main_memory_y+220+33);
    text("Code segment descriptor",main_memory_x+main_memory_w+100-8,main_memory_y+220+81);
  }
  if(time>event_time[10]&&time<event_time[13]){
    noFill();
    stroke(color3);
    float arc_angle1 = -3.14/3.4+2*3.14/3.4*(time-event_time[10])/(event_time[11]-event_time[10]);
    float arc_angle2 = -3.14/2.8+2*3.14/2.8*(time-event_time[10])/(event_time[11]-event_time[10]);
    if(arc_angle1<=3.14/3.4)
      arc(main_memory_x+3*main_memory_w/2+100+40,main_memory_y+485,main_memory_w,(850+320)/2,-3.14/3.4,arc_angle1);
    else
      arc(main_memory_x+3*main_memory_w/2+100+40,main_memory_y+485,main_memory_w,(850+320)/2,-3.14/3.4,3.14/3.4);
    if(arc_angle2<=3.14/2.8)
      arc(main_memory_x+3*main_memory_w/2+100+55,main_memory_y+505,main_memory_w+30,(850+320-207)/2,-3.14/2.8,arc_angle2);
    else{
      arc(main_memory_x+3*main_memory_w/2+100+55,main_memory_y+505,main_memory_w+30,(850+320-207)/2,-3.14/2.8,3.14/2.8);
      fill(color3);
      triangle(main_memory_x+main_memory_w*2+85, 850-30+3,main_memory_x+main_memory_w*2+85, 850-40+3,main_memory_x+main_memory_w*2+80+15, 850-30+3);
    }
  }
  if(time>event_time[11]){
    fill(color5);
    float rect_width = main_memory_w*(time-event_time[11])/(event_time[12]-event_time[11]);
    if(rect_width>main_memory_w-3)
      rect_width=main_memory_w-3;
    noStroke();
    rect(main_memory_x+main_memory_w-1,main_memory_y+300,-rect_width,30);
    stroke(color3);
    strokeWeight(3);
    rect(main_memory_x+main_memory_w-2,main_memory_y+330,-rect_width,0);
    noStroke();
    fill(0);
    strokeWeight(3);
    textSize(23);
    text("setup.s",main_memory_x+85,main_memory_y+320);
  }
  if(time>event_time[12]){  
    moveSystem(time);
  }
  if(time>event_time[13]){
    showLine(main_memory_x+main_memory_w,main_memory_y+600,main_memory_x+main_memory_w+100,main_memory_y+250,time-event_time[13],event_time[13]-event_time[12]);
    showLine(main_memory_x+main_memory_w-7,main_memory_y+700,main_memory_x+main_memory_w+100,main_memory_y+750,time-event_time[13],event_time[13]-event_time[12]);
  }
  if(time>event_time[14]){
    showMemory(main_memory_x+main_memory_w+100-4,main_memory_y+250,main_memory_w,500,time-event_time[14],event_time[15]-event_time[14],1);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+50,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+50,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+100,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+100,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+125,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+125,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+150,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+150,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+175,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+175,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+200,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+200,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+275,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+275,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+300,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+300,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+322,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+322,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+344,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+344,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+366,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+366,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+388,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+388,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+410,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+410,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+433,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+433,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+456,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+456,time-event_time[14],event_time[15]-event_time[14]);
    showLine(main_memory_x+main_memory_w+100-4,main_memory_y+250+478,main_memory_x+main_memory_w*2+100-4,main_memory_y+250+478,time-event_time[14],event_time[15]-event_time[14]);
    fill(0);
    textSize(20);
    text("user stack[1k]",main_memory_x+main_memory_w+100+50,main_memory_y+250+82);
    text("*task[]",main_memory_x+main_memory_w+100+80,main_memory_y+250+144);
    text("task[0]",main_memory_x+main_memory_w+100+80,main_memory_y+250+168);
    text("lib fs mm kernel code",main_memory_x+main_memory_w+100+15,main_memory_y+250+247);
    text("main.c",main_memory_x+main_memory_w+100+90,main_memory_y+250+293);
    textSize(20);
    text("part of head.s",main_memory_x+main_memory_w+100+50,main_memory_y+250+317);
    text("gdt",main_memory_x+main_memory_w+100+90,main_memory_y+250+339);
    text("idt",main_memory_x+main_memory_w+100+90,main_memory_y+250+361);
    text("buffer",main_memory_x+main_memory_w+100+90,main_memory_y+250+383);
    text("page3",main_memory_x+main_memory_w+100+90,main_memory_y+250+405);
    text("page2",main_memory_x+main_memory_w+100+90,main_memory_y+250+427);
    text("page1",main_memory_x+main_memory_w+100+90,main_memory_y+250+450);
    text("page0",main_memory_x+main_memory_w+100+90,main_memory_y+250+472);
    text("The list of page",main_memory_x+main_memory_w+100+30,main_memory_y+250+495);
    textSize(15);
    fill(100);
    text("0x5000",main_memory_x+main_memory_w*2+100,main_memory_y+250+388);
    text("0x4000",main_memory_x+main_memory_w*2+100,main_memory_y+250+410);
    text("0x3000",main_memory_x+main_memory_w*2+100,main_memory_y+250+433);
    text("0x2000",main_memory_x+main_memory_w*2+100,main_memory_y+250+456);
    text("0x1000",main_memory_x+main_memory_w*2+100,main_memory_y+250+478);
    text("0x0000",main_memory_x+main_memory_w*2+100,main_memory_y+250+500);
    //text("head.s",main_memory_x+main_memory_w+100+80,main_memory_y+550+160);
  }
  if(time>event_time[15]){
    main_memory_x = main_memory_x - 10*(time-event_time[15])/(event_time[16]-event_time[15]);
    if(main_memory_x<125)
      main_memory_x=125;
  }
  if(time>event_time[16]&&time<event_time[17]){
    showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+50,main_memory_w,50,time-event_time[16],event_time[17]-event_time[16],3);
    fill(0);
    textSize(20);
    text("user stack[1k]",main_memory_x+main_memory_w+100+50,main_memory_y+250+82);  
}
  if(time>event_time[17]&&time<event_time[23]){
    showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+322,main_memory_w,22,time-event_time[17],event_time[18]-event_time[17],3);
    fill(0);
    textSize(20);
    text("gdt",main_memory_x+main_memory_w+100+90,main_memory_y+250+339);
    showLine(main_memory_x+main_memory_w*2+100-4,main_memory_y+250+322,main_memory_x+main_memory_w*2+100+80,main_memory_y+250,time-event_time[17],event_time[18]-event_time[17]);
    showLine(main_memory_x+main_memory_w*2+100-4,main_memory_y+250+344,main_memory_x+main_memory_w*2+100+80,main_memory_y+750,time-event_time[17],event_time[18]-event_time[17]);
  }
  if(time>event_time[18]&&time<event_time[23]){
    showMemory(main_memory_x+main_memory_w*2+180-4,main_memory_y+250,main_memory_w,500,time-event_time[18],event_time[19]-event_time[18],1);
    for(int i=0;i<13;i++){
      showLine(main_memory_x+main_memory_w*2+180-4,main_memory_y+250+36*(i+1),main_memory_x+main_memory_w*3+180-4,main_memory_y+250+36*(i+1),time-event_time[18],event_time[19]-event_time[18]);
    }
    fill(0);
    textSize(23);
    text("LDTn",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+30);
    text("TSSn",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+66);
    text("...",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+102);
    text("LDT2",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+138);
    text("TSS2",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+174);
    text("LDT1",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+210);
    text("TSS1",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+246);
    text("LDT0",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+282);
    text("TSS0",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+318);
    textSize(15);
    text("System segment descriptor",main_memory_x+main_memory_w*2+180,main_memory_y+250+354);
    text("kernel data segment descriptor",main_memory_x+main_memory_w*2+180,main_memory_y+250+390);
    text("kernel code segment descriptor",main_memory_x+main_memory_w*2+180,main_memory_y+250+426);
    textSize(23);
    text("NULL",main_memory_x+main_memory_w*2+180-4+90,main_memory_y+250+462);
  }
  if(time>event_time[19]&&time<event_time[23]){
    float rect_x = 10*(time-event_time[19])/(event_time[20]-event_time[19]);
    if(rect_x>10)
      rect_x=10;
    for(int i=0;i<rect_x;i++){
      if(i%2==0)
        stroke(color3);
      else
        noStroke();
      line(main_memory_x+main_memory_w*3+180-4+10*i,main_memory_y+250+345,main_memory_x+main_memory_w*3+180-4+10*(i+1),main_memory_y+250+345);
      line(main_memory_x+main_memory_w*3+180-4+10*i,main_memory_y+250+381,main_memory_x+main_memory_w*3+180-4+10*(i+1),main_memory_y+250+381);
      line(main_memory_x+main_memory_w*3+180-4+10*i,main_memory_y+250+415,main_memory_x+main_memory_w*3+180-4+10*(i+1),main_memory_y+250+415);
      noStroke();  
  }
  }
  if(time>event_time[20]&&time<event_time[23]){
    fill(color3);
    triangle(main_memory_x+main_memory_w*3+180-4+100-10,main_memory_y+250+340,main_memory_x+main_memory_w*3+180-4+100-10,main_memory_y+250+350,main_memory_x+main_memory_w*3+180-4+100+10-10,main_memory_y+250+345);
    triangle(main_memory_x+main_memory_w*3+180-4+100-10,main_memory_y+250+376,main_memory_x+main_memory_w*3+180-4+100-10,main_memory_y+250+386,main_memory_x+main_memory_w*3+180-4+100+10-10,main_memory_y+250+381);
    triangle(main_memory_x+main_memory_w*3+180-4+100-10,main_memory_y+250+410,main_memory_x+main_memory_w*3+180-4+100-10,main_memory_y+250+420,main_memory_x+main_memory_w*3+180-4+100+10-10,main_memory_y+250+415);
   }
   if(time>event_time[21]&&time<event_time[23]){
     showMemory2(main_memory_x+main_memory_w*2+180-4,main_memory_y+250+36*9,main_memory_w,36,time-event_time[21],event_time[22]-event_time[21],3);
     showMemory2(main_memory_x+main_memory_w*3+180-4+100,main_memory_y+250+36*9,main_memory_w,36,time-event_time[21],event_time[22]-event_time[21],4);
     textSize(15);
     fill(0);
     text("0x0000000000000000",main_memory_x+main_memory_w*3+180+100+35,main_memory_y+250+354);
     if(time>event_time[21]+1000){
       showMemory2(main_memory_x+main_memory_w*2+180-4,main_memory_y+250+36*10,main_memory_w,36,time-event_time[21]-1000,event_time[22]-event_time[21],3);
       showMemory2(main_memory_x+main_memory_w*3+180-4+100,main_memory_y+250+36*10,main_memory_w,36,time-event_time[21],event_time[22]-event_time[21],4);
       textSize(15);
       fill(0);
       text("0x00c09a0000000fff",main_memory_x+main_memory_w*3+180+100+35,main_memory_y+250+390);
     }
     if(time>event_time[21]+2000){
       showMemory2(main_memory_x+main_memory_w*2+180-4,main_memory_y+250+36*11,main_memory_w,36,time-event_time[21]-2000,event_time[22]-event_time[21],3);
       showMemory2(main_memory_x+main_memory_w*3+180-4+100,main_memory_y+250+36*11,main_memory_w,36,time-event_time[21],event_time[22]-event_time[21],4);
       textSize(15);
       fill(0);
       text("0x00c0920000000fff",main_memory_x+main_memory_w*3+180+100+35,main_memory_y+250+426);
    }
     textSize(15);
     fill(0);
     text("System segment descriptor",main_memory_x+main_memory_w*2+180,main_memory_y+250+354);
     text("kernel data segment descriptor",main_memory_x+main_memory_w*2+180,main_memory_y+250+390);
     text("kernel code segment descriptor",main_memory_x+main_memory_w*2+180,main_memory_y+250+426);
   }
   if(time>event_time[23]&&time<event_time[24]){
     showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+344,main_memory_w,22,time-event_time[23],event_time[24]-event_time[23],3);
     fill(0);
     textSize(20);
     text("idt",main_memory_x+main_memory_w+100+90,main_memory_y+250+361);
   }
   if(time>event_time[24]){
     if(time>event_time[24]&&time<event_time[24]+3000){
       showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+478,main_memory_w,22,time-event_time[24],event_time[25]-event_time[24],3);
       fill(0);
       textSize(20);
       text("The list of page",main_memory_x+main_memory_w+100+30,main_memory_y+250+495);
       }
     if(time>event_time[24]+1000&&time<event_time[24]+4000){
       showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+456,main_memory_w,22,time-event_time[24]-1000,event_time[25]-event_time[24],3);
       fill(0);
       textSize(20);
       text("page0",main_memory_x+main_memory_w+100+90,main_memory_y+250+472);
   }
     if(time>event_time[24]+2000&&time<event_time[24]+5000){
       showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+433,main_memory_w,22,time-event_time[24]-2000,event_time[25]-event_time[24],3);
       fill(0);
       textSize(20);
       text("page1",main_memory_x+main_memory_w+100+90,main_memory_y+250+450);  
   }
     if(time>event_time[24]+3000&&time<event_time[24]+6000){
       showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+410,main_memory_w,22,time-event_time[24]-3000,event_time[25]-event_time[24],3);
       fill(0);
       textSize(20);
       text("page2",main_memory_x+main_memory_w+100+90,main_memory_y+250+427);
     }
     if(time>event_time[24]+4000&&time<event_time[24]+6000){
       showMemory2(main_memory_x+main_memory_w+100-4,main_memory_y+250+388,main_memory_w,22,time-event_time[24]-4000,event_time[25]-event_time[24],3);
       fill(0);
       textSize(20);
       text("page3",main_memory_x+main_memory_w+100+90,main_memory_y+250+405);  
     }
   }
   if(time>event_time[27]){
     showMemory2(main_memory_x+main_memory_w+100-2,main_memory_y+250+275+2,main_memory_w-3,22,time-event_time[27],event_time[28]-event_time[27],5);
     fill(0);
     textSize(20);
     text("main.c",main_memory_x+main_memory_w+100+90,main_memory_y+250+293);
    }
    if(time>event_time[28]){
      showLine(main_memory_x+main_memory_w*2+100-2,main_memory_y+250+275+2+11,main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500,time-event_time[28],event_time[29]-event_time[28]);
    }
    if(time>event_time[29]){
      showMemory(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500,400,720,time-event_time[29],event_time[30]-event_time[29],3);
      for(int i=1;i<12;i++)
        line(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+60*i,main_memory_x+main_memory_w*2+100-2+100+400,main_memory_y+250+275+2+11-500+60*i);
      fill(0);
      textSize(20);
      text("Memory initialization: initialize the memory",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+40);
      text("Trap initialization: Set the entry address ",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+80);
      text("of interrupts 0~47 to IDT",main_memory_x+main_memory_w*2+100-2+100+20,main_memory_y+250+275+2+11-500+110);
      text("Block device initialization: Initializes 32 ",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+140);
      text("device Request items, indicating that ",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+158);
      text("they are not being used.",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+176);
      text("TTY initializition:",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+200);
      text("serial port 1,serial port 2,display,keyboard.",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+230);
      text("Time initializition:Read the detailed time ",main_memory_x+main_memory_w*2+100-2+100+6,main_memory_y+250+275+2+11-500+260);
      text("when the current system starts",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+290);
      text("Task 0 initializition:Set parameter",main_memory_x+main_memory_w*2+100-2+100+6,main_memory_y+250+275+2+11-500+340);
      text("Buffer initializition:192~640KB 1MB~4MB",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+400);
      text("Set the 46th interrupt, that is,the processing",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+440);
      text("function of the hard disk interrupt",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+470);
      text("Set the floppy disk interrupt setting ",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+500);
      text("floppy disk interrupt processing function",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+530);
      text("sti",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+580);
      text("move to user mode",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+640);
      text("task 1",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+700);
  }
    if(time>event_time[30]&&time<event_time[31]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500,400,60,time-event_time[30],event_time[31]-event_time[30],3);
      fill(0);
      textSize(20);
      text("Memory initialization: initialize the memory",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+40);
      }
    if(time>event_time[31]&&time<event_time[32]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+60,400,60,time-event_time[31],event_time[32]-event_time[31],3);
      fill(0);
      textSize(20);
      text("Trap initialization: Set the entry address ",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+80);
      text("of interrupts 0~47 to IDT",main_memory_x+main_memory_w*2+100-2+100+20,main_memory_y+250+275+2+11-500+110);
      }
    if(time>event_time[32]&&time<event_time[33]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+120,400,60,time-event_time[32],event_time[33]-event_time[32],3);
      fill(0);
      textSize(20);
      text("Block device initialization: Initializes 32 ",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+140);
      text("device Request items, indicating that ",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+158);
      text("they are not being used.",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+176);
      }
    if(time>event_time[33]&&time<event_time[34]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+180,400,60,time-event_time[33],event_time[34]-event_time[33],3);
      fill(0);
      textSize(20);
      text("TTY initializition:",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+200);
      text("serial port 1,serial port 2,display,keyboard.",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+230);
      }
    if(time>event_time[34]&&time<event_time[35]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+240,400,60,time-event_time[34],event_time[35]-event_time[34],3);
      fill(0);
      textSize(20);
      text("Time initializition:Read the detailed time ",main_memory_x+main_memory_w*2+100-2+100+6,main_memory_y+250+275+2+11-500+260);
      text("when the current system starts",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+290);
      }
    if(time>event_time[35]&&time<event_time[36]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+300,400,60,time-event_time[35],event_time[36]-event_time[35],3);
      fill(0);
      textSize(20);
      text("Task 0 initializition:Set parameter",main_memory_x+main_memory_w*2+100-2+100+6,main_memory_y+250+275+2+11-500+340);
      tss(main_memory_x+main_memory_w*2+100-2+100+400+10,main_memory_y+250+275+2+11-500+300-90,main_memory_x+main_memory_w*2+100-2+100+400+380,main_memory_y+250+275+2+11-500+300+300,time,event_time[35]);
      update_tss(main_memory_x+main_memory_w*2+100-2+100+400+10,main_memory_y+250+275+2+11-500+300-90,15,event_time[35]+2000,0,0,0,17,0,0,0,17,17,17,0,17,0,0,17);
   }
    if(time>event_time[36]&&time<event_time[37]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+360,400,60,time-event_time[36],event_time[37]-event_time[36],3);
      fill(0);
      textSize(20);
      text("Buffer initializition:192~640KB 1MB~4MB",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+400);
      }
    if(time>event_time[37]&&time<event_time[38]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+420,400,60,time-event_time[37],event_time[38]-event_time[37],3);
      fill(0);
      textSize(20);
      text("Set the 46th interrupt, that is,the processing",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+440);
      text("function of the hard disk interrupt",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+470);
      }
    if(time>event_time[38]&&time<event_time[39]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+480,400,60,time-event_time[38],event_time[39]-event_time[38],3);
      fill(0);
      textSize(20);
      text("Set the floppy disk interrupt setting ",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+500);
      text("floppy disk interrupt processing function",main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+530);
      }
    if(time>event_time[39]&&time<event_time[40]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+540,400,60,time-event_time[39],event_time[40]-event_time[39],3);
      fill(0);
      textSize(20);
      text("sti",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+580);
      }
    if(time>event_time[40]&&time<event_time[41]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+600,400,60,time-event_time[40],event_time[41]-event_time[40],3);
      fill(0);
      textSize(20);
      text("move to user mode",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+640);
      }
    if(time>event_time[41]&&time<event_time[42]){
      showMemory2(main_memory_x+main_memory_w*2+100-2+100,main_memory_y+250+275+2+11-500+660,400,60,time-event_time[41],event_time[42]-event_time[41],3);
      fill(0);
      textSize(20);
      text("task 1",main_memory_x+main_memory_w*2+100-2+100+10,main_memory_y+250+275+2+11-500+700);
    }
    if(time>event_time[43]){
      float alpha = 255*(time-event_time[40])/(event_time[44]-event_time[40]);
      fill(color1,alpha);
      rect(0,0,1600,900);
    }
   
}

void drawBootsect(int time){
  fill(color6);
  noStroke();
  if(time<event_time[1]){
    float rect_width = main_memory_w*time/(event_time[1]-event_time[0]);
    if(rect_width>main_memory_w-3)
      rect_width=main_memory_w-3;
    rect(main_memory_x+2,main_memory_y+550,rect_width,30);
    fill(0);
    text("bootsect.s",main_memory_x+65,main_memory_y+570);
  }
  else {//time<event_time[3]
    float rect_y = 220*(time-event_time[1])/(event_time[2]-event_time[1]);
    if(rect_y>220)
      rect_y=220;
    for(int i=0;i<25;i++){
      if(i%2==0)
        stroke(color3);
      else
        noStroke();
      line(main_memory_x+main_memory_w/25*i,main_memory_y+550,main_memory_x+main_memory_w/25*(i+1),main_memory_y+550);
      line(main_memory_x+main_memory_w/25*i,main_memory_y+570,main_memory_x+main_memory_w/25*(i+1),main_memory_y+570);
      noStroke();  
  }
    rect(main_memory_x+2,main_memory_y+550-rect_y,main_memory_w-3,30);
    fill(0);
    text("bootsect.s",main_memory_x+65,main_memory_y+570-rect_y);
  }
}
void drawSetup(int time){
  fill(color5);
  noStroke();
  if(time<event_time[5]){
    fill(color6);
    rect(main_memory_x+2,main_memory_y+330,main_memory_w-3,30);
    fill(0);
    text("bootsect.s",main_memory_x+65,main_memory_y+350);
    fill(color5);
  }
  if(time>event_time[5])
    fill(color6);
  float rect_width = main_memory_w*(time-event_time[3])/(event_time[4]-event_time[3]);
  if(rect_width>main_memory_w-3)
    rect_width=main_memory_w-3;
  rect(main_memory_x+2,main_memory_y+300,rect_width,30);
  stroke(color3);
  strokeWeight(3);
  rect(main_memory_x+2,main_memory_y+330,rect_width,0);
  noStroke();
  fill(0);
  if(time<event_time[11])
    text("setup.s",main_memory_x+85,main_memory_y+320);
}
void drawSystem(int time){
  noStroke();
  float rect_length = 100*(time-event_time[4])/(event_time[5]-event_time[4]);
  fill(color7);
  if(rect_length<30){
    rect(main_memory_x+2,main_memory_y+535-rect_length,250-3,rect_length);
    fill(20);
    text("head.s",main_memory_x+80,main_memory_y+525);
  }
  else{
    rect(main_memory_x+2,main_memory_y+505,250-3,30);
    fill(0);
    text("head.s",main_memory_x+80,main_memory_y+525);
    fill(color5);
    if(rect_length>100)
      rect_length=100;
    rect(main_memory_x+2,main_memory_y+535-rect_length,250-3,rect_length-30);
    fill(0);
    text("system",main_memory_x+80,main_memory_y+490);
  }
}
// setup.s part
void drawParameters(int time){
  fill(color5);
  noStroke();
  float rect_width = main_memory_w*(time-event_time[5])/(event_time[6]-event_time[5]);
  if(rect_width>main_memory_w-3)
    rect_width=main_memory_w-3;
  noStroke();
  rect(main_memory_x+2,main_memory_y+330+2,rect_width,30);
  fill(0);
  text("System parameters",main_memory_x+20,main_memory_y+350);
}
void moveSystem(int time){
  float rect_y = 165*(time-event_time[6])/(event_time[6]-event_time[5]);
  if(rect_y>165)
    rect_y=165;
  fill(color5);
  rect(main_memory_x+2,main_memory_y+435+rect_y,main_memory_w-3,70);
  fill(0);
  text("system",main_memory_x+80,main_memory_y+490+rect_y);
  fill(color7);
  rect(main_memory_x+2,main_memory_y+505+rect_y,250-3,30,0,0,25,25);
  fill(0);
  text("head.s",main_memory_x+80,main_memory_y+525+rect_y);
  if(time>event_time[12]){
    float rect_w = main_memory_w*(time-event_time[12])/(event_time[12]-event_time[11]);
    if(rect_w>main_memory_w)
      rect_w=main_memory_w;
    fill(color6);
    rect(main_memory_x+2,main_memory_y+670,rect_w-3,30,0,0,25,25);
    fill(0);
    text("head.s",main_memory_x+80,main_memory_y+525+rect_y);
  }
  if(time>event_time[27]){
    float rect_w = main_memory_w*(time-event_time[27])/(event_time[28]-event_time[27]);
    if(rect_w>main_memory_w)
      rect_w=main_memory_w;
    fill(color7);
    rect(main_memory_x+main_memory_w,main_memory_y+670,-rect_w+2,30,0,0,25,25);
    fill(0);
    text("head.s",main_memory_x+80,main_memory_y+525+rect_y);
  }
    
}
void showLine(int start_x,int start_y,int end_x,int end_y,float time, int span){
  float middle_x = start_x+(end_x-start_x)*time/span;
  float middle_y = start_y+(end_y-start_y)*time/span;
  strokeWeight(3);
  stroke(color3);
  if(time<span)
    line(start_x,start_y,middle_x,middle_y);
  else
    line(start_x,start_y,end_x,end_y);
}
void showMemory(int x,int y,int w,int l,int time,int span,int direction){//direction 1:l to r;2:r to l;3:top to bottom;bottom to top 
  fill(255);
  stroke(color3);
  strokeWeight(3);
  if(direction==1){//from left to right
    float rect_w = w*time/span;
    if(time<span)
      rect(x,y,rect_w,l,20,20,20,20);
    else
      rect(x,y,w,l,20,20,20,20);
  }
  if(direction==2){//from right to left
    float rect_w = w*time/span;
    if(time<span)
      rect(x,y,-rect_w,l,20,20,20,20);
    else
      rect(x,y,-w,l,20,20,20,20);
  
  }
  if(direction==3){//from top to bottom
    float rect_l = l*time/span;
    if(time<span)
      rect(x,y,w,rect_l);
    else
      rect(x,y,w,l);
  }
  if(direction==4){//from bottom to top
    float rect_l = l*time/span;
    if(time<span)
      rect(x,y,w,-rect_l,20,20,20,20);
    else
      rect(x,y,w,-l,20,20,20,20);
  
  }
}
void showMemory2(int x,int y,int w,int l,int time,int span,int direction){
  fill(color5);
  stroke(color3);
  if(direction==1){
    float rect_w = w*time/span;
    if(time<span)
      rect(x,y,rect_w,l,20,20,0,0);
    else
      rect(x,y,w,l,20,20,0,0);
  }
  if(direction==2){
    float rect_w = w*time/span;
    if(time<span)
      rect(x,y,rect_w,l);
    else
      rect(x,y,w,l);
  }
  if(direction==3){
    fill(color8);
    float rect_w = w*time/span;
    if(time<span)
      rect(x,y,rect_w,l);
    else
      rect(x,y,w,l);
  }
  if(direction==4){
    fill(255);
    float rect_w = w*time/span;
    if(time<span)
      rect(x,y,rect_w,l);
    else
      rect(x,y,w,l);
  }
  if(direction==5){
    noStroke();
    fill(color6);
    float rect_w = w*time/span;
    if(time<span)
      rect(x,y,rect_w,l);
    else
      rect(x,y,w,l);
  }
}
void tss(float x1, float y1, float x2, float y2, int time, int start){
   int alpha = (time - start) / 10;
   float half_width = (x2 - x1) / 2;
   float spacing = (y2 - y1) / 26;
   if(time - start < 2000){
      noStroke();
   }
   else{
      strokeWeight(1); 
      stroke(0);
   }
   System.out.println(time+" "+start);
   fill(255, 192, 203, alpha);
   rect(x1, y1, half_width, spacing);
   fill(200, alpha);
   rect(x1 + half_width, y1, half_width, spacing);
   
   fill(200, alpha);
   rect(x1, y1 + spacing, half_width, spacing);
   fill(255, 192, 203, alpha);
   rect(x1 + half_width, y1 + spacing, half_width, spacing); 
   
   for(int i=2; i<=7; i++){
     fill(200, alpha);
     rect(x1, y1 + spacing * float(i), half_width, spacing);
     fill(152, 251, 152, alpha);
     rect(x1 + half_width, y1 + spacing * float(i), half_width, spacing);  
   }
   for(int i=8; i<=17; i++){
      fill(152, 251, 152, alpha);
      rect(x1, y1 + spacing * float(i), x2 - x1, spacing);
   }
   fill(255, 192, 203, alpha);
   rect(x1, y1 + spacing * 18, x2 - x1, spacing);
   rect(x1, y1 + spacing * 20, x2 - x1, spacing);
   rect(x1, y1 + spacing * 22, x2 - x1, spacing);
   rect(x1, y1 + spacing * 24, x2 - x1, spacing);
   rect(x1 + half_width, y1 + spacing * 19, half_width, spacing);
   rect(x1 + half_width, y1 + spacing * 21, half_width, spacing);
   rect(x1 + half_width, y1 + spacing * 23, half_width, spacing);
   fill(200, alpha);
   rect(x1, y1 + spacing * 19, half_width, spacing);
   rect(x1, y1 + spacing * 21, half_width, spacing);
   rect(x1, y1 + spacing * 23, half_width, spacing);
   rect(x1, y1 + spacing * 25, half_width, spacing);
   fill(152, 251, 152, alpha);
   rect(x1 + half_width, y1 + spacing * 25, half_width, spacing);
   
   if(time - start > 2000){
     textFont(createFont("Arial", 15));
     fill(0);
     text("GS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 3);
     text("FS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 4);
     text("DS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 5);
     text("SS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 6);
     text("CS", 3 * x2 / 4 + x1 / 4, y1 + spacing * 7);
     text("ES", 3 * x2 / 4 + x1 / 4, y1 + spacing * 8);
     text("SS2", 3 * x2 / 4 + x1 / 4, y1 + spacing * 20);
     text("SS1", 3 * x2 / 4 + x1 / 4, y1 + spacing * 22);
     text("SS0", 3 * x2 / 4 + x1 / 4, y1 + spacing * 24);
     text("back_link", 3 * x2 / 4 + x1 / 4, y1 + spacing * 26);
     
     text("EDI", x2 / 2 + x1 / 2, y1 + spacing * 9);
     text("ESI", x2 / 2 + x1 / 2, y1 + spacing * 10);
     text("EBP", x2 / 2 + x1 / 2, y1 + spacing * 11);
     text("ESP", x2 / 2 + x1 / 2, y1 + spacing * 12);
     text("EBX", x2 / 2 + x1 / 2, y1 + spacing * 13);
     text("EDX", x2 / 2 + x1 / 2, y1 + spacing * 14);
     text("ECX", x2 / 2 + x1 / 2, y1 + spacing * 15);
     text("EAX", x2 / 2 + x1 / 2, y1 + spacing * 16);
     text("EFLAGS", x2 / 2 + x1 / 2, y1 + spacing * 17);
     text("EIP", x2 / 2 + x1 / 2, y1 + spacing * 18);
     text("CR3(PDBR)", x2 / 2 + x1 / 2, y1 + spacing * 19);
     text("ESP2", x2 / 2 + x1 / 2, y1 + spacing * 21);
     text("ESP1", x2 / 2 + x1 / 2, y1 + spacing * 23);
     text("ESP0", x2 / 2 + x1 / 2, y1 + spacing * 25);
     
   }
   
}
void update_tss(int x1, int y1, float spacing,
                int start, long ebp,long edi,long esi,long gs,
                long ebx,long ecx,long edx,
                long fs,long es,long ds,
                long eip,long cs,long eflags,long esp,long ss){
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 25, 185, spacing, 2000, start);
   move_text("back_link: " + str(0), x1+5 + 185, y1-5 + spacing * 26, 2000, start + 1000);
   move_rect(color(152,251,152), x1, y1 + spacing * 24, 700, spacing, 2000, start + 1000);
   move_text("PAGE_SIZE + (long)p", x1+5, y1-5 + spacing * 25, 2000, start + 2000);
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 23, 185, spacing, 2000, start + 2000);
   move_text("ss0: 0x10", x1+5 + 185, y1-5 + spacing * 24, 2000, start + 3000);
   move_rect(color(152,251,152), x1, y1 + spacing * 17, 700, spacing, 2000, start + 3000);
   move_text("eip: " + str(eip), x1+5, y1-5 + spacing * 18, 2000, start + 4000);
   move_rect(color(152,251,152), x1, y1 + spacing * 16, 700, spacing, 2000, start + 4000);
   move_text("eflags: " + str(eflags), x1+5, y1-5 + spacing * 17, 2000, start + 5000);
   move_rect(color(152,251,152), x1, y1 + spacing * 15, 700, spacing, 2000, start + 5000);
   move_text("eax: " + str(0), x1+5, y1-5 + spacing * 16, 2000, start + 6000);
   move_rect(color(152,251,152), x1, y1 + spacing * 14, 700, spacing, 2000, start + 6000);
   move_text("ecx: " + str(ecx), x1+5, y1-5 + spacing * 15, 2000, start + 7000);
   move_rect(color(152,251,152), x1, y1 + spacing * 13, 700, spacing, 2000, start + 7000);
   move_text("edx: " + str(edx), x1+5, y1-5 + spacing * 14, 2000, start + 8000);
   move_rect(color(152,251,152), x1, y1 + spacing * 12, 700, spacing, 2000, start + 8000);
   move_text("ebx: " + str(ebx), x1+5, y1-5 + spacing * 13, 2000, start + 9000);
   move_rect(color(152,251,152), x1, y1 + spacing * 11, 700, spacing, 2000, start + 9000);
   move_text("esp: " + str(esp), x1+5, y1-5 + spacing * 12, 2000, start + 10000);
   move_rect(color(152,251,152), x1, y1 + spacing * 10, 700, spacing, 2000, start + 10000);
   move_text("ebp: " + str(ebp), x1+5, y1-5 + spacing * 11, 2000, start + 11000);
   move_rect(color(152,251,152), x1, y1 + spacing * 9, 700, spacing, 2000, start + 11000);
   move_text("esi: " + str(esi), x1+5, y1-5 + spacing * 10, 2000, start + 12000);
   move_rect(color(152,251,152), x1, y1 + spacing * 8, 700, spacing, 2000, start + 12000);
   move_text("edi: " + str(edi), x1+5, y1-5 + spacing * 9, 2000, start + 13000);
   
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 7, 185, spacing, 2000, start + 13000);
   move_text("es: " + str(es&65535), x1+5 + 185, y1-5 + spacing * 8, 2000, start + 14000);
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 6, 185, spacing, 2000, start + 14000);
   move_text("cs: " + str(cs&65535), x1+5 + 185, y1-5 + spacing * 7, 2000, start + 15000);
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 5, 185, spacing, 2000, start + 15000);
   move_text("ss: " + str(ss&65535), x1+5 + 185, y1-5 + spacing * 6, 2000, start + 16000);
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 4, 185, spacing, 2000, start + 16000);
   move_text("ds: " + str(ds&65535), x1+5 + 185, y1-5 + spacing * 5, 2000, start + 17000);
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 3, 185, spacing, 2000, start + 17000);
   move_text("fs: " + str(fs&65535), x1+5 + 185, y1-5 + spacing * 4, 2000, start + 18000);
   move_rect(color(152,251,152), x1 + 185, y1 + spacing * 2, 185, spacing, 2000, start + 18000);
   move_text("gs: " + str(gs&65535), x1+5 + 185, y1-5 + spacing * 3, 2000, start + 19000);
   
}
