import processing.sound.*;
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

float curCooldownTime;
float cooldownTime = 0.45;
float deltaTime;
float time;
Player playerChar;
BulletManager bulletManager;

EnemyManager enemyManager;

void settings()
{
	size(1024, 768);

	playerChar = new Player(width/2, height-height/5);
	enemyManager = new EnemyManager();
	bulletManager = new BulletManager();
}

void draw()
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;
    background(0, 0, 0);

    playerChar.update();
    playerChar.draw();

    bulletManager.draw();

    enemyManager.Update();

    if (keyPressed && key == 32 && curCooldownTime <= 0) 
  	{  
      	bulletManager.spawnBullet(int(playerChar.position.x), int(playerChar.position.y+2));
      	curCooldownTime = cooldownTime;
  	}

  	if (curCooldownTime >= 0)
  		curCooldownTime -= deltaTime;

    time = currentTime;

}
