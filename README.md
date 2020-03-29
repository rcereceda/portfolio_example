# Simple Portfolio Example

Simple portfolio example written in Ruby.

The current example can handle only one Stock at a time. If we add a name attribute to Stock class it will allow to manage multiple Stocks.

## Usage

```
require_relative 'base'
```

If you want to have stocks, a portfolio and transactions for example, you can test with this variables:

```
Stock.new("26/03/2018", 10)
Stock.new("26/03/2020", 15)

portfolio = Portfolio.new
portfolio.add_transaction(Transaction.new("26/03/2018", 100))
portfolio.add_transaction(Transaction.new("26/03/2020", 100))
```

In order to get the profit and annualized return of a group of transactions, you can test with the **profit** method:

```
portfolio.profit("26/03/2018", "26/03/2020")
```
