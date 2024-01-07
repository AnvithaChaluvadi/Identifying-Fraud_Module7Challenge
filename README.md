#### Module 7 Challenge: Identifying Fraud
##### Anvitha Chaluvadi

<p align="center">
<img src = Images/fraud.gif width =40% height 30%=/>
</p>

### Background
Fraud is prevalent these days, whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this homework assignment, you will apply your new SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

You are asked to accomplish three main tasks:

 Data Modeling: Define a database model to store the credit card transactions data and create a new PostgreSQL database using your model.
 Data Engineering: Create a database schema on PostgreSQL and populate your database from the CSV files provided.
 Data Analysis: Analyze the data to identify possible fraudulent transactions trends data, and develop a report of your observations.
I will apply my new SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

---

### <ins>Fraudulent Transactions Report</ins>

* Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders.

    * How can you isolate (or group) the transactions of each cardholder?

    * Count the transactions that are less than $2.00 per cardholder.

    * Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.

* Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.

    * What are the top 100 highest transactions made between 7:00 am and 9:00 am?

    * Do you see any anomalous transactions that could be fraudulent?

    * Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?

    * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

* What are the top 5 merchants prone to being hacked using small transactions?
* Create a view for each of your queries.