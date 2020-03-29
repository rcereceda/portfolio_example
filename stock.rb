class Stock
  class << self; attr_accessor :all end
  attr_accessor :date, :price

  @all = []

  def initialize(date, price)
    @date = Date.parse(date)
    @price = price
    self.class.all << self
  end

  def self.price(date)
    find_by_date(date)&.price
  end

  def self.find_by_date(date)
    @all.find { |stock| stock.date == date }
  end
end
