class Link {
  PVector v; // The x- and y-axis velocities
  PVector pos; // The x- and y-coordinates
  PVector a; // The acceleration values
  int index;
  float gravity;
  float mass;
  float diameter = 5;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Link(float xpos, float ypos, float m, float g, int idx) {
    index = idx;
    pos = new PVector(xpos, ypos);
    a = new PVector(0,0);
    v = new PVector(0,0);
    mass = m;
    gravity = g;
  }
  
  Link update(PVector target) {
    PVector force = new PVector(
      (target.x - pos.x) * stiffness,
      (target.y - pos.y) * stiffness // + height/2-mouseY
    );
    
    force.y += gravity/4;
    a.x = force.x / mass;
    a.y = force.y / mass;
    v.x = damping * (v.x + a.x);
    v.y = damping * (v.y + a.y);
    pos.x += v.x;
    pos.y += v.y;
    
    PVector mouse = new PVector(map(mouseX,0,width,-100,100), map(mouseY,0,height, 0, height/2));
    PVector copy = mouse.get();
    copy.div(mass);
    pos.add(copy);
    
    return this;
  }
  
  Link display() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, diameter, diameter);
    return this;
  }
}