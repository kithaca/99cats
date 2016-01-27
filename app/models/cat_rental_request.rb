class CatRentalRequest < ActiveRecord::Base

  belongs_to :cat

  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED']},
            presence: true

  validate :overlapping_approved_requests

  after_initialize :set_status_to_pending

  private

  def overlapping_requests
    CatRentalRequest.where(["id != :id", id: id])
                    .where.not(["(start_date < :start AND end_date < :start) OR (start_date > :end AND end_date > :end)",
                          start: start_date, end: end_date ])
  end

  def overlapping_approved_requests
    return true if overlapping_requests.nil?
    overlapping_requests.each do |request|
      return false if request.status = 'APPROVED'
    end
  end

  def set_status_to_pending
    self.status ||= 'PENDING'
  end

end
