PVector input = new PVector(0,0);

void Update()
{
	input.x = int(key =='d') - int(key == 'a');
	input.y = int(key =='s') - int(key == 'w');
	println(input);
}

