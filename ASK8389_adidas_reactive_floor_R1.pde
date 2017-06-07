// Audio Vars
import ddf.minim.*;
Minim minim;
AudioPlayer track;
int stripeCount;
int resolution = 50;
int stripeW = 50;
int pushIndex[] = {100, 0, -100};
ArrayList<Stripe> stripes;

// Physics Vars
float gravity = 9.0;
float mass = 2.0;

void setup() {
  //size(448, 512);
  size(600, 800);
  
  // Setup Vars
  stripeCount = 3;
  stripes = new ArrayList<Stripe>();
  for(int i = 0; i < stripeCount; i++){
    PVector loc = new PVector(width/stripeCount*i+width/stripeCount/2-stripeW/2+pushIndex[i], 0);
    stripes.add(new Stripe(loc, resolution, stripeW));
  }
  
  // Minim stuff
  minim = new Minim(this);
  track = minim.loadFile("The Passion HiFi - Gotta Get Up.wav", 1024);
  track.loop();
}

void draw() {
  background(0);
  PVector t = new PVector(track.left.get(0)*100,0);
  for(int i = 0; i < stripeCount; i++){
    stripes.get(i).display(t);
  }
  fill(0);
  stroke(255);
  strokeWeight(50);
  float d = track.left.get(0)*100;
  d = map(d, -10, 10, 300, 320);
  ellipse(mouseX, mouseY, d, d);
}