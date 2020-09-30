class Bullet extends GameObject
{
	//Ansvarig: Johan B
	float speed = 5;

	public Bullet(int x, int y)
	{
		position = new PVector(x, y);

		velocity = new PVector(0, -1);

		collider = 10;

		baseColor = color(0, 255, 0);
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
		fill(baseColor);
		ellipse(position.x, position.y, collider, collider);
	}
}