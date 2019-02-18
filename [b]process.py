import sys
import random

Edge_DICT = {}

if __name__ == '__main__':
	
	if len(sys.argv) != 3:
		sys.exit('usage: process.py <input_graph_file> <input_gt_file>')

	random.seed(17)

	input_graph_file = sys.argv[1]
	input_gt_file = sys.argv[2]

	fOut = open('output_A_torus.txt', 'w')
	fOut.write('insert into A_torus Values\n')

	fIn = open(input_graph_file, 'r')

	lines = fIn.readlines()
	for line in lines:
		parts = line.strip('\r\n').split('\t')

		src = parts[0]
		dst = parts[1]
		wei = int(parts[2])

		if (src, dst) in Edge_DICT.keys():
			Edge_DICT[(src, dst)] += wei
			Edge_DICT[(dst, src)] += wei
		else:
			Edge_DICT[(src, dst)] = wei
			Edge_DICT[(dst, src)] = wei
	fIn.close()

	print (Edge_DICT)
	counter = 0
	for src,dst in Edge_DICT.keys():
		if counter == len( Edge_DICT.keys()) - 1:

			new_line = '\t(' + src + ',' + dst + ','  + '1);\n'#+ str(Edge_DICT[(src, dst)])
		else:
			new_line = '\t(' + src + ',' + dst + ','  + '1),\n'#+ str(Edge_DICT[(src, dst)])
		counter += 1
		fOut.write(new_line)


	fOut.close()

	candidates = []

	fOut = open('output_E_torus.txt', 'w')
	fOut.write('insert into E_torus Values\n')

	fIn = open(input_gt_file, 'r')

	counter = 0
	lines = fIn.readlines()
	for line in lines:
		parts = line.strip('\r\n').split('\t')

		init_class = int(parts[1])

		for i in range(1,4,1):
			print(i)
			if i == init_class:
				new_line = '\t(' + parts[0] + ',' + str(i) + ',2),\n'
			else:
				new_line = '\t(' + parts[0] + ',' + str(i) + ',-1),\n'

			fOut.write(new_line)

	fIn.close()
	fOut.close()








