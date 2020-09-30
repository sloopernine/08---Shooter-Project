import processing.sound.*;

float curCooldownTime;
float cooldownTime = 0.45;
float deltaTime;
float time;
Player playerChar;
BulletManager bulletManager;

EnemyManager enemyManager;
ExplosionManager explosionManager;

boolean debug = false;

void settings()
{
	size(1024, 768);

	playerChar = new Player(width/2, height-height/5);
	bulletManager = new BulletManager();
  enemyManager = new EnemyManager();
  explosionManager = new ExplosionManager();
}

void draw()
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;
    background(0, 0, 0);

    playerChar.update();
    playerChar.draw();

    enemyManager.Update();
    explosionManager.Update();
    bulletManager.draw();


    if (keyPressed && key == 32 && curCooldownTime <= 0) 
  	{  
      	bulletManager.spawnBullet(int(playerChar.position.x), int(playerChar.position.y+2));
      	curCooldownTime = cooldownTime;
  	}

  	if (curCooldownTime >= 0)
  		curCooldownTime -= deltaTime;

    time = currentTime;

}
