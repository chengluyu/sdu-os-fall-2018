node n1;
PFont f;
String typing = "";
String saved = "";
node[] n = new node[64];
int num_of_proc = 0;
int[] event_time = new int[]{5000, 10000, 15000, 20000, 25000};
color color0 = color(255, 255, 255);
color color1 = color(179, 208, 237);
color color2 = color(138, 183, 227);
color color3 = color(34, 89, 144);
color color4 = color(2, 4, 7);
void setup(){
  smooth(4);
  background(color1);
  size(1600, 900);
//  frameRate(4);
}

void draw(){
   background(255);
   
   show_proc1(0, 1, 0, 15, 
              1, 155272,4092,917504,23,30319,
              3,21992,33,
              23,23,23,
              26802,15,514,155248,23);
   delete_proc(76000);
}

void clear_all(int start){
   node_transparency(millis(), start);
   noStroke();
   rect(0, 0, 1600, 900);
}

void delete_proc(int start){
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
         fill(255, (millis() - start - 32000) * 255 / 2000);
         rect(0, 0, 1600, 900);
      }
   }
}

void show_proc1(int start, int last_pid, int pid, int priority, 
                int jiffies, long ebp,long edi,long esi,long gs,long none,
                long ebx,long ecx,long edx,
                long fs,long es,long ds,
                long eip,long cs,long eflags,long esp,long ss){
   if(millis() - start > 73000 && millis() - start < 76000){
      translate((millis() - start - 72000) * 1600 / 3000, 0); 
   } 
   else{
      translate(0, 0);
   }
   if(0 < millis() - start && millis() - start < 45000){
       if(millis() - start > 500){
          strokeWeight(3);
          stroke(0, (millis() - start - 500) * 255 / 1000);
          fill(0, (millis() - start - 500) * 255 / 1000);
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

          line(100, 50, 1500, 50);
          line(100, 150, 1500, 150);
          for(int i=0; i<=5; i++){
            line(100 + i * 100, 50, 100 + i * 100, 150);
            line(1500 - i * 100, 50, 1500 - i * 100, 150);
          }
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
               fill(152, 251, 152);
               noStroke();
               rect(540, 535, 250, 30);
               triangle(870, 550, 790, 596.189, 790, 503.811);
               fill(0);
               textFont(createFont("Arial", 20));
               text("copy father's task_struct", 540, 530);
            }
          }
          else{
            fill(152, 251, 152);
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
  if(time - start < 255 * 100){
      fill(255, (time - start) / 100);
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
}
