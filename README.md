![picture alt](https://raw.githubusercontent.com/chaitanya-ramji/See-Food/master/banner.png)

### Description ###
An iOS Application inspired by HBO's Silicon Valley built to classify food and provide it's nutritive information. The app contains a CoreML model built with [Keras 1.2.2](https://keras.io) and is a fine-tuned [InceptionV3 model](https://arxiv.org/abs/1512.00567). The model is built to recognize over 150 dishes from multiple cuisines. For each of these dishes I gathered around 800 to 9000 images from Google, Instagram and Flickr which matched a search query to the title of the category. I was able to achieve **86.97%** Top-1 Accuracy and **97.42%** Top-5 Accuracy

### Introduction ###
Convolutional Neural Networks (CNN), a technique within the broader Deep Learning field, have been a revolutionary force in Computer Vision applications, especially in the past half-decade or so. One main use-case is that of image classification, e.g. determining whether a picture is that of a dog or cat.

![picture alt](http://d3kbpzbmcynnmx.cloudfront.net/wp-content/uploads/2015/11/Screen-Shot-2015-11-07-at-7.26.20-AM.png)

You don't have to limit yourself to a binary classifier of course; CNNs can easily scale to thousands of different classes, as seen in the well-known ImageNet dataset of 1000 classes, used to benchmark computer vision algorithm performance.

![picture alt](https://blog.keras.io/img/keras-tensorflow-logo.jpg)

### The Project ###
As an introductory project for myself, and on the lines of what I have learnt in CS229 at Stanford, I chose to use a pre-trained image classifier that comes with Keras. I have been in love with HBO's silicon valley and I'm especially fond of the character Jian Yang. Hence I chose this project.

There are 150 different classes of food with 800 to 900 labeled images per class for supervised training. 

### Approach ###
I found this script on github: [keras-finetuning](https://github.com/danielvarga/keras-finetuning) and used it for the finetuning of my dataset.

### Screenshots ###
![picture alt](https://raw.githubusercontent.com/chaitanya-ramji/See-Food/master/banner-screenshot.png)
