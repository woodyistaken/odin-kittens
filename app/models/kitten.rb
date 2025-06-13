class Kitten < ApplicationRecord
  validates :name, presence: { message: " is nonexistent I guess" }
  validates :age, presence: { message: " is needed" }, comparison: { less_than: 20, message: " is too much" }
  validates :softness, presence: { message: " needed or your cat not soft" }
  validates :cuteness, presence: { message: " overload!!!" }
end
