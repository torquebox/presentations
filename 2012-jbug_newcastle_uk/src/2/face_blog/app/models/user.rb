class User < ActiveRecord::Base

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :dob, :presence => true
  validate :must_be_an_adult

  def must_be_an_adult
    if (Time.now - 18.years) < dob
      errors.add(:age, "must be over 18")
    end
  end

  has_many :friendships
  has_many :friends, :through => :friendships

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :dob
  # attr_accessible :title, :body
end
