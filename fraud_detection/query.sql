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

--Part 1(b)
--Count the transactions that are less than $2.00 per cardholder.
CREATE VIEW less_than_dollar_two AS
SELECT transaction.card AS "Card", COUNT(transaction.amount) AS "Transaction Amount"
FROM transaction
WHERE transaction.amount < 2.00
GROUP BY transaction.card, transaction.amount
ORDER BY "Transaction Amount" DESC;

SELECT*
FROM less_than_dollar_two
--Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
--answer:

--Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.

--Part 1(c)
--What are the top 100 highest transactions made between 7:00 am and 9:00 am?
CREATE VIEW top_100_transactions_7_9 AS
SELECT transaction.date, transaction.amount
FROM transaction
WHERE EXTRACT(HOUR FROM date) BETWEEN '07' AND '08'
ORDER by amount DESC
LIMIT 100;
--Rest of the day
CREATE VIEW top_100_transactions_rest AS
SELECT transaction.date, transaction.amount
FROM transaction
WHERE EXTRACT(HOUR FROM date) NOT BETWEEN '07' AND '08'
ORDER by amount DESC
LIMIT 100;

--Part 1(d)
--Do you see any anomalous transactions that could be fraudulent?
--Part 1(e)
--Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
--Part 1(f)
--If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

--What are the top 5 merchants prone to being hacked using small transactions?
CREATE VIEW top_5_prone AS
SELECT transaction.id_merchant AS "Merchant ID", COUNT(transaction.amount) as "Small Transactions"
FROM transaction
WHERE transaction.amount < 2
GROUP BY transaction.id_merchant
ORDER BY COUNT(transaction.amount) DESC
LIMIT 5;

--Part 2
--Your CFO has also requested detailed trends data on specific card holders. Use the starter notebook to query your database and generate visualizations that supply the requested information as follows, then add your visualizations and observations to your markdown report:
--The two most important customers of the firm may have been hacked. Verify if there are any fraudulent transactions in their history. For privacy reasons, you only know that their cardholder IDs are 2 and 18.
SELECT transaction.amount AS "Amount", credit_card.card AS "Credit Card", credit_card.cardholder_id AS "Cardholder ID"
FROM transaction
LEFT JOIN credit_card 
ON transaction.card = credit_card.card
WHERE credit_card.cardholder_id = 2 or credit_card.cardholder_id = 18;

--The CEO of the biggest customer of the firm suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. Again, for privacy reasons, you know only that the cardholder ID in question is 25.
--Daily transactions from jan to jun 2018 for card holder 25
SELECT EXTRACT(MONTH FROM transaction.date) AS "Month", EXTRACT(DAY FROM transaction.date) AS "Date", transaction.amount AS "Amount"
FROM transaction
JOIN credit_card on credit_card.card = transaction.card
JOIN card_holder on card_holder.id = credit_card.cardholder_id
WHERE card_holder.id = 25 
AND  EXTRACT(MONTH FROM transaction.date) <= 6;










