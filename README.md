#### Module 7 Challenge: Identifying Fraud
##### Anvitha Chaluvadi

<p align="center">
<img src = Images/fraud.gif width =40% height 30%=/>
</p>

### Background
Fraud is prevalent these days, whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this homework assignment, you will apply your new SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

 You are asked to accomplish three main tasks:

* Data Modeling: Define a database model to store the credit card transactions data and create a new PostgreSQL database using your model.

* Data Engineering: Create a database schema on PostgreSQL and populate your database from the CSV files provided.

* Data Analysis: Analyze the data to identify possible fraudulent transactions trends data, and develop a report of your observations.

I will apply my new SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

---
### Entity Relationship Diagram

<p align="center">
<img src = Images/ERD-fraud_detection.png width =60% height 30%=/>
</p>

### <ins>Fraudulent Transactions Report</ins>

### Part 1
* Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders.

    * How can you isolate (or group) the transactions of each cardholder?
        * In Part 1(a) in query.

    * Count the transactions that are less than $2.00 per cardholder.
        * In Part 1(b) in query.

    * Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
        * Answer: The data indicates numerous transactions below $2 on 53 credit cards, with 6 of them having 10 or more such transactions. This information raises concerns about the potential hacking on those credit cards.

* Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.

    * What are the top 100 highest transactions made between 7:00 am and 9:00 am?
        * In Part 1(c) in query.

    * Do you see any anomalous transactions that could be fraudulent?
        * Answer: The list of numbers does not suggest that a credit card has been hacked.

    * Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
        * Answer: No, the data does not show a high number of fradulent transactions during that time frame versus the rest of the day.

    * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.
        * Answer: N/A

* What are the top 5 merchants prone to being hacked using small transactions?
    * In Part 1(d) in query.

### Part 2
* Your CFO has also requested detailed trends data on specific card holders. Use the starter notebook to query your database and generate visualizations that supply the requested information as follows, then add your visualizations and observations to your markdown report:

    * The two most important customers of the firm may have been hacked. Verify if there are any fraudulent transactions in their history. For privacy reasons, you only know that their cardholder IDs are 2 and 18. 
        * In Part 2(a) in query.

    #### Both Plots of Card Holders 2 and 18 Seperately  
     <p align="center">
     <img src = Images/cardholder2_graph.jpg width =60% height 30%=/>
     </p>
     <p align="center">
     <img src = Images/cardholder18_graph.jpg width =60% height 30%=/>
     </p>

    #### Combined Plot of Card Holders 2 and 18

     <p align="center">
     <img src = Images/combined2and18.jpg width =60% height 30%=/>
     </p>


* The CEO of the biggest customer of the firm suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. Again, for privacy reasons, you know only that the cardholder ID in question is 25.
    * The daily transactions from Jan to Jun 2018 for card holder 25.
        * In Part 2(b) in query.

     <p align="center">
     <img src = Images/outlier.jpg width =60% height 30%=/>
     </p>

* Are there any outliers for cardholder ID 25? How many outliers are there per month?
    * Answer: The graph indicates that there are outliers in all months, but February.
	    * Number of outliers:
		    * January : 1
			* March: 1
			* April: 3
			* May: 1
			* June: 3

* Do you notice any anomalies? Describe your observations and conclusions.
    * Answer: There are nine outliers recorded between January and June 2018. It's possible that fraudulent activities occurred in both the first and second quarters of 2018.


