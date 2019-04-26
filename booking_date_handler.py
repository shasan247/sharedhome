import json
from flask import jsonify 

from_date = "29-4-19"
to_date = "30-4-19"

day_first = int(from_date[0:2])
day_last = int(to_date[0:2])

print(day_first)
print(day_last)

count = 4
days=[]
while (count <5):
    key=1
    if day_first == day_last or day_first>day_last:
        break
    else:
        days.insert(key,day_first)
        day_first = day_first+1 

    count = count - 1
    key=key+1
print (days)