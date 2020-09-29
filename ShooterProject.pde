float deltaTime;
float time;
Player playerChar;

EnemyManager enemyManager;

void settings()
{
	size(1024, 768);

	playerChar = new Player(width/2, height-height/5);
	enemyManager = new EnemyManager();
}

void draw()
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;
    background(55, 255, 255);

    playerChar.update();
    playerChar.draw();

    enemyManager.Update();

    time = currentTime;

}