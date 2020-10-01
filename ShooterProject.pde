import processing.sound.*;

float curCooldownTime;
float cooldownTime = 0.45;
float deltaTime;
float time;
float enemyCurCooldown = 0;
float enemyFiringCooldown = 2;
Player playerChar;

GameManager gameManager;
BulletManager bulletManager;
EnemyManager enemyManager;
ExplosionManager explosionManager;
AnimationManager animationManager;

boolean debug = false;

void setup()
{
	size(1024, 768);
  animationManager = new AnimationManager();
	playerChar = new Player(width/2, height-height/5);
	bulletManager = new BulletManager();
  enemyManager = new EnemyManager();
  gameManager = new GameManager();
  explosionManager = new ExplosionManager();
}

void draw()
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;
    background(0, 0, 0);

    playerChar.update();
    playerChar.draw();

    explosionManager.Update();
    enemyManager.Update();
    animationManager.Update();
    gameManager.update();

    bulletManager.draw();

    if (keyPressed && key == 32 && curCooldownTime <= 0) 
  	{  
      	bulletManager.spawnBullet(int(playerChar.position.x), int(playerChar.position.y+2));
      	curCooldownTime = cooldownTime;
  	}


  	if (curCooldownTime >= 0)
  		curCooldownTime -= deltaTime;
    if(enemyCurCooldown >= 0)
      enemyCurCooldown -= deltaTime; 
    else if(enemyCurCooldown <= 0)
    {
      enemyCurCooldown = enemyFiringCooldown;
      //enemyManager.Shoot();
      println("ENEMY SHOOT");
    }

    time = currentTime;

}
