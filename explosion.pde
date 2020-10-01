// Robin B
class Explosion extends GameObject{
	
	Animation animation;

	Explosion(){
		super();

		active = false;

		animation = new Animation(4, 4, "expl1");
	}

	void Explode(float xPos, float yPos){

		animation.Play(xPos, yPos);
	}
}