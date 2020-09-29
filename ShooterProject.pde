import processing.sound.*;
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

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
    background(55, 255, 255);

    playerChar.update();
    playerChar.draw();

    bulletManager.draw();

    enemyManager.Update();

    if (keyPressed && key == 32) 
  	{  
      	bulletManager.spawnBullet(int(playerChar.position.x), int(playerChar.position.y+2));
  	}

    time = currentTime;

}
