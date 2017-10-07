# coffe class
Coffee = Struct.new(:cost, :add) do
  STANDARD_COST = 1

  def cost
    STANDARD_COST.to_f + ingredients.inject(:+).to_f
  end

  def add(ingredient)
    if ingredient == :milk
      extras(0.25)
    end
  end

  def extras(toppings)
    @ingredients ||= []
    @ingredients << toppings
  end

  def ingredients
    @ingredients ||= []
    @ingredients
  end
end

describe 'a cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs 1£' do
    expect(coffee.cost).to eq(1.00)
  end

  context 'with milk' do
    before { coffee.add(:milk) }
    it 'costs 1.25£' do
      expect(coffee.cost).to eq(1.25)
    end
  end

  context 'with 2 milk servings' do
    before { 2.times { coffee.add(:milk) } }
    it 'costs 1.50£' do
      expect(coffee.cost).to eq(1.50)
    end
  end

  context 'with some new ingredients' do
    it 'costs 3.00£' do
      pending 'new ingredients not implemented yet'
      expect(coffee.cost).to eq(3.00)
    end
  end
end
