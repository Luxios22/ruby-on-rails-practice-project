# frozen_string_literal: true

class Borrowing < UserActivity
  belongs_to :user
  belongs_to :book

  def overdue?
    deadline <= Time.now
  end

  def deadline
    updated_at + 14.days
  end
end
