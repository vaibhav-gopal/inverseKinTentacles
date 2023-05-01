ArrayList<Tentacle> tentacles;

PVector pos;
PVector vel;
PVector gravity;

void setup(){
  size(800,600);
  pos = new PVector(0,0);
  vel = new PVector(4,0);
  gravity = new PVector(0,0.2);
  tentacles = new ArrayList<Tentacle>();
  
  float da = TWO_PI/10;
  for (float a = 0; a < TWO_PI; a += da){
    float x = width/2 + cos(a) * 200;
    float y = height/2 + sin(a) * 200;
    tentacles.add(new Tentacle(x,y));
  }
}

void draw(){
  background(51);
  noFill();
  ellipse(width/2, height/2, 400, 400);
  for (Tentacle t : tentacles){
    t.update();
    t.show();
  }
  
  //BALL STUFF
  vel.add(gravity);
  pos.add(vel);
  noStroke();
  fill(100,255,0);
  ellipse(pos.x,pos.y,16,16);
  
  if (pos.x > width || pos.x < 0){
    vel.x *= -1;
  }
  if (pos.y > height){
    vel.y *= -1;
    pos.y = height;
    vel.mult(map(abs(vel.y), 0, 20, 0.3, 0.9));
  }
}
