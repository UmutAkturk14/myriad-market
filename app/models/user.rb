class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  validate :username_validation
  validates :username, uniqueness: true
  validates :username, :full_name, presence: true
  has_many :properties, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :offers

  has_one_attached :profile_photo
  # ! This screws things up in the tests, can't figure out why
  # after_validation :arrange_attributes

  # ? Use this if you need to make countries symbol in the DB
  # after_validation :symbolise_country

  private

  def password_complexity
    if password.present?
       if !password.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/)
         errors.add :password, "Password complexity requirement not met. A password should be 8-16 characters long and contain at least one lowercase letter, one uppercase letter and one number."
       end
    end
  end

  def username_validation
    if username.present?
       if !username.match(/^([A-Za-z0-9]){4,20}$/)
         errors.add :username, "Username requirement not met. A username should be 4-20 characters long and only contain letters and numbers."
       end
    end
  end

  def arrange_attributes
    self.full_name = full_name.titleize
  end

  def symbolise_country
    self.country = CS.countries.key(country)
  end
end
