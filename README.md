## Bank Tech Test ##

## Specification ##

Requirements
----

Interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

Acceptance criteria
---

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

Assumptions
---

- Opening balance is zero
- statement to be printed with most recent transaction first 
- One user 

Edge cases
---

- invalid deposit or withdraw amount e.g. ('wf')
- Overdraft (negative balance) is acceptable

Approach
---
- TDD
- Initially decided to do two classes (Account and Statement). One account class that looks after the accounts balance, deposit & withdraws. I then attempted the second class; Statement, to look after the printing of transactions. Half way through decided to add additional class called transactions.
The transaction class looked after every transaction entry 

Classes:
  - Account class (deposit, withdraw and balance method and error raising if necessary), ✅
  - transaction class was added later  - (date, amount, balance, type) ✅
  - Statement class -printing. ✅


