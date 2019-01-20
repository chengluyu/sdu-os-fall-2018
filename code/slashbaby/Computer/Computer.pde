import controlP5.*;
ControlP5 gui;
Slider speedSlider;
Os os;
void setup(){
  //set some settings
  size(800,800);
  background(255);
  ellipseMode(CORNER);
  colorMode(HSB,360,100,100);
  
  //set user interface
  int btHeight = 50, btWidth = 100 , gap = 50;
  int offsetX = 50, offsetY = 30;
  gui = new ControlP5(this);
  gui.addButton("mode").setPosition(offsetX,height - btHeight - offsetY).setSize(btWidth,btHeight);
  gui.addButton("structure").setPosition(offsetX + btWidth + gap, height - btHeight - offsetY).setSize(btWidth,btHeight);
  gui.addButton("next").setPosition(offsetX + (btWidth + gap) * 2,height - btHeight - offsetY).setSize(btWidth,btHeight);
  gui.addButton("previous").setPosition(offsetX + (btWidth + gap) * 3,height - btHeight - offsetY).setSize(btWidth,btHeight);
  speedSlider = gui.addSlider("speed").setPosition(offsetX + (btWidth + gap) * 4,height -30 - offsetY).setRange(0,10);
  
  //create the os object
  os = new Os();
}


void draw(){
  os.run();
}


void mousePressed(){
  if(os.displayMode == 2){
    os.back();
  }else if(!os.isRunning){
    for(int i = 0; i<os.proList.size();i++){
      Process p = os.proList.get(i);
      if(p.isSelected(mouseX,mouseY)){
        os.zoom(i);
        break;
      }
    }
  }
}

public void mode(int value){
  if(os.isRunning){
    os.pause();
  }else{
    os.reStart();
  }
}

public void structure(int value){
  if(os.displayMode == 0){
    os.displayMode = 1;
   }else if(os.displayMode == 1){
     os.displayMode = 0;
   }
}

public void next(int value){
  if(!os.isRunning){
    os.nextState();
    os.swithToState();
  }
}

public void previous(int value){
  if(!os.isRunning){
    os.previousState();
    os.swithToState();
  }
}