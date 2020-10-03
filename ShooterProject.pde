import processing.sound.*;

float deltaTime;
float time;

boolean debug = false;

Player player;
GameManager gameManager;
SceneManager sceneManager;
BulletManager bulletManager;
EnemyManager enemyManager;
ExplosionManager explosionManager;
AnimationManager animationManager;

void setup(){

	size(1024, 768);
	animationManager = new AnimationManager();
	player = new Player(width/2, height-height/5);
	bulletManager = new BulletManager();
	enemyManager = new EnemyManager();
	gameManager = new GameManager();
	sceneManager = new SceneManager();
	explosionManager = new ExplosionManager();
}

void draw(){

	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	background(0, 0, 0);

	sceneManager.update();

	player.update();
	player.draw();

	explosionManager.update();
	enemyManager.update();
	animationManager.update();

	gameManager.update();

	bulletManager.update();

	time = currentTime;
}