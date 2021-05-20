
L=[]
# Using readlines()
fname=input("Type a file name\n")
file1 = open(fname, 'r')
Lines = file1.readlines()

 
def decimalToBinary(n):  
    return f'{n:08b}'

# Strips the newline character
for line in Lines:
	l=line.replace('\n','').split(" ")
	op=""
	if l[0]=="NOP" :
		op="00000000"
	elif l[0]=="ADD" :
		op="00000001"
	elif l[0]=="MUL" :
		op="00000010"
	elif l[0]=="SOU" :
		op="00000011"
	elif l[0]=="INF" :
		op="00000100"
	elif l[0]=="SUP" :
		op="00000101"
	elif l[0]=="EQU" :
		op="00000110"
	elif l[0]=="DIV" :
		op="00000111"
	elif l[0]=="COP" :
		op="00001000"
	elif l[0]=="AFC" :
		op="00001001"
	elif l[0]=="PRI" :
		op="00001100"
	elif l[0]=="JMP" :
		op="00001101"
	elif l[0]=="JMF" :
		op="00001110"
	else :
		op="ERROR"
	
	a=decimalToBinary(int(l[1]))

	b="00000000"
	if(len(l)>2):
		b=decimalToBinary(int(l[2]))

	c="00000000"
	if(len(l)>3):
		c=decimalToBinary(int(l[3]))

	if l[0]=="PRI" or l[0]=="JMF":
		L.append(op+b+a+c)
	else :
		L.append(op+a+b+c)

mode = input("Do you want raw binary ?(y for yes)\n")
if mode =="y" :
	# writing to file
	fileout = open(fname.replace(".asm", ".bin"), 'w')
	print("\n".join(L))
	fileout.write("\n".join(L))
	fileout.close()
else :
	# writing to file
	fileout = open(fname.replace(".asm", ".mem_instruction_bin"), 'w')
	i=0
	for l in L : 
		s='\t\t'+str(i)+'=>"'+l+'",\n'
		fileout.write(s)
		print(s)
		i=i+1
	fileout.close()
