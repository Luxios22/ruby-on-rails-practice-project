# frozen_string_literal: true

# app/models/reservation.rb
class Reservation < UserActivity
  def self.cancel_expired_reservations
    where(type: "Reservation", active: true, created_at: ..5.days.ago).update_all(active: false)
  end

  def expired?
    created_at <= 5.days.ago
  end
end
