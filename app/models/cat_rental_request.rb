# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  belongs_to :cat, dependent: :destroy
  validate :does_not_overlap_approved_request

  def overlapping_requests

    CatRentalRequest
    .where.not(id: self.id)
    .where(cat_id: self.cat_id)
    .where.not('start_date > ? OR end_date < ?', end_date, start_date)

  end

  def overlapping_approved_request
    overlapping_requests.where("status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
    overlapping_approved_request.exists?
  end

end
