class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  validate :username_validation
  validates :username, presence: true
  validates :full_name, presence: true
  before_commit :symbolise_country

  def password_complexity
    if password.present?
       if !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
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

  def symbolise_country
    if country.present?
      country = CS.countries.key(country)
    end
  end
end
