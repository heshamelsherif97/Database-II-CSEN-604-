from random import randint
from random import uniform

import csv


rounds = ['32nd', '16th','Group Stage','Quarter Final', 'Semi Final', 'Final']

records = []

for i in range(0, 2680):
    record = []

    random_index = randint(0, 5)
    random_year = randint(1980, 2015)
    random_viewers = randint(20000, 90000)
    random_avg_rating = round(uniform(1, 10), 1)

    record.append(rounds[random_index])
    record.append(random_year)
    record.append(random_viewers)
    record.append(random_avg_rating)

    records.append(record)

with open("data-cup-matches.csv", "w",newline='') as file:
    writer = csv.writer(file)
    writer.writerows(records)

names = ['Medhat','Hesham','Fathi','Magdy','Walid','Bergkamp','Henry','Figo','Messi','Ronaldo','Cristiano Ronaldo','Ronaldinho','Lacazette','Griezman','Van Persie'
        'Ronaldinho','Yorke','Hatfield', 'Ballack','Beckham','Villa','Inesta','Nesta','Maldini','Gomez','Klose','Neuer','Ozil','Gerrad','Lampard'];

records[:] = []
taken_keys = set()

for i in range(0, 58960):
    record = []

    while True:
        random_index = randint(0, len(names)-1)
        random_mid = randint(1, 2680)
        random_year = randint(1980, 2015)
        random_position = randint(1, 16)

        if ((random_mid, names[random_index]) not in taken_keys):
            taken_keys.add((random_mid, names[random_index]))
            break

    record.append(random_mid)
    record.append(names[random_index])
    record.append(random_year)
    record.append(random_position)

    records.append(record)

taken_keys = set()
for i in range(0, 118):

    while True:
        random_index = randint(0, 58959)
        if(records[random_index][0] not in taken_keys):
            taken_keys.add(records[random_index][0])
            break

    records[random_index][1] = "pele"

with open("data-played-in.csv", "w",newline='') as file:
    writer = csv.writer(file)
    writer.writerows(records)
    
    
