# Grateful Dead Setlists: Exploratory Analysis and a Markov Chain Model

The Grateful Dead are well known for having long live setlists with a huge array of songs to choose from. Throughout my long standing obsession with the band, I've always wondered how they decided setlists and whether there was any pattern to them at all. To study this mathematically, I created this project to explore their setlist trends over the years, as well as fitting a Markov Chain to see if there is any meaningful way to predict what comes next in a set, and whether there is indeed any method behind the madness of the Grateful Dead.

The analysis arrived at a 49.2% chance that the next song in a setlist that the model had never seen would be in the models top 5 predictions. This is compared to a baseline hit rate of 14.6% when always guessing from the top 5 most popular songs. This shows the model has some real predictive power considering the model has over 400 songs that could come next. 

![alt text](https://github.com/luke-galt/grateful-dead-exploratory-analysis/blob/245b662d094b9b41c2918e5fdc4d2166f77e5700/images/RelativeHeatmap.png?raw=true)

*Heatmap of the 50 most-played songs by era (excluding Drums and Space). Each value shows how much more or less often a song was played in that era compared with the average song played at least once in that era. Darker means more than usual for that era.*

## Method

The data was sourced from a website named jerrybase.com, who are dedicated to archiving the career of Grateful Dead guitarist Jerry Garcia. The data was easily downloadable straight from the website to a CSV file.

This data was incredibly messy and had to be cleaned. Much of the data was cleaned by myself, although Claude AI helped with much of it, including the initial preclean of the data. 

Once the data was cleaned, I transported the data into SQL where I ran several queries to get interesting datasets and sort the data into the different eras of the Grateful Dead. Deciding on the era's is a hard task but in the end I decided upon grouping it by whoever was the keyboardist at the time. This data was used to produce many informative graphs and heatmaps to illustrate how the band's live sets changed over time.

Following this, I moved to the main mathematical aspect of the project, fitting a Markov chain model to the data to see if we could meaningfully predict what song would come next in a setlist. To do this I built a transition matrix using our data, incorporating Laplace Smoothing to represent the fact that just because a transition never occurred didn't mean it was impossible to happen.

To test if the stationary distribution we obtained from this has any actual predictive power, I rebuilt the transition matrix with 20% of the setlists removed and then tested the model on the unseen data to see how well it does at predicting what actually came next. The model had a hit rate of 49.2% for songs in its predicted top 5 compared to just a 14.6% hitrate assuming the next song would always be in the top 5 most played. 

## Key Findings

Some songs have clear eras, such as Casey Jones being heavily concentrated early and falling off quickly, or Bird Song which started as a rarity before becoming more of a concert staple as time went on. Turn On Your Lovelight was very popular early on before falling off sharply and having a small renaissance in later eras. Some songs stayed in rotation throughout the bands whole career, such as Sugar Magnolia and The Other One. 

The model also predicts better than a guess just based on popularity, with the model predicting that the next song will be in the model's top 5 with 49.2% accuracy, significantly above the 14.6% accuracy we'd expect with just guessing the top 5 most popular songs each time. Complete chance would be only 1.2% (5 out of 421 songs).

## Limitations

The smoothing parameter alpha was tuned on the test dataset, by choosing based on the log-likelihood on the same dataset that was used to test the accuracy. A separate validation split of the data would fix this issue, although the effect is likely to be small as the likelihood stays pretty flat for other close values of alpha. 

The model is first order dependent only, with no reference to potential effects of previous songs in the setlist. With 421 songs, the amount of song pairs are small so getting reliable data would be tough. 

The model was only validated on one random split, rather than completing full cross-validation.

Era comparison was only completed to explain song popularity but could be used to see if transition behaviour changed over eras too.

All of the above I plan to implement some fixes for in later updates to the project.
