class Player {
  float x;
  float y;
  int size;
  
  boolean isDead;
  
  Cannon playerGun;
  
  public Player(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    
    isDead = false;
    
    playerGun = new Cannon(x, y, 1, 150, 2, 3, 0, false, new FirePattern() {
      public void fire(Bullet bullet, int bulletNum, float playerX, float playerY) {
        float bulletSpeedX = (bulletNum % 3 - 1) * 2;
        
        bullet.x = playerX;
        bullet.y = playerY;
        bullet.speedX = bulletSpeedX;
        bullet.speedY = -30;
        bullet.speed = 1;
        bullet.w = 8;
      }
    });
  }
  
  //------------------------------------------
  
  public void doAll() {
    move();
    shoot();
    display();
  }
  
  //------------------------------------------
  
  void move() {
    if (!isOnTheScreen()) stayOnTheScreen();
  
    if (mousePressed) {
      float sensitivity = 1;
      x += sensitivity * (mouseX - pmouseX);
      y += sensitivity * (mouseY - pmouseY);
    }
  }
  
  void shoot() {
    playerGun.fire();
    playerGun.controlBullets();
    playerGun.translate(x, y);
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
  
  //--------------------------------------------
  
  private void stayOnTheScreen() {
    if (x <= 0) x = 1;
    else if (x >= width) x = width - 1;
    if (y <= 0) y = 1;
    else if (y >= height) y = height - 1;
  }
  
  private boolean isOnTheScreen() {
    return (x > 0 && x < width &&
            y > 0 && y < height);
  }
}