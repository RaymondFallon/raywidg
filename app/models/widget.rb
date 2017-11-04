class Widget < ApplicationRecord
  include ActiveModel::Validations
  
  validates_presence_of :quantity, :email, :color, :due_by, :w_type

  validates :color, inclusion: { in: ['red', 'blue', 'yellow'], message: "%{value} is not a valid color" }
  validates :w_type, inclusion: { in: ["Widget", "Widget Pro", "Widget Xtreme"], message: "%{value} is not a valid widget type" }

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates_email_format_of :email 

  validate do |widget|
    if widget.due_by == nil
      # This will be handled by presence validator
    elsif widget.created_at != nil
      # This is an update, due_date can be safely ignored
    elsif widget.due_by < 7.days.from_now
      errors.add(:due_by, "Due-by date cannot be sooner than one week from now")
    end
  end

end
