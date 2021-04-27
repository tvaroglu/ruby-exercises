class Clearance
  attr_accessor :items

  def initialize()
    @items = Array.new
  end

  def <<(item)
    if item.class == Item
      self.items << item
    end
  end

  def best_deal()
    query = self.items.max_by do |item|
      (item.attributes[:discount].to_f) / (item.attributes[:price].to_f)
    end
    if query != nil
      return query.name
    else
      return nil
    end
  end

end
