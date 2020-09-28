boolean moveRight;
boolean moveLeft;
boolean gravityOn = false;
PVector vectorInput = new PVector(0,0);

void keyPressed()
{
	if (key == 'a')
		moveLeft = true;
	else if (key == 'd')
		moveRight = true;

	if (key == 'f')
		//Shoot
}

void keyReleased()
{
	if (key == 'a')
		moveLeft = false;
	else if (key == 'd')
		moveRight = false;
}
