class EnemyManager{

	Enemy[] enemies;
	int numberOfEnemies = 20;

	EnemyManager(){

		Setup();
	}

	void Setup(){
		
		enemies = new Enemy[numberOfEnemies];

		for(int i = 0; i < enemies.length; i++){

			enemies[i] = new Enemy(i * 5, 0);
		}
	}

	void Update(){
	
		for(int i = 0; i < enemies.length; i++){

			
			enemies[i].Draw();
		}
	}
}