class SpeakerCreator 
include ActiveModel::Validations
include ActiveModel::Conversion
extend ActiveModel::Naming
    
attr_accessor :chi_name, :eng_name, 
              :tel, :email,
              :recommnd_name, :recommnd_tel, :recommnd_email, :recommend_reason, 
              :os_using, 
              :live_talk,
              :currernt_work,
              :comments_for_IOH,
              :ok_time,
              :acadamic_name1, :acadamic_school1, :acadamic_school_abbreviation1, :acadamic_degree1, :acadamic_department1, :acadamic_check1, :acadamic_year1,
              :acadamic_name2, :acadamic_school2, :acadamic_school_abbreviation2, :acadamic_degree2, :acadamic_department2, :acadamic_check2, :acadamic_year2,
              :acadamic_name3, :acadamic_school3, :acadamic_school_abbreviation3, :acadamic_degree3, :acadamic_department3, :acadamic_check3, :acadamic_year3,
              :acadamic_name4, :acadamic_school4, :acadamic_school_abbreviation4, :acadamic_degree4, :acadamic_department4, :acadamic_check4, :acadamic_year4


def create_speaker 


end

def persisted?
    false
end
end
