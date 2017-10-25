#Generator to create a text file which can be copied directly into Xcode data model for ingredients in a csv file

import csv
#itertools to merge lists
import itertools 

with open("ingredientData.txt", "w") as fo:

	# import content file as a list formatted as Food Category, Product, Kg of CO2e/pound, Kg of CO2e/kg, standard portion name, standard portion size (kg)
	content = []
	with open('prod_emissions_data_cleaned_20170928.csv', 'rb') as csvfile:
		spamReader = csv.reader(csvfile, dialect=csv.excel_tab, delimiter = ',')
		for row in spamReader:
			content.append([row[0],row[1],row[2],row[3],row[4],row[5],row[6]])

	formattedContent = []
	index = 0

	for entry in content:
		index += 1

		dataRow = 'data.append(IngredientClass(ingredientName: "'+entry[1]+'", ingredientIcon: "'+entry[2]+'", emissionsPerKg: '+entry[4]+', standardPortionName: "'+entry[5]+'", standardPortionSizeKg: '+entry[6]+'))\n'

		fo.write(dataRow)