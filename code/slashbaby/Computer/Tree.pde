class Node{
  ArrayList<Node> children;
  Process data;
  Node(Process data){
    this.data = data;
    children = new ArrayList<Node>();
  }
  void addChild(Node n){
    children.add(n);
  }
  
  ArrayList<Integer> getDescentCnt(){
    ArrayList<Integer> result = new ArrayList<Integer>();
    result.add(children.size());
    if(children.size() == 0){
      return result;
    }else{
      for(int i = 0; i < children.size(); i++){
        Node n = children.get(i);
        result.add(sum(n.getDescentCnt()));
      }
      return result;
    }
  }
  
  int sum(ArrayList<Integer> a){
    int result = 0;
    for(int i = 0; i < a.size(); i++){
      result += a.get(i);
    }
    return result;
  }
}

class Tree{
  Node root;
  ArrayList<Process> proList;
  float curY;
  float indent;
  int minCounter,maxCounter,gap,curPid;
  Tree(ArrayList<Process> proList,int minCounter,int maxCounter, int gap, int curPid){
    this.proList = proList;
    this.minCounter = minCounter;
    this.maxCounter = maxCounter;
    this.gap = gap;
    this.curPid = curPid;
    for(Process p:proList){
      addToTree(p);
    }
  }
  void addToTree(Process p ){
    if(p.pid == 0){
      root = new Node(p);
    }else{
      Node n = findParent(p.father,root);
      if(n !=null){
        n.addChild(new Node(p));
      }else{
        println("Failed to find father");
      }
      
    }
  }
  
  Node findParent(long father,Node curNode){
    if(father != -1){
      if(curNode.data.pid == father){
        return curNode;
      }else{
        for(Node n:curNode.children){
          Node result = findParent(father,n);
          if(result != null){
            return result;
          }
        }
      }
    }
    return null;
  }
  
  void display(float startX ,float startY ,float pWidth, float pHeight){
    curY = startY;
    dfs(root,startX,curY,pWidth,pHeight,0);
  }
  
  void dfs(Node n, float x, float y, float pWidth, float pHeight, int type){
    if(n != null ){
      
      //draw the branch to the left
      strokeWeight(5);
      stroke(30,1,80);
      indent = pWidth + gap;
      float x1 = x - (indent - pWidth / 2);
      float y1 = y + pHeight / 2;
      float x2 = x + pWidth / 2;
      float y2 = y1;
      
      if(type != 0){
        line(x1,y1,x2,y2);
      }
      
      //draw the branch to the bottom
      int lineCnt = 0;
      ArrayList<Integer> a = n.getDescentCnt();
      for(int i = 0; i < a.size(); i++){
        if(i != a.size() - 1){
          lineCnt += a.get(i);
        }
      }
      
      float x3 = x + pWidth / 2;
      float y3 = y + pHeight;
      float x4 = x3;
      float y4 = y3 + (pHeight + gap) * lineCnt - pHeight / 2;
      line(x3,y3,x4,y4);
      
      
      //draw the node
      n.data.display(x,y,pWidth,pHeight,minCounter,maxCounter,0,curPid);
      
      for(Node c:n.children){
        curY += pHeight + gap;
        dfs(c,x + indent,curY,pWidth,pHeight,1);
      }
    }
  }
}