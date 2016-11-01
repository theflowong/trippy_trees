class Stem {
  
  // ---------- DATA ---------- \\
  
  // color for stem (pulsate R value)
  float rgb;
  float r;
    float r_f;
    float r_i;
  float g;
    float g_f;
    float g_i;
  float b;
    float b_f;
    float b_i;
  int colorGrow;
  
  float colorSpeed;
    float r_speed;
    float g_speed;
    float b_speed;
  
  // color for stem shadow (pulsate opacity)
  float shad_op;
  int shadow_grow;
  float shadow_speed; // or 0.005?
    
  // ---------- CONSTRUCTOR ---------- \\
  
  Stem() {
    
    // color for stem
    rgb = random(0,1);
    
    // from 208, 212, 232 to 211, 191, 173
    r_f = 208; //132
    r_i = 113; //95
    r = r_i + rgb*(r_f - r_i);
    
    g_f = 212;
    g_i = 109;
    g = g_i + rgb*(g_f - g_i);
    
    b_f = 232;
    b_i = 105;
    b = b_i + rgb*(b_f - b_i);
    
    colorGrow = 1;
    colorSpeed = 0.01;
      r_speed = colorSpeed*(r_f - r_i);
      g_speed = colorSpeed*(g_f - g_i);
      b_speed = colorSpeed*(b_f - b_i);
    
    // color for shadow
    shad_op = 30;
    shadow_grow = 1;
    shadow_speed = 1; // or 0.005?
  }
  
  
  // ---------- FUNCTIONS ---------- \\
      
  void pulsateColor() { // pulsate R value    
    // check R value of roots
    if (r > r_f) {
      colorGrow = 0;
    } else if (r < r_i) {
      colorGrow = 1;
    }
    // check if the r value of roots need to grow or shrink
    if (colorGrow == 1) {
      r += r_speed;
      g += g_speed;
      b += b_speed;
    } else if (colorGrow == 0) {
      r -= r_speed;
      g -= g_speed;
      b -= b_speed;
    }
  }
  
  void pulsateShadowColor() {
    // check intensity of shadow
     if (shad_op > 100) {
     shadow_grow = 0;
     } else if (shad_op < 40) {
     shadow_grow = 1;
     }
     // check if the shadows need to grow or shrink
     if (shadow_grow == 1) {
     shad_op += shadow_speed;
     } else if (shadow_grow == 0) {
     shad_op -= shadow_speed;
     }
  }
  
  void display(int x, int y) {
    fill(r, g, b);
    quad(x, y, x-4, y+200, x, y+200-10, x+4, y+200);
  }
  
  void displayShadow(int x, int y) {
    fill(50, 50, 50, shad_op);
    // for trunk shading // INVESTIGATE & FIX SOMEHOW
    quad(x, y+200, x-4, y+200, x, y+200-10, x+4, y+200);

    // for the actual shadow
    quad(12000, 9000, x-4, y+200, x, y+200-10, x+4, y+200);
  }
}