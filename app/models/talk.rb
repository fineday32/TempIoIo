class Talk < ActiveRecord::Base
	belongs_to :speaker_profile
    belongs_to :acadamic_history
    has_many :user_talks
	has_many :users , :through => :user_talks
	has_many :talk_process_lists
	has_many :processes , :through => :talk_process_lists
	has_many :comments
    has_attached_file :photography, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/blank.jpg"
    has_attached_file :bg, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/images.jpg"
    
    validates_attachment_content_type :photography, :content_type => %w(image/jpeg image/jpg image/png)
    validates_attachment_content_type :bg, :content_type => %w(image/jpeg image/jpg image/png)
    #validates_attachment_content_type :photogaphy, :content_type => /\Aimage\/.*\Z/

    scope :not_finished 
    
    
    def self.not_finished
        @not_finished_list = Array.new
        Talk.all.each do |t|
           if( t.talk_process_lists.where(:finished=>nil).count >0)
                @not_finished_list << t
            end
        end
        @not_finished_list        
    end

    def self.get_type(content)
        if (content == "sign_up")

        end
    end

    def self.on_process(process_name)
        @on_process_list = Array.new
        Talk.all.each do |t|
          current_process =""
            begin
             current_process =  t.talk_process_lists.where(:finished=>nil).order("sequence").first.process_name.to_s 
            rescue
            end
            if(current_process.to_s == process_name.to_s)
                @on_process_list <<t 
            end
        end
        @on_process_list
    end
end

   