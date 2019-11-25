import json
import random
import string

def random_string(str_len):
	letters = string.ascii_lowercase
	return ''.join(random.choice(letters) for i in range(str_len))

with open('acronym_to_university.json') as json_file:
	data = json.load(json_file)
	f = open('random_emails.csv', "w+")
	for i in range(len(data)):
		random_school = random.sample(list(data), 1)[0]
		f.write('{}@{}.edu,\n'.format(random_string(10), random_school))