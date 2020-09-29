class bulletManager
{
	Bullet[] bullets;

	void setup()
	{
 	   bullets = new Bullet[10];
	}

	void spawnBullet()
	{
		for (int i = 0; bullets.length; i++) 
      	{
        	if (bullets[i] == null) 
        	{
          	bullets[i] = new Bullet(player.position.x, player.position.y+2);
          	//we are done, break/quit the loop.
          	break;
       		}
		}

	}



	void draw() 
	{
  	//Update bullets
  		for (int i = 0; bullets.length; i++) 
  		{
    		if (bullets[i] == null) 
    		{
      		//No bullet, skip to the next one.
      		continue;
    		}
    	else
    		{
    	  //found a bullet, update it.
    		}
    	}
	
  		//Spawn new bullet it we press "space-bar"
  		if (keyPressed && key == 32) 
  		{  
      		spawnBullet();
  		}
  	}
}

