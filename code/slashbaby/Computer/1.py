import random
import json
import re
import os
import shutil

def getData(filename):
	'''从文件中读取数据'''
	with open(filename, "r") as f:
		content = f.read()
	return content

def parseData(content,dataSet):
	'''解析数据'''
	#将content拆分成以一个的状态，并且存储所有状态的数量
	stateList = content.split("$")[:-1]
	result = []
	#对每一个状态进行处理
	for state in stateList:
		proList = state.split("#")[:-1]
		list = []
		for pro in proList:
			#通过正则获得信息
			op = re.findall('Operation:(.*?)\n',pro)[0].strip()
			pid = re.findall('pid:(.*?)\n',pro)[0].strip()
			father = re.findall('father:(.*?)\n',pro)[0].strip()
			priority = re.findall('priority:(.*?)\n',pro)[0].strip()
			counter = re.findall('counter:(.*?)\n',pro)[0].strip()
			state = re.findall('state:(.*?)\n',pro)[0].strip()
			curPid = re.findall('current:(.*?)\n',pro)[0].strip()
			
			#更新dataSet
			dataSet["op"].add(op)
			dataSet["priority"].add(priority)
			dataSet["state"].add(state)
			dataSet["counter"].add(counter)

			#封装数据
			p = {
				"op":op,
				"pid": pid,
		   		"father": father,
		   		"priority":priority,
		   		"counter":counter,
		   		"state":state,
		   		"curPid":curPid,
			}
			list.append(p)
		#如果和前面的状态相同就舍去
		r = json.dumps(list)
		if len(result) == 0:
			result.append(r)
		else:
			 if not result[-1] == r:
			 	result.append(r)

	#获得所有可能的状态数
	dataSet["fileCnt"] = len(result)
	return result


def writeProcess(items):
	'''将进程信息数据写入文件'''
	
	for i in range(len(items)):
		item = items[i]
		filename = "data/data_"+str(i)+".json";
		with open(filename,"w") as f:
			f.write(item)

def writeDataSet(dataSet):
	'''将一些全局信息写入文件'''

	#将dataSet的内容转换成可以序列化的数据
	dataSet["state"] = list(dataSet["state"])
	dataSet["op"] = list(dataSet["op"])
	dataSet["maxOp"] = max(list(map(lambda x : int(x),dataSet["op"])))
	dataSet["minOp"] = min(list(map(lambda x : int(x),dataSet["op"])))
	dataSet["counter"] = list(dataSet["counter"])
	dataSet["maxCounter"] = max(list(map(lambda x : int(x),dataSet["counter"])))
	dataSet["minCounter"] = min(list(map(lambda x : int(x),dataSet["counter"])))
	dataSet["maxPrioirity"] = max(list(map(lambda x : int(x),dataSet["priority"])))
	dataSet["minPrioirity"] = min(list(map(lambda x : int(x),dataSet["priority"])))
	dataSet["priority"] = list(dataSet["priority"])

	#写入文件
	filename = "data/configure.json"
	with open(filename,"w") as f:
		f.write(json.dumps(dataSet))


def main():
	'''对程序进行调度'''
	filename = "./output.txt"
	content = getData(filename)
	cnt = 0
	#获得一些基本信息
	stateSet = set()
	opSet = set()
	couterSet = set()
	prioritySet = set()
	dataSet = {
		"state":stateSet,
		"op":opSet,
		"counter":couterSet,
		"priority":prioritySet,
	}

	#将文件夹清空
	if os.path.exists('data'):
		shutil.rmtree('data')
	os.mkdir('data')

	#开始处理数据
	result = parseData(content,dataSet)
	writeProcess(result)

	#将dataSet内容输出到配置文件
	writeDataSet(dataSet)

if __name__ == "__main__":
	main()
