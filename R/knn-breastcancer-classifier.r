# Programmer: Caitlin Gibbons
# Date: 2019.4.30
# Program: knn-breastcancer-classifier
# Language: R
# Purpose: Using the Wisconsin Breast Cancer Dataset and the k-Nearest Neighbor algorithm,
#          patient samples obtained from fine needle aspirates (FNA) are classified as
#          either benign (non-invasive) tumors or a malignant (invasive) cancer. The results
#          are then displayed in a crosstabulation table.

# Import the required packages
library(class)
library(gmodels)

# Create the 'normalize' function. Values are 'rescaled' in order to minimize bias
# and precent exceedigly large values from influencing the consensus among neighboring
# values during the voting process. Each value returned will be between 0 and 1 (inclusive)
normalize <- function(x) {
	return ( (x - min(x) ) / ( max(x) - min(x) ))
}

# Read the csv file and assign to the 'wdbc.csv' object. Prevent character vectors
# from being converted to factors
wbcd_data <- read.csv("wisc_bc_data.csv", stringsAsFactors = F)

# Remove the 'ID' field from the dataframe
wbcd_data <- wbcd_data[-1]

# Apply the normalize function to columns 2 through 31 (inclusive) and convert the
# resulting list object to a dataframe. Store the aforementioned dataframe in the
# wdbc_norm object
wbcd_norm <- as.data.frame(lapply(wbcd_data[2:31], normalize))

# Assign rows 1 - 455 and each column in 'wbcd_data' to the 'wbcd_training' object.
# These data values are used to train the classifier. This is an 80/20 split
wbcd_training <- wbcd_norm[1:455, ]

# Assign rows 456 through 569 and each column in 'wbcd_data' to the 'wbcd_testing' 
# object. These data values are used to test the classifier. This is an 80/20 split
wbcd_testing <- wbcd_norm[456:569, ]

# Store the 'diagnosis' codes, i.e, the first column in the 'wbcd.csv' dataset 
# in the wbcd_training_labels and wbcd_testing_labels objects. Note: The 'diagnosis'
# codes are factors
wbcd_training_labels <- wbcd_data[1:455, 1]
wbcd_testing_labels <- wbcd_data[456:569, 1]

# Return a factor vector of predicted labels, i.e., 'M' (malignant) or 'B' (benign)
# respectively for each of the examples contained within the test dataset which is
# referenced by the 'wbcd_testing_pred' object
wbcd_testing_pred <- knn(train = wbcd_training, test = wbcd_testing, 
			 cl = wbcd_training_labels, k = 21)

# Display a CrossTable featuring the four possible categories, i.e., True Positive,
# False Positive, True Negative, or False Negative
CrossTable(x = wbcd_testing_labels, y = wbcd_testing_pred, prop.chisq = F)





































