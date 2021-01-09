with open('b.txt') as f:
	ff = open('bb.txt', 'w')
	for s in f:
		if len(s) > 0:
			ff.write(str(float(s) + 0.05) + '\n')

