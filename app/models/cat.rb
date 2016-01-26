class Cat < ActiveRecord::Base

  COLORS = ["white", "black", "brown", "orange", "tortoiseshell",
    "tuxedo", "tabby", "siamese", "gray", "tan"]

  validates :birth_date, :name, presence: true
  validates :color, presence: true, inclusion: { in: COLORS}
  validates :sex, presence: true, length: { maximum: 1 },
            inclusion: { in: %w(M F) }

  def age
    today.year - :birth_date.year
  end

  def inspect
    sex == "M" ? cat_pronoun = "he" : cat_pronoun = "she"
    sex == "M" ? pos_pronoun = "his" : pos_pronoun = "her"
    output = "#{name} the cat! #{pos_pronoun.titlecase} color is #{color}, and #{cat_pronoun} was born on #{birth_date}!!!"
  end

end
