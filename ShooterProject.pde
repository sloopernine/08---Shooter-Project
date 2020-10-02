import processing.sound.*;

float enemyCurCooldown = 0;
float enemyFiringCooldown = 2;
Player playerChar;

float deltaTime;
float time;

boolean debug = false;

GameManager gameManager;
StardustManager stardustManager;
BulletManager bulletManager;
EnemyManager enemyManager;
ExplosionManager explosionManager;
AnimationManager animationManager;

void setup(){

	size(1024, 768);
	animationManager = new AnimationManager();
	playerChar = new Player(width/2, height-height/5);
	bulletManager = new BulletManager();
	enemyManager = new EnemyManager();
	gameManager = new GameManager();
	stardustManager = new StardustManager();
	explosionManager = new ExplosionManager();
}

void draw(){

	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	background(0, 0, 0);

	stardustManager.update();

	playerChar.update();
	playerChar.draw();

	explosionManager.update();
	enemyManager.update();
	animationManager.update();

	gameManager.update();

	bulletManager.draw();

	if(enemyCurCooldown >= 0){

		enemyCurCooldown -= deltaTime; 
	} else if(enemyCurCooldown <= 0){

		enemyCurCooldown = enemyFiringCooldown;
		//enemyManager.Shoot();
		println("ENEMY SHOOT");
	}

	time = currentTime;
}