Enemy[] enemies;
int numberOfEnemies = 20;

void Setup(){
	
	enemies = Enemy[numberOfEnemies];

	for(int i = 0; i < enemies.length; i++){

		enemies[i] = new Enemy();
	}
}

void Update(){
	
	
}