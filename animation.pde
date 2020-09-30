// Robin B
class Animation{
	
	PVector position;

	PImage spriteSheet;
	PImage[] spriteAnimation;

	String name;

	int spriteSize = 64;
	int col = 4;
	int row = 4;

	int animationCounter = 0;

	boolean playLock = false;
	boolean loopLock = false;

	Animation(int rows, int columns, String fileName){

		position = new PVector(0, 0);

		spriteSheet = loadImage("data/sprites/" + fileName + ".png");
		spriteAnimation = new PImage[rows * columns];

		spriteSize = spriteSheet.width / 2;

		name = fileName;
		col = columns;
		row = rows;

		PrepareAnimation();
	}

	void Play(float xPos, float yPos){

		image(spriteAnimation[animationCounter], xPos - (spriteSize / 2), yPos - (spriteSize / 2));

		if(animationCounter < (row * col) - 1){

			animationCounter++;
		} else {

			animationCounter = 0;
		}
	}

	void Loop(float xPos, float yPos){


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