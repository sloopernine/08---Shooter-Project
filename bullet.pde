class Bullet
{
	PVector velocity;
	PVector position;
	float speed = 1;

	
	public Bullet(int x, int y)
	{
		position = new PVector(x, y);

		velocity = new PVector(0, 0);
	}

	void update()
	{
		position.add(velocity.mult(deltaTime));
	}

	void draw()
	{
		ellipse(position.x, position.y, 2, 2);
	}
}