class User < ActiveRecord::Base
  has_many :user_talks
  has_many :talks , :through => :user_talks
  has_many :usercomments
  has_many :comments , :through => :usercomments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
end
