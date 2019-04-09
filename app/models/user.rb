class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :account
  has_one :panel
  has_one :freelancer
  has_one :recruiter
  has_one :public_profile, dependent: :destroy
  has_many :tasks
  has_many :jobs
  has_many :job_panels
  has_many :job_rooms
  belongs_to :registration_status
end
