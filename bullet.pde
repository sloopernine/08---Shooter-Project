class Bullet extends GameObject
{
	//Ansvarig: Johan B
	PVector velocity;
	PVector position;
	float speed = 5;
	float bulletSize = 10;

	
	public Bullet(int x, int y)
	{
		position = new PVector(x, y);

		velocity = new PVector(0, -1);
	}

	void update()
	{
		PVector bulletFlight = new PVector(0,0);
		bulletFlight = velocity.mult(deltaTime).normalize();

		velocity.add(bulletFlight.mult(speed));
		position.add(velocity);
	}

	void draw()
	{
		ellipse(position.x, position.y, bulletSize, bulletSize);
	}
}