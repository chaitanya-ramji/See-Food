![picture alt](https://raw.githubusercontent.com/chaitanya-ramji/See-Food/master/banner.png)

### Description ###
An iOS Application inspired by HBO's Silicon Valley built to classify food and provide it's nutritive information. The app contains a CoreML model built with [Keras 1.2.2](https://keras.io) and is a fine-tuned [InceptionV3 model](https://arxiv.org/abs/1512.00567). The model is built to recognize over 150 dishes from multiple cuisines. For each of these dishes I gathered around 800 to 900 images from Google, Instagram and Flickr which matched a search query to the title of the category. I was able to achieve **86.97%** Top-1 Accuracy and **97.42%** Top-5 Accuracy

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

Over the last 2 months, I have built this project by exploring various models for machine learning. This is the best result I have achieved as of October 7th 2017

Once I built my model, I had to convert it into a __.mlmodel__ file for use inside Xcode. 

### Converting Trained Models to Core ML ###
I used [Core ML Tools](https://pypi.python.org/pypi/coremltools) to convert it to the Core ML model format.
> #### NOTE ####
>Core ML Tools is a Python package (`coremltools`), hosted at the Python Package Index (PyPI). For information about Python packages, see Python Packaging User Guide.

This is how you can convert a kera built model to CoreML using the tools.

```python

import coremltools
coreml_model = coremltools.converters.keras.convert('foodModel.h5')

coreml_model.save('foodModel.mlmodel')
```

Once the CoreML model was created, I imported it into my Xcode workspace and let Xcode automatically create the class for it. I simply used these classes in my swift code for detection of food.

### Code and Usage ###
I'll be uploading the code and it's usage soon.

### Screenshots ###
![picture alt](https://raw.githubusercontent.com/chaitanya-ramji/See-Food/master/banner-screenshots.png)

### Future Plans ###
- [ ] Cuisine Categorization
- [ ] Fetch Recipie for image
- [ ] Increase dataset to include over 300 titles
- [ ] Reduce latency while identifying the food item
