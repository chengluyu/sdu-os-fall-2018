class node{
  int pos_x;
  int pos_y;
  int width;
  int length;
  
  node(int pos_x, int pos_y, int width, int length){
    this.pos_x = pos_x;
    this.pos_y = pos_y;
    this.width = width;
    this.length = length;
  }
  
  void paint_trangle(){
    rect(pos_x, pos_y, width, length, 10, 10, 10, 10);
  }
}
