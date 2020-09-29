class Enemy extends Character{

	float collider = 30;

	float ySpeed = 10f;

	boolean alive;

	Enemy(float xPos, float yPos){
		super();

		position = new PVector(xPos, yPos);
		baseColor = color(255, 0, 0);

		alive = true;
	}

	void Update(){

		if(alive){

			position.y += ySpeed * deltaTime;
		}
	}

	void Draw(){
		
		if(alive){

			fill(baseColor);
			ellipse(position.x, position.y, collider, collider);
		}
	}
}





