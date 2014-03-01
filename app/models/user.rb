class User < ActiveRecord::Base
  has_many :user_talks
  has_many :talks , :through => :user_talks
  has_many :usercomments
  has_many :comments , :through => :usercomments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :is_helper, where(:role =>"helper")
  

  def self.has_works_more_or_less_than (input, more_or_less, num )
  	@has_work_list = Array.new

  	input.all.each do |u|
  		@work_count= 0;
           u.talks.each do |t|
	           	if (t.finished == nil)
	           		@work_count +=1
	           	end
	           	if ( @work_count >= num && more_or_less=="more")
	           		@has_work_list << u
	           		break
	           	end
		   end     
		   if ( @work_count <= num && more_or_less=="less")
	           		@has_work_list << u
	       end   
     end
     @has_work_list
  end
end
