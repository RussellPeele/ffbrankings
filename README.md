# ffbrankings


Background: 

Success in Fantasy football is all about projecting individual performance for each player. Whoever can best predict player performance wins. Since fantasy Football has become such big business, there exist plenty of performance predicting experts, algorithms, utilities. In fact, a recent study by Isaac Peterson at fantasyfootballanalytics.net has come to the general conclusion that the best performance prediction comes from taking the average of all the existing performance prediction services. 

Abstract:

The purpose of this app is exploratory data analysis - looking into the predictability of specific aspects of fantasy football. Some aspects are more reliable while some are more driven by luck. Since each manager (ie human player) has limited capital to spend on players, an efficient manager should put the most capital towards reliable returns while being frugal and riskier with the areas of the game that ultimately are a product of random chance. Example: “Touchdowns are flukey” is a common claim. The implication here is that a player who relies heavily on TD for fantasy points does not reliably hit his projection. Are claims like this true? Are specific players more reliable? Can a highly ranked running back be counted on to hit their projection? Does consistency rise or fall with the player’s tier? Are certain positions more consistent than others? This app can be used to begin to shed light on all these questions and combinations thereof, and in doing so tell us which metrics would be most useful to research further. 

How to use the app:

Tab 1 - Visualization of player consistency. Input the player’s name and year range to see how the player has performed over that range relative to expectation. 

Tab 2 - Rank differential. Input the year range and tier (top 10, top 50,..., top 500) to output the mean difference between projected rank and actual rank for each position. 

Tab 3 - Point differential for an entire season. Input year range and tier to see which positions in the tier of interest matched their expected points for each season. 

Tab 4 - Points per game differential. Input year range and tier to see which positions in the tier of interest matched their expected points per game output. 

Tab 5 - Regression analysis between predictor(s) and consistency. Input position and predictive variable (touchdowns, rushing yards, receptions…) to see a linear analysis of the relationship between specific predictor and actual performance for the chosen position. 

Tab 5 caveat - Predicting Running back performance with a largely unrelated variable such as "tackles" or "sacks" will yield the expected result ~ zero correlation. More interesting tests would be to evaluate tds vs rushing yards vs receiving yards, etc... That way we can dig into the question: which is more reliable, a goal line running back or a high volume back on the rest of the field. 

