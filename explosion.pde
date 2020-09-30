// Robin B
class Explosion extends GameObject{
	
	PImage spriteSheet;
	PImage[] spriteAnimation;

	int spriteSize = 64;
	int col = 4;
	int row = 4;

	int animationCounter = 0;

	Explosion(){
		super();

		active = false;

		spriteSheet = loadImage("data/sprites/expl1.png");
		spriteAnimation = new PImage[col * row];

		PrepareSequence();
	}

	void Draw(){

		if(active){

			image(
				spriteAnimation[animationCounter],
				position.x,
				position.y
			);

			if(animationCounter < (col * row) - 1){

				animationCounter++;
			} else {

				active = false;
				animationCounter = 0;
			}
		}
	}

	void PrepareSequence(){

		int counter = 0;

		for(int y = 0; y < col; y++){
			for(int x = 0; x < row; x++){

				spriteAnimation[counter] = spriteSheet.get(x * spriteSize, y * spriteSize, spriteSize, spriteSize);

				counter++;
			}
		}
	}

	void Explode(float xPos, float yPos){

		position = new PVector(xPos - (spriteSize/2), yPos - (spriteSize/2));
		active = true;
	}
}