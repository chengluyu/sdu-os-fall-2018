class Os{
  
  int INTERVAL = 100;
  final int LOGIC_MODE = 0;
  final int PYSICAL_MODE = 1;
  final int Detail_MODE = 2;
  final int FORK_OP = 3;
  final int SCHED_OP = 4;
  final int EXIT_OP = 5;
  String filePrefix = "data/data";
  int fileIndex = 0;
  ArrayList<Process> proList;
  int lifeSpan;
  int growSpeed;
  int displayMode;
  int oldDisplayMode;
  int selectedProcessIndex;
  JSONArray data;
  boolean isDetail;
  boolean isRunning;
  //some basic information
  int maxFileIndex,maxCounter,minCounter,maxOp,minOp,curOp,curPid;
  int gap;
  
  Os(){
    proList = new ArrayList<Process>();
    lifeSpan = 0;
    growSpeed = 1;
    maxFileIndex = 10000;
    gap = 20;
    displayMode = PYSICAL_MODE;
    isDetail = false;
    isRunning = true;
    loadConfigure();
    swithToState();
  }
  
  void run(){
    update();
    display();
  }
  
  void setSpeed(){
    growSpeed = int((map(speedSlider.getValue(),0,10,0,10)));
  }
  
  void setBackground(){
    //set background by the op
    if(minOp == maxOp){
      background(60,360,360);
    }else{
      float hue = map(curOp,minOp,maxOp,40,70);
      background(hue,360,360);
    }
    
  }
  void loadConfigure(){
    //set some default information
    JSONObject d=loadJSONObject("configure.json");
    this.maxFileIndex = d.getInt("fileCnt") - 1;
    this.maxCounter = d.getInt("maxCounter");
    this.minCounter = d.getInt("minCounter");
    this.maxOp = d.getInt("maxOp");
    this.minOp = d.getInt("minOp");
  }
  
  void display(){
     setBackground();
     /*******************the process section*******************/
    //get the basic position of the group of processes.
    float startX =30 ,startY=30;
    
    //get the height,width of each process.
    float pHeight = (height - startY) / (proList.size() + 1) - gap,pWidth = 150;
    pHeight = min(pHeight,pWidth);
    pWidth = pHeight;
    
    //render the processes depends on the current mode of the os.
    if(displayMode == PYSICAL_MODE){
      for(int i=0;i < proList.size();i++){
        proList.get(i).display(startX,startY + i * (pHeight+gap),pWidth,pHeight,minCounter,maxCounter,0,curPid);
      }
    }else if(displayMode == LOGIC_MODE){
      //change to the structure of a tree and display
      Tree t = new Tree(proList,minCounter,maxCounter,gap,curPid);
      t.display(startX,startY,pWidth,pHeight);
    }else{
      //show the selected process
      proList.get(selectedProcessIndex).display(100,100,pWidth,pHeight,minCounter,maxCounter,1,curPid);
    }
    
    /******************the information**************************/
    //the mode
    String m,o;
    if(isRunning){
      m = "Auto";
    }else{
      m = "Manual";
    }
    
    //the operation
    if(curOp == 3){
      o = "Fork";
    }else if(curOp == 4){
      o = "Sched";
    }else{
      o = "Exit";
    }
    
    PFont font = createFont("Arial Black",50);
    fill(0,0,100);
    textFont(font);
    text("Frame: " + String.valueOf(fileIndex), width - 400, 80);
    text("Mode: " + m, width - 400,150);
    text("OP: " + o, width - 400,220);
  }
  
  void update(){
    if(isRunning){
      if(lifeSpan>=INTERVAL){
        nextState();
        swithToState();
        lifeSpan=0;
      }else{
        lifeSpan += growSpeed;
      }
      setSpeed();
    }
  }
  
  void swithToState(){
   proList.clear();
   String filename=filePrefix+"_"+fileIndex+".json";
   JSONArray data = loadData(filename);
   parseData(data);
  }
  
  JSONArray loadData(String filename){
    //load data 
    JSONArray data = loadJSONArray(filename);
    return data;
  }
  
  void parseData(JSONArray data){
    //starify the data into object  
    for(int i=0;i<data.size();i++){
      JSONObject d = data.getJSONObject(i);
      Process p = new Process(d);
      proList.add(p);
      //get some extra information
      this.curOp = d.getInt("op");
      this.curPid = d.getInt("curPid");
    }
  }
  
  void zoom(int pindex){
    oldDisplayMode = displayMode;
    displayMode = Detail_MODE;
    selectedProcessIndex = pindex;
  }
  
  void back(){
    displayMode = oldDisplayMode;
  }
  void pause(){
    isRunning = false;
  }
  
  void reStart(){
    isRunning = true;
  }
  
  void nextState(){
    if(fileIndex < maxFileIndex){
      fileIndex++;
    }
  }
  
  void previousState(){
    if(fileIndex > 1){
      fileIndex--;
    }
  }
  
}