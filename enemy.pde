// Robin B
class Enemy extends Character{

	Animation animation;

	float collider = 64;
	float xSpeed = 40;
	float ySpeed = 10;

	Enemy(float xPos, float yPos){
		super();

		position = new PVector(xPos, yPos);
		baseColor = color(255, 0, 0, 50);

		alive = true;

		animation = new Animation(2, 2, "enemy1Anim", 100);
	}


	void Update(){

		if(alive){

			position.x += (direction.x * xSpeed) * deltaTime;
			position.y += ySpeed * deltaTime;
		}
	}

	void Draw(){
		
		if(alive){

			if(animation == null){

				fill(baseColor);
				ellipse(position.x, position.y, collider, collider);

			} else {

				animation.Loop(position.x, position.y);

				if(debug){

					fill(baseColor);
					ellipse(position.x, position.y, collider, collider);
				}
			}
		} else {

			animation.Stop();
		}
	}
}





