class Print < ActiveRecord::Base
  has_many :order_items

  def to_param
    "#{id}-mire-jo-a-routing"
  end
end
