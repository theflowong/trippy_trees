class Leaf {
  
  // ---------- DATA ---------- \\
  
  // pulsating leaves: size
  float size_i;
  float size_f;
  float size;
  int sizeGrow;
  float sizeSpeed;

  // orange leaves color
  float r;
  float g;
    float g_i;
    float g_f;
  float b;
  int colorGrow;
  float color_speed;
    float b_speed;
    float g_speed;
  
  // ---------- CONSTRUCTOR ---------- \\
  
  Leaf(float leaf_r, float leaf_g, float leaf_b) {
    
    // size
    size_i = 5;
    size_f = 15;
    size = random(size_i, size_f);
    sizeGrow = 0;
    sizeSpeed = 0.1;
    
    // color
    r = leaf_r;
    g = leaf_g;
      g_i = leaf_g;
      g_f = 200;
    b = leaf_b;
    colorGrow = 1;
    color_speed = 0.01;
      g_speed = color_speed*(g_f - g_i);
  }
  
  
  // ---------- FUNCTIONS ---------- \\
      
  void pulsateColor() {
    // COPIED FROM MOON
    // increment g and b values
    if (colorGrow == 1) {
      g += g_speed;
    } else if (colorGrow == 0) {
      g -= g_speed;
    }
    
    // check limits to change increment
    if (g > g_f) {
      colorGrow = 0;
    } else if (g < g_i) {
      colorGrow = 1;
    }
    
  }
  
  void pulsateSize() {
    // increment size values
    if (sizeGrow == 1) {
      size += sizeSpeed;
    } else if (sizeGrow == 0) {
      size -= sizeSpeed;
    }
    
    // check limits to change increment
    if (size > size_f) {
      sizeGrow = 0;
    } else if (size < size_i) {
      sizeGrow = 1;
    }
     
  }
      
  // ---------- Draw Leaf ---------- \\
  void display(int x, int y) {
    
    //fill(r, g+random(80), b, 30);
    //ellipse(x+3, y+1, size+16, size+16);

    fill(r, g-80, b, 30);
    ellipse(x+3, y+1-0.2*size, size*2, size*2);

    fill(r, g+80, b, 40);
    ellipse(x-3, y-size, size+8, size+8);

    fill(r, g-70, b, 70);
    ellipse(x+3, y-(2)+1.5*size, size+6, size+6);

    fill(r, g+40, b, 100);
    ellipse(x-2+size, y-(1), size+4, size+4);

    fill(r, g-30, b, 150);
    ellipse(x+6-size, y+3, size*1, size*1);
    
    fill(r, g, b, 250);
    ellipse(x, y, size, size);
    
    
    
    // leaves below
    
    fill(r, g-80, b, 30);
    ellipse(x+3, y+20+6*size, size*2, size*2);

    fill(r, g+80, b, 40);
    ellipse(x-3, 2*y+2*size, size+8, size+8);

    fill(r, g-70, b, 70);
    ellipse(x+3, 1.5*y+1.5*size, size+6, size+6);

    fill(r, g+40, b, 100);
    ellipse(x-2+size, y-(1), size+4, size+4);

    fill(r, g-30, b, 150);
    ellipse(x+6-size, 1.2*y+3, size*1, size*1);
    
    fill(r, g, b, 250);
    ellipse(x-0.5*size, y+130, size, size);
    
    /* PREVIOUS weird horizontal leaves
    
    //fill(r, g, b, 250);
    //ellipse(x+33, y+2, size+28, size+106);

    fill(r, g+random(-20,20), b, 20);
    ellipse(x+3, y+3, size+28, size*3+18-30);
    
    fill(r, g+random(80), b, 30);
    ellipse(x+3, y+1, size+16, size*3+18-30);

    fill(r, g-80, b, 30);
    ellipse(x+3, y+1, size*0.7+16, size*3+18-40);

    fill(r, g+80, b, 40);
    ellipse(x-3, y+1, size*2+18, size+16);

    fill(r, g-70, b, 70);
    ellipse(x+3, y-(2), size*2.5+16, size*2+12-12);

    fill(r, g+40, b, 100);
    ellipse(x-2, y-(1), size+8, size*3+4-15);

    fill(r, g-0, b, 150);
    ellipse(x+6, y+3, size*1.5+3, size+1);

    fill(r, g, b, 200);
    ellipse(x, y, size, size);
    
    */
  }
}