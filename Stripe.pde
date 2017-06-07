class Stripe {
  int res;
  PVector pos;
  ArrayList<Link> chain;
  int w;;

  Stripe(PVector position, int resolution, int stripeW){
    w = stripeW;
    res = resolution;
    pos = new PVector(position.x, position.y - w/2);
    chain = new ArrayList<Link>();
    for(int i = 0; i < res; i++){
      chain.add(new Link(0.0, width/2, mass, gravity, i));
    }
  }
  Stripe display(PVector v){
    pushMatrix();
      translate(pos.x, pos.y);
      noStroke();
      fill(255);
      beginShape();
      chain.get(0)
        .update(v);
      vertex(chain.get(0).pos.x, chain.get(0).pos.y);
      for(int i = 1 ; i  < res; i ++){
        chain.get(i)
          .update(chain.get(i-1).pos);
        vertex(chain.get(i).pos.x, chain.get(i).pos.y);
      }
      for(int i = res-1; i  > 0; i --){
        vertex(chain.get(i).pos.x+w, chain.get(i).pos.y);
      }
      vertex(chain.get(0).pos.x+w, chain.get(0).pos.y);
    endShape(CLOSE);
    popMatrix();
    return this;
  }
}