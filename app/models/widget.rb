class Widget < ApplicationRecord

  validates_presence_of :quantity, :email, :color, :due_by, :w_type

  validates :color, inclusion: { in: ['red', 'blue', 'yellow'], message: "%{value} is not a valid color" }
  validates :w_type, inclusion: { in: ["Widget", "Widget Pro", "Widget Xtreme"], message: "%{value} is not a valid widget type" }

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates_email_format_of :email 

end
