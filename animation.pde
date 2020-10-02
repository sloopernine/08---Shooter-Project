// Robin B
class Animation{
	
	PVector position;
	String name;

	PImage spriteSheet;
	PImage[] spriteAnimation;
	int spriteSize;
	int col;
	int row;
	int animationCounter = 0;
	int animSpeed = 30; // Higher value = slower animation

	boolean playLock = false;
	boolean loopLock = false;

	int lastTime = millis();

	Animation(int rows, int columns, String fileName, int animationSpeed){

		position = new PVector(0, 0);

		spriteSheet = loadImage("data/sprites/" + fileName + ".png");
		spriteAnimation = new PImage[rows * columns];

		name = fileName;
		col = columns;
		row = rows;

		animSpeed = animationSpeed;

		spriteSize = spriteSheet.width / col;

		PrepareAnimation();

		animationManager.Register(this);
	}


	void Update(){

		image(spriteAnimation[animationCounter], position.x - (spriteSize / 2), position.y - (spriteSize / 2));

		if(animationCounter < (row * col) - 1){

			if(millis() - lastTime > animSpeed){

				animationCounter++;
				lastTime = millis();
			}
		} else {

			animationCounter = 0;
			playLock = false;
		}
	}

	void Play(float xPos, float yPos){

		if(playLock == false){

			position = new PVector(xPos, yPos);
			animationCounter = 0;
			playLock = true;
		}
	}

	void Loop(float xPos, float yPos){

		position = new PVector(xPos, yPos);
		loopLock = true;
	}

	void Stop(){

		playLock = false;
		loopLock = false;
	}

	boolean isPlaying(){

		boolean returnValue;

		if(playLock == false && loopLock == false){

			returnValue = false;
		} else {

			returnValue = true;
		}

		return returnValue;
	}

	void PrepareAnimation(){

		int counter = 0;

		for(int y = 0; y < col; y++){
			for(int x = 0; x < row; x++){

				spriteAnimation[counter] = spriteSheet.get(x * spriteSize, y * spriteSize, spriteSize, spriteSize);

				counter++;
			}
		}
	}
}