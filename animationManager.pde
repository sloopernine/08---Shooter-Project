// Robin B
class AnimationManager{
	
	int arraySize = 200;

	Animation[] animations;

	AnimationManager(){

		animations = new Animation[arraySize];
	}

	void Update(){

		for (int i = 0; i < animations.length; i++){
			if (animations[i] == null){
				
				continue;
			} else {

				//ANIMATION CODE FOR PLAY AND LOOP GOES HERE
			}
		}
	}

	void Register(Animation anim){

		for (int i = 0; i < animations.length; i++){
			if (animations[i] == null){
				
				animations[i] = anim;
			}
		}
	}

	void Unregister(Animation anim){

		for (int i = 0; i < animations.length; i++){
			if (animations[i] == null){
				
				continue;
			} else {

				//DO SOMETHING HERE
			}
		}
	}
}