class Transaction
  attr_accessor :date, :holdings, :stock

  def initialize(date, holdings)
    @date = Date.parse(date)
    @holdings = holdings
    self.stock = Stock.find_by_date(date)
  end

  def profit(end_date)
    holdings * (Stock.price(end_date) - stock.price)
  end
end
