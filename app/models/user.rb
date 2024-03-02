# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { regular: 0, librarian: 1, admin: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validate :password_complexity # password length is already verified by devise, see: config/initializers/devise.rb
  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  has_many :user_activities, dependent: :destroy
  has_many :borrowings, -> { where active: true }
  has_many :borrowing_books, through: :borrowings, source: :book

  before_save :assign_role

  def assign_role
    self.role = :regular if role.nil?
  end

  def admin?
    self.role == "admin"
  end

  def librarian?
    self.role == "librarian"
  end

  def regular?
    self.role == "regular"
  end

  def google_account?
    self.provider == "google_oauth2"
  end

  def borrow(book)
    if borrowing_books.count >= 5
      raise ArgumentError.new "You have already borrowed 5 books, which is the limit. Please return some books before continue borrowing"
    end

    due_borrowings = borrowings.map { |borrowing| borrowing.overdue? }

    if due_borrowings.any?
      raise ArgumentError.new "You have overdue books. Please return those books before continue borrowing"
    end

    if book.borrowing_user.nil?
      borrowing_books << book
      book.reload
    else
      raise ArgumentError.new "Can't borrow an already borrowed book"
    end
  end

  def return(book)
    if book.borrowing_user.nil? || book.borrowing_user.id != id
      raise ArgumentError.new "Can't return book you don't borrow"
    end
    book.borrowing.update(active: false)
    book.reload
    self.reload
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[a-zA-Z])(?=.*?[0-9#?!@$%^&*-])/

    errors.add :password, "must include numbers or symbols and at least one character"
  end

  def self.find_oauth(auth)
    user = User.where(email: auth.info.email).first
    if user.nil? # user does not exist
      return User.create(
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        username: auth.info.name,
        avatar_url: auth.info.image,
        provider: auth.provider,
        uid: auth.uid
      )
    end
    if user.provider.nil?
      return nil # user already exists but not with oauth
    end

    user # user already exists with oauth
  end

  def update_with_password(params = {})
    current_password = params.delete(:current_password)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    result = if params[:password].blank? || valid_password?(current_password)
      update(params)
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      self.attributes = params
      false
    end

    clean_up_passwords
    result
  end

  has_many :book_suggestions

  def self.ransackable_attributes(auth_object = nil)
    ["username", "email"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end

  has_many :reservations, -> { where type: "Reservation" }

  def has_overdue_books?
    borrowings.any?(&:overdue?)
  end

  def can_reserve_books?
    !has_overdue_books?
  end

  def cancel_all_reservations
    reservations.update_all(active: false)
  end
end
