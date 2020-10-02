class GameManager{

	int curScore;
	int playerHP;
	boolean gameActive;
	boolean playerAlive;

	GameManager(){

		setup();
	}

	void setup(){

		playerHP = 3;
		curScore = 0;
		gameActive = true;
		playerAlive = true;
	}

	void update(){

		if (playerHP <= 0){

			gameActive = false;
			playerAlive = true;
		}

		WriteText();
	}

	void WriteText(){

		fill(55, 55, 255);
		textSize(32);
		strokeWeight(3);
		textAlign(CENTER);
		text("Score:" + curScore, width/2, height-15);
		text("HP:" + playerHP, 35, height-15);
	}

	void AddScore(int scoreAdded){

		println("YES!");
		println(curScore);
		curScore+=scoreAdded;
	}
}