float deltaTime;
float time;
Player playerChar;

void settings()
{
	size(512, 512);
	playerChar = new Player(width/2, height-height/5);
}

void draw()
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;
    background(55, 255, 255);

    playerChar.update();
    playerChar.draw();

    time = currentTime;

}