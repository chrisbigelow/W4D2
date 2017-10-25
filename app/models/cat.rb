# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: %w(black white tuxedo calico tabby)}
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F)}
  validates :description, presence: true
  has_many :cat_rental_requests
  # start_date: 10/31/2017
  # end_date: 1/05/2017
end
