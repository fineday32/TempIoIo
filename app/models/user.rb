class User < ActiveRecord::Base
  has_many :usertalks
  has_many :talks , :through => :usertalks
  has_many :usercomments
  has_many :comments , :through => :usercomments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
end
