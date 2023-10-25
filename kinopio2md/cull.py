import json

# read file
with open('test.json', 'r') as myfile:
    data=myfile.read()

# parse file
obj = json.loads(data)

cards = {}

for x in obj['cards']:
    id = x['id']
    card = { 'id' : id, 'name' : x['name'] }
    cards[id] = card
    print (card)

print ()
print (cards)
for c in cards:
    print (cards[c])
    
