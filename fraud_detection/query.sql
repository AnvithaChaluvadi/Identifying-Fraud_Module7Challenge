--Previewing tables to ensure data values, etc.
SELECT * 
FROM card_holder;

SELECT *
FROM credit_card;

SELECT * 
FROM merchant_category;

SELECT *
FROM merchant;

SELECT *
FROM transaction;
---

--Data Analysis

--Part 1
--The CFO of your firm has requested a report to help analyze potential fraudulent transactions. Using your newly created database, generate queries that will discover the information needed to answer the following questions, then use your repository's ReadME file to create a markdown report you can share with the CFO:
--Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders.

--Part 1(a)
--How can you isolate (or group) the transactions of each cardholder?
CREATE VIEW group_transactions_each_cardholder AS
SELECT card_holder.id AS "Card Holder ID", card_holder.name AS "Card Holder Name",
COUNT(transaction.id) AS "Transactions"
FROM card_holder
JOIN credit_card ON card_holder.id = credit_card.cardholder_id
JOIN transaction ON credit_card.card = transaction.card
GROUP BY  card_holder.id, card_holder.name
ORDER BY "Transactions" DESC;

SELECT*
FROM group_transactions_each_cardholder

--Part 1(b)
--Count the transactions that are less than $2.00 per cardholder.
CREATE VIEW less_than_dollar_two AS
SELECT transaction.card AS "Card", COUNT(transaction.amount) AS "Transaction Amount"
FROM transaction
WHERE transaction.amount < 2.00
GROUP BY transaction.card
ORDER BY "Transaction Amount" DESC;

SELECT*
FROM less_than_dollar_two

--Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
--Answer: The data indicates numerous transactions below $2 on 53 credit cards, with 6 of them having 10 or more such transactions. This information raises concerns about the potential hacking on those credit cards.


--Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.

--Part 1(c)
--What are the top 100 highest transactions made between 7:00 am and 9:00 am?
CREATE VIEW top_100_transactions_7_9 AS
SELECT transaction.date AS "Date", transaction.amount AS " Transaction Amount"
FROM transaction
WHERE EXTRACT(HOUR FROM transaction.date) BETWEEN '07' AND '08'
ORDER by transaction.amount DESC
LIMIT 100;

SELECT*
FROM top_100_transactions_7_9

--Rest of the day
CREATE VIEW top_100_transactions_rest AS
SELECT transaction.date AS "Date", transaction.amount AS " Transaction Amount"
FROM transaction
WHERE EXTRACT(HOUR FROM transaction.date) NOT BETWEEN '07' AND '08'
ORDER by transaction.amount DESC
LIMIT 100;

SELECT*
FROM top_100_transactions_rest

--Do you see any anomalous transactions that could be fraudulent?
--Answer: The list of numbers does not suggest that a credit card has been hacked.

--Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
--Answer: No, the data does not show a high number of fradulent transactions during that time frame versus the rest of the day.

--If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.
-- Answer: N/A

--Part 1(d)
--What are the top 5 merchants prone to being hacked using small transactions?
CREATE VIEW top_5_prone AS
SELECT transaction.id_merchant AS "Merchant ID", COUNT(transaction.amount) as "Small Transactions"
FROM transaction
WHERE transaction.amount < 2
GROUP BY transaction.id_merchant
ORDER BY COUNT(transaction.amount) DESC
LIMIT 5;

SELECT*
FROM top_5_prone

--Part 2
--Your CFO has also requested detailed trends data on specific card holders. Use the starter notebook to query your database and generate visualizations that supply the requested information as follows, then add your visualizations and observations to your markdown report:

--Part 2(a)
--The two most important customers of the firm may have been hacked. Verify if there are any fraudulent transactions in their history. For privacy reasons, you only know that their cardholder IDs are 2 and 18.
SELECT transaction.date AS "Date", credit_card.cardholder_id AS "Card Holder ID" , transaction.amount AS "Amount" 
FROM transaction
LEFT JOIN credit_card 
ON transaction.card = credit_card.card
WHERE credit_card.cardholder_id = 2 or credit_card.cardholder_id = 18;


--The CEO of the biggest customer of the firm suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. Again, for privacy reasons, you know only that the cardholder ID in question is 25.
--Part 2(b)
--The daily transactions from Jan to Jun 2018 for card holder 25.
SELECT EXTRACT(MONTH FROM transaction.date) AS "Month", EXTRACT(DAY FROM transaction.date) AS "Date", transaction.amount AS "Amount"
FROM transaction
JOIN credit_card on credit_card.card = transaction.card
JOIN card_holder on card_holder.id = credit_card.cardholder_id
WHERE card_holder.id = 25 
AND  EXTRACT(MONTH FROM transaction.date) <= 6;

--Are there any outliers for cardholder ID 25? How many outliers are there per month?
--Answer: The graph indicates that there are outliers in all months, but February.
	-- Number of outliers
			-- January : 1
			-- March: 1
			-- April: 3
			-- May: 1
			-- June: 3
			
--Do you notice any anomalies? Describe your observations and conclusions.
--Answer: There are nine outliers recorded between January and June 2018. It's possible that fraudulent activities occurred in both the first and second quarters of 2018.







