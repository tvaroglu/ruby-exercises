class Catalog
  attr_accessor :products

  def initialize()
    @products = Array.new
  end

  def <<(product)
    if product.class == Product
      self.products << product
    end
  end

  def cheapest()
    query = self.products.min_by do |product|
      product.price
    end
    if query != nil
      return query.name
    else
      return nil
    end
  end

  def priciest()
    query = self.products.max_by do |product|
      product.price
    end
    if query != nil
      return query.name
    else
      return nil
    end
  end

end
