# frozen_string_literal: true

module SharedFunc
  def self.random_alpha_numeric(size = 14)
    charset = %w[2 3 4 6 7 9 A C D E F G H J K L M N P Q R T V W X Y Z]
    (0...size).map { charset.to_a[rand(charset.size)] }.join
  end

  def self.random_code(size = 8)
    charset = %w[0 1 2 3 4 5 6 7 8 9]
    (0...size).map { charset.to_a[rand(charset.size)] }.join
  end
end
