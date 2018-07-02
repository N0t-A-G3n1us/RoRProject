import sys

FILENAME='uss.txt'

	
f=open(FILENAME, 'w') 

for i in range(100):
	
	head=""
	if(i%10==0):
		head="\nSEZIONE\n"
	s=head + str(i)+". "+"As a    "+ "I want to     "+"\
	so that I can   \n "
	f.write(s);
