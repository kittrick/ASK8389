class Wander {
  PVector pos;
  float d = 30;
  int index;
  
  Wander(int idx){
    index = idx;
    pos = new PVector(random(width), random(height));
  }
  
  Wander update(){
    float xSeed = index*1000;
    float ySeed = index*2000;
    pos = new PVector(
      map(noise(millis()/5000.0+xSeed),0,1,0,width),
      map(noise(millis()/5000.0+ySeed),0,1,0,height)
    );
    return this;
  }
  
  Wander display(){
    color red = color(255,0,0);
    stroke(red);
    fill(0);
    strokeWeight(5);
    ellipse(pos.x, pos.y, d, d);
    noStroke();
    noFill();
    strokeWeight(1);
    return this;
  }
}