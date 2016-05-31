class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    
    rad = 20;
    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  
 void draw(){
   fill (c);
   ellipse(x, y, rad, rad);
   
   }
void process(){
  move();
  
  chainReact();
  
}
void chainReact(){
  if (clickedOn()){
    state = GROWING;
  }
  if (state == GROWING){
    if (rad >= 80)
      state = SHRINKING;
    else 
      rad += 10;
  }
  if (state == GROWING){
    if (rad <= 0)
      state = DEAD;
    else 
      rad -= 10;
  }
    
}

boolean clickedOn(){
 /* if (mousePressed)
    if (( mouseX - x > 0 && mouseX - x < rad) || ( x - mouseX > 0 && x - mouseX < rad))
      if (( mouseY - y > 0 && mouseY - y < rad) || ( y - mouseY > 0 && y - mouseY < rad))
*/
  if (mousePressed &&
      mouseX == x &&
      mouseY == y)
          return true;
  return false;
}


void bounce(){
      if (x > width || x < 0) {
      dx *= - 1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      dy *= - 1;
    }}
 
  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
    
    
       
  }
  

 
 
 boolean isTouching( Ball other ) {
   float distance = dist(x,y,other.x, other.y);
   
   if (distance < rad + other.rad) {
     return true;}
     else {
       return false;}}
 
 
 
  
}//end class Ball