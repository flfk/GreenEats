#Print Quantity Picker Range in 10s

quantityRange = []

for x in xrange(0, 1010):
    quantityRange.append('\"'+str(x)+'\"')

print ', '.join(str(x) for x in quantityRange[0::10])

#Print Quantity Picker Range in 1s

quantityRange = []

for x in xrange(0, 1010):
    quantityRange.append('\"'+str(x)+'\"')

print ', '.join(str(x) for x in quantityRange[0:100])