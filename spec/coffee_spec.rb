# coffe class
Coffee = Struct.new(:cost, :add, :colour, :temperature) do
  STANDARD_COST = 1

  def cost
    extras = 0.0
    if ingredients[:milk]
      extras = ingredients[:milk].to_f
    end
    STANDARD_COST.to_f + extras
  end

  def add(ingredient)
    @ingredients ||= {}
    if ingredient == :milk
      if  @ingredients[:milk]
        @ingredients[:milk] += 0.25
      else
       @ingredients.merge!(milk: 0.25)
     end
    end
  end

  def ingredients
    @ingredients ||= {}
    @ingredients
  end

  def colour
    ingredients[:milk] ? :light : :dark
  end

  def temperature
    ingredients[:milk] ? 180 : 210
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

    it 'is light in colour' do
      expect(coffee.colour).to be(:light)
    end

    it 'is cooler than 200 degrees Fahrenheit' do
      expect(coffee.temperature).to be < (200)
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
