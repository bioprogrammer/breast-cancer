![Breast Cancer Image 1](https://github.com/bioprogrammer/images/blob/master/human-breast-cancer-cells.jpg)

## Background
### Cancer
Cancer is a complex series of diseases distinguished by cell type, location, stage, and grade, but, by definition it is defined by cellular growth that, through a complex series of mechanisms, seeks to evade the innate defenses of the immune system, and in the case of a malignancy, proliferate throughout the body effectively disrupting the homeostatic physiology of organ systems and introducing the possibility of death to the affecte organism or individual. There exist two forms of abnormal cell growth, one of which is erroneously referred to as 'cancer', that exhibit distinct differences in both appearance and behavior:

<center>
  
|Trait|Benign|Malignant|
|-----|------|---------|
|Nuclear size|Small|Large|
|N/C ratio (ratio of nuclear size to cytoplasmic volume)|Low|High|
|Nuclear shape|Regular|Pleomorphic (irregular shape)|
|Mitotic index|Low|High|
|Tissue Organization|Normal|Disorganized|
|Differentiation|Well differentiated|Poorly differentiated (anaplastic)|
|Tumor Boundary|Well defined ("encapsulated")|Poorly defined|

</center>

## Algorithm and Dataset
### Algorithm
k-Nearest Neighbor (k-NN) is a supervised learning algorithm that uses information about an example's k-nearest neighbors in order to classify unlabeled examples. The 'k' is a variable term the implication of which is that any number of nearest neighbors, plotted on a Cartesian coordinate system, could be utilized in the classification process. The selection of 'k' may seem arbitrary, but a common method of selection is to calculate the square root of the number of categorized samples used as training data. Each unlabeled record in the test dataset is then compared to 'k' records in the training set and the mathematical distance, i.e., the similarity, is calculated using the following Euclidian Distance formula:

![Euclidian Distance Formula](https://github.com/bioprogrammer/images/blob/master/euclidian_distance.gif)

'p' and 'q' are the examples being used for comparison with each example possessing 'n' features.  
![p1](https://github.com/bioprogrammer/images/blob/master/p1.gif) and ![q2](https://github.com/bioprogrammer/images/blob/master/q1.gif) refer to the first and second examples respectively that are being compared with each having 'n' features. 

### Dataset
In order to classify tissue biopsy samples into a predicted category, this project will utilize the k-Nearest Neighbor (k-NN) algorithm and the Breast Cancer Wisconsin dataset which consists of the following attributes

**Attribute Information:**

1.) ID number

2.) Diagnosis (M = malignant, B = benign)

3-32.)

**Ten real-valued features are computed for each cell nucleus:**

a.) radius (mean of distances from center to points on the perimeter)

b.) texture (standard deviation of gray-scale values)

c.) perimeter

d.) area

e.) smoothness (local variation in radius lengths)

f.) compactness (perimeter^2 / area - 1.0)

g.) concavity (severity of concave portions of the contour)

h.) concave points (number of concave portions of the contour)

i.) symmetry

j.) fractal dimension ("coastline approximation" - 1)

## Sample output
### Crosstable 
In order to ascertain the efficacy of the k-NN classifier, new, i.e., unlabled, samples within the prediction vector are compared with known, and labeled, values in the test vector. The cell percentages in the table (please see below) indicate the proportion of values that have been deemed to belong in each of the four categories. The top left indicates the number of 'true negative' results, i.e., those predicted to have a benign tumor that actually do. The bottom right cell indicates the number of     
'true negative' results in which the predicted value of 'malignant' and the test result are in agreement. The top right cell contains the proportion, if any, of 'false positives' which are those samples predicted to be malignant but are in reality, benign. This is known as a Type I error, and while not desirable as it can subject a patient to unnecessary expense and medical procedures, it pales in comparison to the dreaded Type II error seen in the lower left cell, the 'false negative'. A misclassification of this nature can occur when a malignant cancer is incorrectly determined to be a benign tumor. The crosstable below reveals a 2% rate of failure upon attempting to classify a benign tumor that was, in reality, malignant. Although an accuracy of 98% may seem impressive, in a "real world" medical setting, the rate of accuracy must be higher and other, more powerful, algorithms explored and assessed for both appropriate use with regard to the problem domain and computational efficacy.

![crosstable](https://github.com/bioprogrammer/images/blob/master/crosstable.png)


