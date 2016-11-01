// animation of trippy trees
// inspired by the breathing life of the Arb and the fall leaves
// by Flo Wong
// October 2016


// --------------- INITIALIZE VARIABLES --------------- \\

// for sky
float sky_ri = 224;
float sky_bi = 246;
float sky_gi = 255;

float sky_r = sky_ri;
float sky_b = sky_bi;
float sky_g = sky_gi;

float sky_rf = 48;
float sky_bf = 43;
float sky_gf = 72;

Moon moon;

Land land;

ArrayList<Tree> trees;
int trees_count = 50;

// for stars
float large_stars = 0;

// --------------- SETUP --------------- \\

void setup() {
  size(500, 500);
  ellipseMode(CENTER);
  frameRate(30);
  smooth();
  
  
  // ---------- Land ---------- \\
  land = new Land();
  
  
  // ---------- Moon ---------- \\
  moon = new Moon();
  
  
  // ---------- Trees ---------- \\
  trees = new ArrayList<Tree>();
  
  // establish random location coordinates for trees
  for (int i = 0; i < trees_count; i+=1) {
    int tree_x = int(random(0, 500));
    int tree_y = int(random(170, 300));
    // maybe use some sort of parabola function for tree_y: 150 to (200 to 300) to 400
    trees.add(new Tree(tree_x, tree_y));
  }
}

void draw() {

  // --------------- BACKGROUND --------------- \\

  if ((sky_r > sky_rf) && (sky_b > sky_bf) && (sky_g > sky_gf)) {
    float speed = 0.01;
    sky_r -= ((sky_ri - sky_rf) * speed);// 244 to 50 48
    sky_b -= ((sky_bi - sky_bf) * speed); // 246 to 50 43
    sky_g -= ((sky_gi - sky_gf) * speed); // 255 to 80 72
  }
  // Create an alpha blended background
  fill(sky_r, sky_b, sky_g, 10);
  rect(0,0,width,height);

  // --------------- STARS --------------- \\

  stroke(random(200, 255), random(180, 255), random(220, 255)); // color
  float starweight = random(1, 4);
  if (starweight == 4) {
    large_stars += 1;
    if (large_stars % 6 != 0) {
      starweight = random(1, 2);
    }
  }
  strokeWeight(starweight);
  // draw one star every 20 frames
  if (frameCount % 20 == 0) {
    point(random(500), random(500));
  }

  // return stroke (may not need this)
  stroke(0); // black stroke
  strokeWeight(1); // weight of stroke

  // --------------- MOON --------------- \\
  moon.move();
  moon.shrink();
  moon.pulsateSize();
  moon.pulsateColor();
  moon.display();

  // --------------- GREEN LAND PASTURE --------------- \\
  land.pulsateColor();
  land.pulsateSize();
  land.display();

  // --------------- TREES --------------- \\
  
  // traverse through trees
  for (int i = 0; i < trees_count; i+=1) {
    Tree tree = trees.get(i);
    
    // after night sky gets dark:
    if (((sky_r > sky_rf) && (sky_b > sky_bf) && (sky_g > sky_gf)) == false) {
      // pulsate root shadows
    }
    tree.pulsate();
        
    tree.display();
  }
}