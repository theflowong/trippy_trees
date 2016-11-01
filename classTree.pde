class Tree {
  
  // ---------- DATA ---------- \\
  Stem stem;
  Leaf leaf;
  
  // location (for tip of stem; leaf point)
  int x;
  int y;
  
  // colors for leaf 
  float leaf_r;
  float leaf_g;
  float leaf_b;
  
  // ---------- CONSTRUCTOR ---------- \\
  
  Tree(int tree_x, int tree_y) {
    
    // leaf color values for shades of orange
    leaf_r = random(240, 255);
    leaf_g = random(70, 235);
    leaf_b = random(50, 52);
    
    stem = new Stem();
    leaf = new Leaf(leaf_r, leaf_g, leaf_b);
    
    x = tree_x;
    y = tree_y;
  }
  
  
  // ---------- FUNCTIONS ---------- \\
  void pulsate() {
    stem.pulsateColor();
    stem.pulsateShadowColor();
    leaf.pulsateColor();
    leaf.pulsateSize();
  }
      
  // ---------- Draw Stem & Leaf ---------- \\
  void display() {
    stem.displayShadow(x, y);
    stem.display(x, y);
    leaf.display(x, y);
    
  }
}