class Portfolio
  def initialize
    @transactions = []
  end

  def add_transaction(transaction)
    return unless transaction.stock

    @transactions << transaction
  end

  def profit(start_date, end_date)
    transactions = @transactions.select do |transaction|
      transaction.date >= Date.parse(start_date) &&
        transaction.date <= Date.parse(end_date)
    end

    { profit: transactions_profit(transactions),
      annualized_return: annualized_return(transactions) }
  end

  def transactions_profit(transactions)
    return if transactions.empty?

    end_date = transactions.max_by(&:date)&.date

    transactions.sum { |transaction| transaction.profit(end_date) }
  end

  def annualized_return(transactions)
    return if transactions.empty?

    first_price = price(transactions.min_by(&:date))
    last_price  = price(transactions.max_by(&:date)).to_f
    time        = years_between(transactions).to_f

    percentage((last_price / first_price)**(1 / time) - 1)
  end

  private

    def price(transaction)
      transaction.stock.price
    end

    def years_between(transactions)
      ((transactions.last.date - transactions.first.date) / 365).to_f
    end

    def percentage(number)
      "#{(number * 100).round(2)}%"
    end
end
