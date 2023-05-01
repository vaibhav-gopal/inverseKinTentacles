class Tentacle{
  Segment[] segments = new Segment[35];
  PVector base;
  float len = 5;
  
  Tentacle(float x, float y){
    segments[0]= new Segment(x, y, len); 
    for (int i = 1; i < segments.length; i++){
      segments[i] = new Segment(segments[i-1], len);
     }
    base = new PVector(x,y);
  }
  
  void update(){
    int total = segments.length;
    
    Segment end = segments[total - 1]; 
    end.follow(pos.x,pos.y);
    end.update();
  
    for (int i = total-2; i >= 0; i--){
      segments[i].follow(segments[i+1]);
      segments[i].update();
    }
    
    //fixes the base
    segments[0].setA(base);
  
    //fixes the joints
    for (int i = 1; i < total; i++){
      segments[i].setA(segments[i-1].b);
    }
  }
  
  void show(){
    for (Segment t : segments){
      t.show();
    }
  }
  
}
