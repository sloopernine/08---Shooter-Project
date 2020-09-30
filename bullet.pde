class Bullet extends GameObject
{
	//Ansvarig: Johan B
	float speed = 5;

	public Bullet(int x, int y)
	{
		position = new PVector(x, y);

		velocity = new PVector(0, -1);

		collider = 10;
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
		ellipse(position.x, position.y, collider, collider);
	}
}