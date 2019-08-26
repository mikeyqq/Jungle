module SalesHelper

  def active_sale?
    Sale.active.any?
    #this below is not dry enough
  # Sale.where('sales.starts_on <= ? AND sales.ends_on >= ?', 
  # Date.current, Date.current).
  end
end
