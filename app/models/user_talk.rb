class UserTalk < ActiveRecord::Base
    belongs_to :user
    belongs_to :talk
end
