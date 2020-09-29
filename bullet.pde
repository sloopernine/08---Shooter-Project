class Bullet
{
	//Ansvarig: Johan B
	PVector velocity;
	PVector position;
	float speed = 1;
	float bulletSize = 2;

	
	public Bullet(int x, int y)
	{
		position = new PVector(x, y);

		velocity = new PVector(0, 0);
	}

	void update()
	{
		PVector bulletFlight = new PVector(0,0);
		bulletFlight = velocity.mult(deltaTime);

		velocity.add(bulletFlight.mult(speed));
	}

	void draw()
	{
		ellipse(position.x, position.y, bulletSize, bulletSize);
	}
}