class Talk < ActiveRecord::Base
	belongs_to :speaker_profile
    has_many :user_talks
	has_many :users , :through => :user_talks
	has_many :talk_process_lists
	has_many :processes , :through => :talk_process_lists
	has_many :comments
    has_attached_file :photography, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    
    validates_attachment_content_type :photography, :content_type => %w(image/jpeg image/jpg image/png)
    #validates_attachment_content_type :photogaphy, :content_type => /\Aimage\/.*\Z/

    #attr_accessor :title

    end
