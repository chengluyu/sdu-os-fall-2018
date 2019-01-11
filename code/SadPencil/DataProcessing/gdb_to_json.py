#!/usr/bin/python3
print("[")
while True:        
	try:
		s = input()
	except:
		break
		
	if (s.startswith("req->bh")):
		s = s.split(' (struct buffer_head *) ')[1]
		print("{\"bh\":",s,',')
	elif (s.startswith("req->cmd")):
		s = s.split(' = ')[1]
		print("\"cmd\":",s,',')
	elif (s.startswith("req->sector")):
		s = s.split(' = ')[1]
		print("\"sector\":",s,',')
	elif (s.startswith("req->nr_sectors")):
		s = s.split(' = ')[1]
		print("\"nr_sectors\":",s,'},')
		
print("]")