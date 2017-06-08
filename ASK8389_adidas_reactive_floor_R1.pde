// Audio Vars
import ddf.minim.*;
Minim minim;
AudioPlayer track;
int resolution = 50;
int stripeW = 50;
float music;
float volume = 70;
ArrayList<Stripe> stripes;

void setup() {
  //size(448, 512);
  size(600, 800);
  
  // Setup Vars
  stripes = new ArrayList<Stripe>();
  
  // Defining Stripe position manually for ease of positioning
  PVector loc = new PVector(width/2+stripeW*2, -20);
  int idx = 0;
  rgbStripe(loc, idx++);
  
  loc = new PVector(width/3+stripeW*2, -20);
  rgbStripe(loc, idx++);
  
  loc = new PVector(width/3*2+stripeW*2, -20);
  rgbStripe(loc, idx++);
  
  // Minim stuff
  minim = new Minim(this);
  track = minim.loadFile("PassionHifi.wav", 1024);
  track.loop();
}

void draw() {
  // Clear Screen
  background(0);
  
  // Display each stripe
  for(int i = 0; i < stripes.size(); i++){
    blendMode(ADD);
    stripes.get(i).display();
    blendMode(BLEND);
  }
  fill(0);
  stroke(255);
  strokeWeight(50);
  blackStripes();
}

void rgbStripe(PVector loc, int idx){
  stripes.add(new Stripe(loc, resolution, stripeW, color(255,0,0), idx++));
  stripes.add(new Stripe(loc, resolution, stripeW, color(0,255,0), idx++));
  stripes.add(new Stripe(loc, resolution, stripeW, color(0,0,255), idx++));
}

void blackStripes(){
  strokeWeight(2);
  for(int y = 0; y < height; y+=4){
    stroke(0);
    strokeWeight(2);
    line(0,y, width, y);
    noStroke();
  }
  
  for(int x = 0; x < width; x+=4){
    stroke(0);
    strokeWeight(2);
    line(x,0, x, height);
    noStroke();
  }
  strokeWeight(1);
}