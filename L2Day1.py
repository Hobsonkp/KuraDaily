# Write a Python program to convert JSON data to Python object.
import json

# json data
x= '{"name":"Jerry", "DOB":"01/01/1970", "nickname":"Harry", "number":20}'

# create json opject
jsonObject=json.loads(x)

print(jsonObject["name"])