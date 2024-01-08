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

--Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
--answer:

--Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.

--Part 1(c)
--What are the top 100 highest transactions made between 7:00 am and 9:00 am?
SELECT transaction.date, COUNT(transaction.amount),
FROM transaction

--Part 1(d)
--Do you see any anomalous transactions that could be fraudulent?
--Part 1(e)
--Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
--Part 1(f)
--If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

--What are the top 5 merchants prone to being hacked using small transactions?

--Create a view for each of your queries.










