# Programmer: Caitlin Gibbons
# Date: 2019.5.1
# Language: Python
# Purpose: Demonstrate the utility of the k-Nearest Neighbor algorithm. The data used
#          is from the Scikit-Learn (sklearn) datasets module. The user is prompted to
#          to enter the number of nearest neighbors and a random seed value. A brief, but
#          informative summary is displayed regarding parameters used along with the 
#          accuracy achieved is using both the training and testing data. Note: This
#          specific implementation is a command line tool.
#

# Import the packages used by the program
from sklearn.datasets import load_breast_cancer
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.datasets.samples_generator import make_blobs
import matplotlib.pyplot as plt
import mglearn
import warnings

# Turn warnings off for depracations
warnings.filterwarnings('ignore', category = DeprecationWarning)

# Prompt the user for the number of neighbors
knn_neighbors = int(input('Please specify the number of neighbors: '))

# Prompt the user for a random state
knn_rand_state = int(input('Please enter a random state: '))

# Load the breast cancer dataset provided by the sklearn (scikit-learn) library and
# store it in the object named 'cancer'
cancer = load_breast_cancer()

# Divide the cancer data into four objects, i.e., two for training and two for testing.
# The parameters in the function call refer to the data features (columns), the labels
# (benign or malignant), the value(s) to loop over, and a random seed value respectively
x_train, x_test, y_train, y_test = train_test_split(cancer.data, cancer.target, stratify = cancer.target, random_state = knn_rand_state)

# Create a kNN classifier model that utilizes the 10 nearest neighbors in
# the classification process. Reference the model by the variable 'knn'
knn = KNeighborsClassifier(n_neighbors = knn_neighbors)

# Fit the model created to the data in the test set
knn.fit(x_test, y_test)

# Display two blank lines for aesthetic purposes
print('\n\n')

# Display the accuracy of the kNN classifier on the command line
print('k-Nearest Neighbor classification summary: \n')
print('Number of nearest neighbors: {}'.format(knn_neighbors))
print('Random state: {}'.format(knn_rand_state)) 
print('Training data accuracy: {:.1f}%'.format(knn.score(x_train, y_train) * 100))
print('Testing data accuracy: {:.1f}%'.format(knn.score(x_test, y_test) * 100))

# Plot the number of neighbors with the orange trianges representing benign samples
# and blue circles those considered to be malignant
mglearn.plots.plot_knn_classification(n_neighbors = knn_neighbors)

# Display the plot in a detached window
plt.show()

