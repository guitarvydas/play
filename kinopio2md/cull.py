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

connections = {}
for y in obj['connections']:
    fromCard = y['startCardId']
    toCard = y['endCardId']
    connType = y['connectionTypeId']
    id = y['id']
    connections[id] = { 'id': id, 'from': fromCard, 'to': toCard, 'type': connType }
    
print ()
print (cards)
for c in cards:
    print (cards[c])

print ()
print (connections)
for j in connections:
    print (connections[j])


    
