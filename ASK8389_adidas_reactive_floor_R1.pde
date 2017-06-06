// Audio Vars
import ddf.minim.*;
Minim minim;
AudioPlayer track;

// Display Vars
ArrayList<Stripe> stripes;

void setup() {
  // 7x8 panels, 64px per Panel
  size(448, 512);
  
  // Create new Audio Stripe
  stripes = new ArrayList<Stripe>();
  for(int i = 0; i < 3; i++){
    stripes.add(new Stripe());
  }
}

void draw() {
  for(int i = 0; i < stripes.size(); i++){
    Stripe s = stripes.get(i).display();
    s.display();
  }
}