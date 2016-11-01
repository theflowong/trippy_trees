class Moon {
  
  // ---------- DATA ---------- \\

  // location
  float x;
  float y;
  float xf;
  float yf;
  float xy_speed;
  
  // sizing: shrinking
  float size;
  float sizef;
  float shrink_speed;
  int finishedShrinking;
  
  // sizing: pulsing
  float size_grow;
  float size_diff;
  float size_speed;
  
  // color
  float r;
  float g;
    float g_i;
    float g_f;
  float b;
    float b_i;
    float b_f;
  int color_grow;
  float color_speed;
    float b_speed;
    float g_speed;
  
  // ---------- CONSTRUCTOR ---------- \\

  Moon() {
    
    x = 250;
    y = 500;
    xf = 50;
    yf = 50;
    xy_speed = 0.005;

    // shrinking
    size = 180;
    sizef = 40;
    shrink_speed = -0.2; // -0.2
    finishedShrinking = 0;
    
    // pulsing
    size_grow = 1;
    size_diff = 10;
    size_speed = 0.2;
    
    // hue = 50
    r = 255;
    g = 255;
      g_i = 245;
      g_f = 255;
    b = 255;
      b_i = 203;
      b_f = 255;
    color_grow = 0;
    color_speed = 0.01;
      b_speed = color_speed*(b_f - b_i);
      g_speed = color_speed*(g_f - g_i);
  }
  
  // ---------- FUNCTIONS ---------- \\
  
  // ----- move from x,y to xf,yf ----- \\
  void move() {
    // check to see if x,y are at final xf,yf
    if (x > xf) {
      x += xy_speed*(xf-x);
    }
    if (y > yf) {
      y += xy_speed*(yf-y);
    }
  }
  
  // ----- shrink from size to sizef ----- \\
  void shrink() {
    if (size == sizef || size < sizef) {
      finishedShrinking = 1;
    }
    else if (finishedShrinking == 0) {
      if (size > sizef) {
        size += shrink_speed;
      }
    }
  }
  
  // ----- pulsate size ----- \\
  void pulsateSize() {
    if (finishedShrinking == 1) {
      // increment size
      if (size_grow == 1) {
        size += size_speed;
      } else if (size_grow == 0) {
        size -= size_speed;
      }
      
      // check limits to change increment
      if (size > (sizef + size_diff)) {
        size_grow = 0;
      } else if (size < (sizef - size_diff)) {
        size_grow = 1;
      }
    }
  }
  

  
  // ----- pulsate color ----- \\
  
  void pulsateColor() {
    // increment g and b values
    if (color_grow == 1) {
      g += g_speed;
      b += b_speed;
    } else if (color_grow == 0) {
      g -= g_speed;
      b -= b_speed;
    }
    
    // check limits to change increment
    if (g > g_f) {
      color_grow = 0;
    } else if (g < g_i) {
      color_grow = 1;
    }
  }
  
  // ----- draw the ellipse ----- \\
  void display() {
    noStroke();
    
    // draw moon
    fill(r,g,b);
    ellipse(x, y, size, size);
    
    // draw moon spots
    fill(222, 201, 177, 120);
    ellipse(x + size/4,    y + size/19,  size/4,   size/1.5);
    ellipse(x + size/8,    y + size/6,   size/2,   size/4);
    ellipse(x - size/3,    y + size/5,   size/6,   size/4);
    ellipse(x - size/7,    y-size/4,     size/3,   size/5);
  }
  
}