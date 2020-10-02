// Robin B
class SpaceDust extends GameObject{
	
	Animation animation;

	float speed;

	SpaceDust(){
		super();

		active = false;
		animation = new Animation(2, 2, "dustLineAnim", 80);
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