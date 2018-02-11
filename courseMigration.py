import sqlite3
import urllib.request as urllib2
import urllib
import json
import requests

# connect to db
conn = sqlite3.connect('courseOn.db')
c = conn.cursor()

# get json
url = "https://searchneu.com/data/v2/getTermDump/neu.edu/201810.json"
response = requests.get(url)
jsonObject = json.loads(response.text);
courses = jsonObject['classMap']

for course in courses:
    # get course values
    print(course)
    #course_num = int(course['classId'])
    course_name = course['name']
    credit = course['maxCredites']
    course_subject = course['subject']
    print ("got values")
    # insert course into db
    c.execute("""INSERT INTO Course
                    (course_num, course_name, credit, course_subject)
                VALUES ("""
                    + str(course_num) + ", "
                    + str(course_name) + ", "
                    + str(credit) + ", "
                    + str(course_subject) + ");")

print ("Done!")
