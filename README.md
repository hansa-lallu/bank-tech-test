## Bank Tech Test ##

## Specification ##
Work alone to build a bank app to the specifications below.

Requirements
----

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).


Acceptance criteria
---

- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

User stories
---
``` 
As an account holder
So I can keep a record of my balance
I would like to see my balance 

As an account holder
So I can keep my money safe
I would like to deposit some money into my account

As an account holder
So I can spend my cash
I would like to withdraw some money from my account

As an account holder
So I know when money is going in and out 
I would like to print a record of my transactions

As an account holder
So I can easily read my statement 
I would like to see my statement with the latest transaction first
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

Installation
---

- clone this repository to your local machine and cd into the directory 
- run the command `gem install bundle` and then `bundle`

How to run
---
- Launch IRB using the command `irb` in your terminal
- require the ruby files
- Make a new account
- Make some deposits and withdraws
- Make a new statement, passing in your account
- Display your statement

```
2.7.0 :001 > require './lib/account.rb'
 => true 
2.7.0 :002 > require './lib/statement.rb'
 => true 
2.7.0 :003 > account = Account.new
2.7.0 :004 > account
 => #<Account:0x00007faca8900248 @balance=0, @transactions=#<Transaction:0x00007faca8900220 @log=[]>> 
2.7.0 :005 > account.deposit(500)
 => 500 
2.7.0 :006 > account.deposit(1500)
 => 2000 
2.7.0 :007 > account.withdraw(750)
 => 1250 
2.7.0 :008 > account
 => #<Account:0x00007faca8900248 @balance=1250, @transactions=#<Transaction:0x00007faca8900220 @log=[["24/03/2020", "500.00", "", "500.00"], ["24/03/2020", "1500.00", "", "2000.00"], ["24/03/2020", "", "750.00", "1250.00"]]>> 
2.7.0 :009 > statement = Statement.new(account)
2.7.0 :010 > statement
 => #<Statement:0x00007facaa08a760 @account=#<Account:0x00007faca8900248 @balance=1250, @transactions=#<Transaction:0x00007faca8900220 @log=[["24/03/2020", "500.00", "", "500.00"], ["24/03/2020", "1500.00", "", "2000.00"], ["24/03/2020", "", "750.00", "1250.00"]]>>> 
2.7.0 :011 > statement.display
date || credit || debit || balance
24/03/2020 || 500.00 || || 500.00
24/03/2020 || 1500.00 || || 2000.00
24/03/2020 || || 750.00 || 1250.00 => nil
```
Tech Used
---
- Ruby
- RSpec
- Simplecov
- Rubocop

Testing
---
Testing can be done using RSpec by running the command `rspec`

Approach
---
- TDD
- Initially decided to do two classes (Account and Statement). One account class that looks after the accounts balance, deposit & withdraws. I progressed onto the second class, Statement. Statement was used to print the transactions. Half way through decided to add additional class called transactions. The transaction class looked after every transaction entry.

Classes:
  - Account class - (deposit, withdraw and balance method and error raising if necessary), ✅
  - transaction class - (date, amount, balance, type) ✅
  - Statement class - display ✅


