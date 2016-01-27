class Cat < ActiveRecord::Base

  has_many :cat_rental_requests, dependent: :destroy

  COLORS = ["white", "black", "brown", "orange", "tortoiseshell",
    "tuxedo", "tabby", "siamese", "gray", "tan"]

  validates :birth_date, :name, presence: true
  validates :color, presence: true, inclusion: { in: COLORS}
  validates :sex, presence: true, length: { maximum: 1 },
            inclusion: { in: ['M', 'F'] }

  def age
    cat_age = Date.today.year - birth_date.year
  end


end
