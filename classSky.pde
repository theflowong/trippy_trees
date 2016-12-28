// by Flo Wong

class Sky {
  
  // ---------- DATA ---------- \\
  float sky_ri;
  float sky_bi;
  float sky_gi;
  
  float sky_r;
  float sky_b;
  float sky_g;
  
  float sky_rf;
  float sky_bf;
  float sky_gf;
  
  float speed;
  
  float large_stars;
  
  // ---------- CONSTRUCTOR ---------- \\
  Sky() {
    sky_ri = 224;
    sky_bi = 246;
    sky_gi = 255;
    
    sky_r = sky_ri;
    sky_b = sky_bi;
    sky_g = sky_gi;
    
    sky_rf = 48;
    sky_bf = 43;
    sky_gf = 72;
    
    speed = 0.01;
    
    large_stars = 0;
  }
  
  // ---------- FUNCTIONS ---------- \\
  
  // ----- test for dark sky finish ----- \\
  boolean isDark() {
    return ((sky_r < sky_rf) && (sky_b < sky_bf) && (sky_g < sky_gf));
  }
  
  // ----- transition to dark night sky ----- \\
  void transition() {
    if ((sky_r > sky_rf) || (sky_b > sky_bf) || (sky_g > sky_gf)) {
      sky_r -= ((sky_ri - sky_rf) * speed);// 244 to 50 48
      sky_b -= ((sky_bi - sky_bf) * speed); // 246 to 50 43
      sky_g -= ((sky_gi - sky_gf) * speed); // 255 to 80 72
    }
  }
  
  // ----- draw sky ----- \\
  void display() {
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
  
  }
}