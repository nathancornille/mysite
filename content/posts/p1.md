+++
title =  "Taking automatic deconfounding for out-of-distribution performance under the loop"
date = 2022-03-17
tags = []
description = ""
custom_css= ["/css/custom.css"]
+++

This blog post will give a less technical explanation of the main ideas from my (first!) paper [Critical Analysis of Deconfounded Pretraining to Improve Visio-Linguistic Models](https://www.frontiersin.org/articles/10.3389/frai.2022.736791/full).
Let's dive right into it.


### The goal: out-of-distribution performance
Machine learning has improved a lot in its ability to learn an accurate predictive model of various kinds of data.
Specifically for data that is visual (in the form of pixels) or linguistic (in the form of natural language) great strides have been made.
A big challenge that remains however, is to predict well when the distribution of data on which we train differs from the one on which we want to make predictions: this is called out-of-distribution (or OOD) prediction.
One proposed way of addressing this challenge, is by using **causal** models.

### Causality and OOD
You can find a more detailed explanation as well as an example of the link between causal models and OOD prediction in [section 3 of the paper](https://www.frontiersin.org/articles/10.3389/frai.2022.736791/full#h4).
In a nutshell though, in a causal model you chop up (or 'factorize') the relations in your data into pieces that follow lines of the underlying causality.
For example, when modelling the presence of rain and umbrellas in the street, you'll model 1) the probability of rain (P<sub>R</sub>), 2) the probability of umbrellas _given_ rain (P<sub>U|R</sub>).
The alternative would be to model 1) the probability of umbrellas (P<sub>U</sub>) 2) the probability of rain given umbrellas (P<sub>R|U</sub>).
The link with OOD prediction then comes from the Sparse Mechanism Shift (SMS) assumption proposed by Bernard Schölkopf and others: this assumption states that differences in distribution typically correspond to the change in only a few causal mechanisms.
For example, when we change our distribution by looking at data from a more rainy country, if you factorized the relations causally, only P<sub>R</sub> will change.
If you factorized them the other way however, both factors P<sub>U</sub> and P<sub>R|U</sub> will change.

### Deconfounding
Now, several papers have tried to use this reasoning to create models that are better at OOD prediction.
A particular class of papers that I take under the loop here, are papers that try to automatically do deconfounding in order to learn more causal models.
Deconfounding is a technique to adjust for the effect of a common cause when investigating the relation between two variables.
For example, the prevalence of storks, and the prevalence of new babies is correlated in European countries.
This can mean three things: storks cause babies (by carrying them in), babies cause storks (maybe they attract them in some way), **or** a common cause has an influence on both (say, the socio-economic status of a country, which has an influence both on how much nature there is, as on the birthrates).
If we look at the relation between babies and storks _for countries with the same socio-economic status)_, we might well find the relation disappears.

### Issues with automatic deconfounding
The tricky thing about doing deconfounding, is that you need to know what is a correct confounder (in our example: socio-economic status) in the first place.

Researchers that have made use of the technique that I take under the loop (which I call _AutoDeconfounding_ or AD), assume it can automatically discover correct confounders just from looking at data.
However, this hasn't been tested explicitly, so we create a dataset to test whether true confounders are actually found.


Moreover, the link between AD and theoretically correct deconfounding hadn't been made explicit yet, so we formalize the assumptions that need to hold for the implementation of AD to match correct deconfounding.

Finally, what _has_ been shown, is that AD improves OOD prediction performance. However, we provide evidence that the improved performance observed in previous experiments isn't actually due to AD.

### Our results

#### Are confounders found?
To answer this question, we need ground-truth data of what variables are confounders.
As a confounder is by definition a cause of two other variables, we need to know which variables cause which.
In our case, the variables aren't storks and babies, but the presence of objects in a scene.
The ideal way to test whether a causal relation, is by doing an experiment (e.g., a randomized controlled trial): put an object in a scene (say a raincloud), and observe whether some other object (an umbrella) subsequently appears or not.
As we deemed it too hard to do this kind of live experimentation (it is tricky to drag rainclouds in front of a camera), we went for an approximation instead: human judgement.
We asked crowdworkers to judge the relation between the presence of objects, and took that as our ground truth.

We found that the confounder-finding mechanism _did_ in fact outperform a random baseline in correctly distinguishing causes from non-causal correlates.
However, we found that doing better at confounder-finding did not correlate with a better OOD performance.

#### Is AD equivalent with deconfounding?
The actual implementation of AD is somewhat far removed from the theoretical principle.
We made the link more clear by making the assumptions explicit under which the implementation matches the theory.
The assumptions come down to a need for the encoding of the confounder variables to be powerful enough to represent their full state, and the need for the confounders to be mutually independent.

#### Does AD improve OOD performance?
For our final result, we redo the original experiments that investigate the effect of AD.
We compare a model using AD with a baseline model that doesn't use it. In contrast to previous work, we don't just copy the results from the baseline models as they were originally reported, but reproduce both the AD model as the baseline model ourselves, to get a like-for-like comparison.
In this like-for-like comparison, _we no longer observe the improvement in performance_.
Moreover, we create a few ablated models, which change AD such as to be less related to theoretical deconfounding, and find that these too don't perform worse than the original AD model.

### So what?
Our investigation has mainly been a critical story: what things are _not_ yet as they should be.
I think this is how science progresses however: sometimes you advance the field by proposing something new, sometimes you do it by correcting an existing theory.
Hence, I hope this will enable other researchers who are interested in leveraging causality for OOD performance to know which techniques to use, and which techniques still have their limitations.














