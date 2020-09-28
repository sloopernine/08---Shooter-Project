class Player
{

	PVector velocity;
	PVector position;
	float topSpeed = 7;
	float decelerationSpeed = 0.85;
	int ballDiameter = 20;
	float xInput = 0;
	float yInput = 0;
	float v = 1;

public Player(int x, int y)
{
	//ellipseMode(CENTER);
	position = new PVector(x, y);

	velocity = new PVector(0,0);
	xInput = 0;
    yInput = 0;
}

void update()
{

  if (moveLeft)
  {
    xInput -= v;
  }
  if (moveRight)
  {
    xInput += v;
  }
  //If there is no player input the xInput will reset to start deceleration.
  if (!moveLeft && !moveRight)
  {
    xInput = 0;
  }
  
  //Creates a acceleration vector with player input and sets the magnitude of that vector.
  PVector acceleration = new PVector(xInput, yInput);
  acceleration.setMag(15f);

  //Deceleration if no input is registered.
  if (xInput == 0)
    velocity.x *= decelerationSpeed;
  else
    velocity.add(acceleration.mult(deltaTime));

  xInput = constrain(xInput, -topSpeed, topSpeed);
  position.y = constrain(position.y, 0+ballDiameter/2, height-ballDiameter/2);
  position.x = constrain(position.x, 0+ballDiameter, width-ballDiameter);

  //Limits the velocity vector and adds to vector to the character location vector.
  velocity.limit(topSpeed);
  position.add(velocity);
}

void draw()
{
	fill(255, 255, 255);
	ellipse(position.x, position.y, ballDiameter, ballDiameter);
}

}
