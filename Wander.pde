class Wander {
  PVector pos;
  float d = 30;
  int index;
  
  Wander(int idx){
    index = idx;
    pos = new PVector(random(width), random(height));
  }
  
  Wander update(){
    for(int i = 0; i < 10; i ++){
      float xSeed = millis()+index+100;
      pos.x += map(noise(xSeed),0,1,-1,1);
      float ySeed = millis()+index+100+1000;
      pos.y += map(noise(ySeed),0,1,-1,1);
    }
    //float xSeed = millis()+index+100;
    //pos.x += map(noise(xSeed),0,1,-1,1);
    //float ySeed = millis()+index+100+1000;
    //pos.y += map(noise(ySeed),0,1,-1,1);
    if(pos.x < 0){
      pos.x = width;
    } else if(pos.x > width){
      pos.x = 0;
    }
    if(pos.y < 0){
      pos.y = height;
    } else if(pos.y > height){
      pos.y = 0;
    }
    return this;
  }
  
  Wander display(){
    color red = color(255,0,0);
    stroke(red);
    fill(0);
    strokeWeight(3);
    ellipse(pos.x, pos.y, d, d);
    noStroke();
    noFill();
    strokeWeight(1);
    return this;
  }
}