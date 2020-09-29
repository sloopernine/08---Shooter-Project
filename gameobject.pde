class GameObject{
	
	PVector position;
	PVector velocity;

	color baseColor;

	float collider;

	boolean active;

	GameObject(){

		position = new PVector(0, 0);
		velocity = new PVector(0, 0);
	}
}