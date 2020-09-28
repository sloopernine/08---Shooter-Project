class EnemyManager{

	Enemy[] enemies;
	int numberOfEnemies = 8;

	int spaceOffset = 10;

	EnemyManager(){

		Setup();
	}

	void Setup(){
		
		enemies = new Enemy[numberOfEnemies];

		for(int i = 0; i < enemies.length; i++){

			enemies[i] = new Enemy((i * 60)+40, 30);
		}
	}

	void Update(){
	
		for(int i = 0; i < enemies.length; i++){

			enemies[i].Draw();
		}
	}
}