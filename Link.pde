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

  Link(float xpos, float ypos, int idx) {
    index = idx;
    pos = new PVector(xpos, ypos);
    a = new PVector(0, 0);
    v = new PVector(0, 0);
  }

  Link update(Stripe parent) {
    
    PVector target;
    if(index == 0){
      target = new PVector(music*40, 0);
      //applyForce(target);
    } else {
      target = parent.chain.get(index-1).pos;
      //applyForce(target);
    }
    
    PVector force = new PVector(
      (target.x - pos.x) * stiffness, 
      (target.y - pos.y) * stiffness
    );

    applyForce(gravity);
    
    
    
    a.x = force.x / mass;
    a.y = force.y / mass;
    
    mouseRepel(mouseX, mouseY);
    
    dampen();
    
    v.y += mass * mass;
    
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

  void mouseRepel(int x, int y) {
    PVector mouse = new PVector(x, y);
    PVector direction = PVector.sub(mouse, pos);
    //distance = direction.mag();
    direction.normalize();
    
    //float force = (gravity*mass) / (distance*distance);
    if(mousePressed){
      direction.mult(-1);
    } else {
      direction.mult(1);
    }
    applyForce(direction);
  }
  
  //method to apply a force vector to the particle
  void applyForce(PVector force){
    force.div(mass);
    a.add(force);
  }
  
  void dampen(){
      v.x = damping * (v.x + a.x);
      v.y = damping * (v.y + a.y);
  }
}