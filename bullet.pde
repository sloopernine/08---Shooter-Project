class Bullet extends GameObject
{
	//Ansvarig: Johan B
	float speed = 5;

	Animation animation;

	public Bullet(int x, int y)
	{
		position = new PVector(x, y);

		velocity = new PVector(0, -1);

		collider = 10;

		baseColor = color(0, 255, 0);

		animation = new Animation(4, 4, "bullet1", 80);
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

		animation.Loop(position.x, position.y);

		if(debug){

			fill(baseColor);
			ellipse(position.x, position.y, collider, collider);
		}
	}
}