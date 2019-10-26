void settings() {
  fullScreen();
}

void setup() {
  noSmooth();
  
  //--------------------------------------------------------

  s[0] = new Cannon(700);
  s[0].setPosition(width / 2, height / 2 - 200);
  s[0].health = 100;
  
  s[0].fireModule.shotDelay = 50;
  s[0].fireModule.bulletShotsAtOnce = 100;
  s[0].fireModule.firePattern = new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      bulletSpeedX = 0.01 * (bulletNum % 100 + 15) * cos(1.06 * bulletNum);
      bulletSpeedY = 0.01 * (bulletNum % 100 + 15) * sin(1.06 * bulletNum);
      
      bullet.setPosition(cannonX, cannonY);
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 12;
    }
  };
  s[0].moveModule.movePattern = new MovePattern() {
    public PVector move(float x, float y, int time) {
      x = width / 2;
      y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      
      return super.rotateAround(
        x, y, time, radius, period, true, phase0);
    }
  };
  s[0].bulletColPattern = new BulletColorPattern() {
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  };
  
  //---------------------------------------------------
  
  s[1] = new Cannon(700);
  s[1].setPosition(width / 2, height / 2 - 200);
  s[1].fireModule.shotDelay = 50;
  s[1].fireModule.bulletShotsAtOnce = 100;
  s[1].fireModule.firePattern = new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY)
    {
      float bulletSpeedX = 0;
      float bulletSpeedY = 0;
      
      bulletSpeedX=0.01*(bulletNum%100+15)*cos(1.06*bulletNum);
      bulletSpeedY=-0.01*(bulletNum%100+15)*sin(1.06*bulletNum);
      
      bullet.setPosition(cannonX, cannonY);
      bullet.setVelocity(bulletSpeedX, bulletSpeedY);
      bullet.speed = 12;
      //bullet.ricochetModule.numOfRicochets = 1;
    }
  };
  s[1].moveModule.movePattern = new MovePattern() {
    public PVector move(float x, float y, int time) {
      x = width / 2;
      y = height / 2 - 300;
      float radius = 200;
      int period = 300;
      float phase0 = 0;
      
      return super.rotateAround(
        x, y, time, radius, period, false, phase0);
    }
  };
  s[1].bulletColPattern = new BulletColorPattern() {
    public void setBulletColor(Bullet bullet, int bulletNum, int bulletCount) {
      super.changeBulletColorHSB(bullet, bulletNum, bulletCount, 2);
    }
  };
  
  //--------------------------------------------------------
  
  test = new Cannon(600);
  test.setPosition(width / 2, height / 2);
  test.health = 600;
  
  test.fireModule.shotDelay = 80;
  test.fireModule.bulletShotsAtOnce = 100;
  test.fireModule.firePattern = new FirePattern() {
    public void fire(Bullet bullet, int bulletNum, float cannonX, float cannonY) {
      bullet.x = cannonX;
      bullet.y = cannonY;
      
      super.shootToAllSides(bullet, bulletNum, 100);
      
      bullet.speed = 8;
      bullet.ricochetModule
        .setOptions(1, true, true, true);
    }
  };
  
  //--------------------------------------------------------
  
  restartButton = new Button(width / 2 - 150, height / 2 + 50);
  restartButton.setOptions("Restart");
  player = new Player(width / 2, height - 100, 8);
}
