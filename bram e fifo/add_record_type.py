f = open('ram_wr.hex', 'r')

lines = f.readlines()

new_lines = []
for line in lines:
	new_lines.append(line[:7] + '00' + line[7:])

f.close()
f = open('ram_wr.hex', 'w')
for line in new_lines:
	f.write(line)
	
f.close()