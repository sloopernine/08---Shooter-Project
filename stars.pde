// Robin B
class StarLine extends GameObject{
	
	Animation animation;

	float speed;

	StarLine(){
		super();

		active = false;
		animation = new Animation(2, 2, "dustLineAnim", 80);
	}


	void update(){

		if(position.y > height + 10){

			animation.stop();
			active = false;
		} else {

			animation.loop(position.x, position.y);
			position.y += speed * deltaTime;
		}
	}
}

class Star255 extends GameObject{

	Animation animation;

	float speed;

	Star255(){
		super();

		active = false;
		animation = new Animation(2, 2, "stars", 80);
	}


	void update(){

		if(position.y > height + 5){

			animation.stop();
			active = false;
		} else {

			animation.loop(position.x, position.y);
			position.y += speed * deltaTime;
		}
	}
}
