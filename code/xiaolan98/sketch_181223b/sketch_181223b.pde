PFont f;
String typing = "";
String saved = "";
int num_of_proc = 0;
int[] event_time = new int[100];//{2000,5000, 8000, 11000, 14000, 17000,20000,23000,26000,29000,32000,34000,36000,38000,40000,42000,44000,46000,48000,50000,52000,54000,56000,58000,60000,62000,64000,66000,68000,70000};
color color0 = color(255, 255, 255);
color color1 = color(179,208,237);
color color2 = color(138,183,227);
color color3 = color(34,89,144);
color color4 = color(2,4,7);
color color5 = color(153,204,255);
color color6 = color(255,204,238);
color color7 = color(68,187,187);
color color8 = color(217,191,244);
int main_memory_x = 625;
int main_memory_y = 100;
int main_memory_w = 250;
int main_memory_l = 700;
void setup(){
  smooth(4);
  size(1600, 900);
  for(int i=0;i<36;i++){
    event_time[i] = 2000*(i+1);
  }
  event_time[36] = 2000*37+23000;
  for(int i=37;i<100;i++){
    event_time[i]=23000+2000*(i+1);
  }
}

void draw(){
  background(color1);
  init_shed();
}
// the initial part of linux0.11
void init_shed(){
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
void move_rect(color c, float x1, float y1, float wid, float len, int time, int start){
  if(0 < millis() - start && millis() - start < time){
     fill(c);
     rect(x1 + wid - (millis() - start) * wid / time, y1, (millis() - start) * wid / time , len); 
  }
  if(millis() - start > time){
     fill(c);
     rect(x1, y1, wid, len);
  }
}
