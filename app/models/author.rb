class Author < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end

  def coordinates
    [rand(100), rand(100)]
  end
end
