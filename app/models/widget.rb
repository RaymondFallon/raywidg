class Widget < ApplicationRecord

  validates_presence_of :quantity, :email, :color, :due_by, :w_type

  # validates :color, inclusion: { in: ['red', 'blue', 'yellow'], message: "%{value} is not a valid color" }
  # validates :w_type, inclusion: { in: ["Widget", "Widget Pro", "Widget Xtreme"], message: "%{value} is not a valid widget type" }
  # The above 2 validators not working as expected. The form forces users to select 
  # appropriate options, but these validators should be implemented before rollout

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates_format_of :email 

end
