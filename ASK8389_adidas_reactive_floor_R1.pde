// Audio Vars
import ddf.minim.*;
Minim minim;
AudioPlayer track;
int resolution = 50;
int stripeW = 50;
float music;
float volume = 40;
ArrayList<Stripe> stripes;

void setup() {
  //size(448, 512);
  size(600, 800);
  
  // Setup Vars
  stripes = new ArrayList<Stripe>();
  
  // Defining Stripe position manually for ease of positioning
  PVector loc = new PVector(width/2+stripeW*2, -20);
  int idx = 0;
  stripes.add(new Stripe(loc, resolution, stripeW, idx++));
  
  loc = new PVector(width/3+stripeW*2, -20);
  stripes.add(new Stripe(loc, resolution, stripeW, idx++));
  
  loc = new PVector(width/3*2+stripeW*2, -20);
  stripes.add(new Stripe(loc, resolution, stripeW, idx++));
  
  // Minim stuff
  minim = new Minim(this);
  track = minim.loadFile("The Passion HiFi - Gotta Get Up.wav", 1024);
  track.loop();
}

void draw() {
  // Clear Screen
  background(0);
  
  // Display each stripe
  for(int i = 0; i < stripes.size(); i++){
    stripes.get(i).display();
  }
  fill(0);
  stroke(255);
  strokeWeight(50);
}