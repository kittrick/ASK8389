class Link {
  PVector v; // The x- and y-axis velocities
  PVector pos; // The x- and y-coordinates
  PVector a; // The acceleration values
  PVector gravity = new PVector(0, -9.2);
  int index;
  float mass = 2.0;
  float diameter = 5;
  float stiffness = 0.2;
  float damping = 0.7;
  float distance;
  int pIndex;

  Link(float xpos, float ypos, int idx) {
    index = idx;
    pos = new PVector(xpos, ypos);
    a = new PVector(0, 0);
    v = new PVector(0, 0);
  }

  Link update(Stripe parent) {
    pIndex = parent.index;
    PVector target;
    if(index == 0){
      target = new PVector(track.left.get(0)*volume, 0);
      pos.x = parent.pos.x;
      pos.y = parent.pos.y;
    } else {
      target = new PVector(track.left.get(index*20)*volume, 0);
      target.add(parent.chain.get(index-1).pos);
    }
    
    PVector force = PVector.sub(target, pos).mult(stiffness);
    a = PVector.div(force, mass);
    
    applyForce(gravity);
    mouseRepel();
    dampen();
    
    // Makes the chain work
    v.y += 4;
    
    // Add velocity to current position
    pos.add(v);
    
    return this;
  }

  Link display() {
    noStroke();
    fill(255,0,0);
    ellipse(pos.x, pos.y, diameter, diameter);
    fill(255,128);
    return this;
  }

  void mouseRepel() {
    float x = mouseX;
    float y = mouseY;
    
    // Set mouse position to bottom center if it is off screen
    if(x <= 10 || x >= width-10){ x = width / 2; y = height * 4; }
    if(y <= 10 || y >= height-10){ x = width / 2; y = height * 4; }
    
    PVector mouse = new PVector(x, y);
    PVector direction = PVector.sub(mouse, pos);
    direction.normalize();
    
    if(mousePressed){
      direction.mult((pIndex+1));
    } else {
      direction.mult(-(pIndex+1));
    }
    applyForce(direction);
  }
  
  //method to apply a force vector to the particle
  void applyForce(PVector force){
    force.div(mass);
    a.add(force);
  }
  
  void dampen(){
    v = PVector.add(v,a).mult(damping);
  }
}