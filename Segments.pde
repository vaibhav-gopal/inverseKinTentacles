class Segment {
  PVector a = new PVector();
  PVector b = new PVector();
  float angle = 0;
  float len;
  
  Segment(float x, float y, float len_){
    a = new PVector(x,y);
    len = len_;
    
    updateB();
  }
  
  Segment(Segment parent, float len_){ 
    len = len_;
    a = parent.b.copy();
    
    updateB();
  }
  
  void follow(Segment child){
    float targetX = child.a.x;
    float targetY = child.a.y;
    follow(targetX,targetY);
  }
  
  void follow(float tx, float ty){
    PVector target = new PVector(tx,ty);
    PVector dir = PVector.sub(target, a);
    angle = dir.heading();
    
    dir.setMag(-len);
    
    a = PVector.add(target, dir);
    
  }
    
  void updateB(){
    float dx = len * cos(angle);
    float dy = len * sin(angle);
    b.set(a.x+dx, a.y+dy);
  }
  
  void setA(PVector pos){
    a = pos.copy();
    updateB();
  }
  
  void show(){
    stroke(255);
    strokeWeight(4);
    line(a.x,a.y,b.x,b.y);
  }
  
  void update() {
    updateB();
  }
}
