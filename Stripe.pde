class Stripe {
  PVector pos;
  Stripe(){
    float x = random(0,width);
    float y = random(0,height);
    pos = new PVector(x, y);
  }
  public Stripe update(){
    return this;
  }
  public Stripe display(){
    stroke(0);
    fill(255);
    ellipse(this.pos.x, this.pos.y, 10, 10);
    return this;
  }
}