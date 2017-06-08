class Stripe {
  int res;
  PVector pos;
  ArrayList<Link> chain;
  int w;
  int index;
  color fill;

  Stripe(PVector position, int resolution, int stripeW, color c, int idx){
    fill = c;
    index = idx;
    w = stripeW;
    res = resolution;
    pos = new PVector(position.x - w/2, position.y);
    chain = new ArrayList<Link>();
    for(int i = 0; i < res; i++){
      chain.add(new Link(pos.x, pos.y, i));
    }
  }
  Stripe display(){
      noStroke();
      fill(fill);
      beginShape();
        chain.get(0).update(this);
        vertex(chain.get(0).pos.x-w/2, chain.get(0).pos.y);
        for(int i = 1 ; i  < res; i ++){
          chain.get(i).update(this);
          vertex(chain.get(i).pos.x-w/2, chain.get(i).pos.y);
        }
        for(int i = res-1; i  > 0; i --){
          vertex(chain.get(i).pos.x+w/2, chain.get(i).pos.y);
        }
        vertex(chain.get(0).pos.x+w/2, chain.get(0).pos.y);
      endShape(CLOSE);
    return this;
  }
}