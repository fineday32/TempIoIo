# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

P1 = AllProcess.create(title:'First Email')
P2 = AllProcess.create(title:'Online Meeting')
P3 = AllProcess.create(title:'Poster Files')
Live = ProcessType.create(title:'Live')
Record = ProcessType.create(title:'Record')

ProcessList.create(all_process_id: P1.id, process_type_id: Live.id, sequence:1)
ProcessList.create(all_process_id: P2.id, process_type_id: Live.id, sequence:2)
ProcessList.create(all_process_id: P3.id, process_type_id: Live.id, sequence:3)
ProcessList.create(all_process_id: P1.id, process_type_id: Record.id, sequence:1)
ProcessList.create(all_process_id: P2.id, process_type_id: Record.id, sequence:2)
ProcessList.create(all_process_id: P3.id, process_type_id: Record.id, sequence:3)


S1 = SpeakerProfile.create(eng_name: "Roy Lin", chi_name:"林佑達", bio:"Roy Lin 林佑達，就讀於 Harvard Graduate School of Design，主修都市設計 (Master of Architecture in Urban Design)，2013年畢業。興趣除建築與都市設計外，也包含跨領域設計整合。為'XD CrossDesign 跨設計' 社團的共同召集人。[此講座於2013年1月錄製]")
AcadamicHistory.create(speaker_profile_id: S1.id, nation: "United States", school: "Harvard", department: "Architecture in Urban Design", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S1.id, nation: "Taiwan, Republic Of China", school: "NCKU", department: "Architecture", degree: "BSc")

S2 = SpeakerProfile.create(eng_name: "Jessica Lee", chi_name: "李佳潔", bio:"Jessica Lee 李佳潔，現就讀於 School of Architecture + Planning (SA+P), Massachusetts Institute of Technology (MIT)，預計在2014年取得 Master of Architecture (MArch)學位。在台灣高雄出生長大，國一隨家人移民至美國加州。在美國北加州舊金山灣區的郊區城市Fremont度過國中與高中教育。2002年進入加州大學柏克萊分校 UC-Berkeley就讀建築系。2006年畢業後，在舊金山一所大型建築事務所HOK工作近三年。於2009年秋季，開始在MIT就讀建築碩士學位。就讀一年過後，因家裡經濟因素，休學一年於中國上海工作。 喜好旅行，到文化濃厚的國家或地區去體驗還未被新自由主義侵襲的地方文化與特質。 [此講座於2013年1月錄製]")
AcadamicHistory.create(speaker_profile_id: S2.id, nation: "United States", school: "MIT", department:"School of Architecture + Planning (SA+P)", degree:"MSc")
AcadamicHistory.create(speaker_profile_id: S2.id, nation: "United States", school: "Berkeley", department:"Architecture", degree:"BSc")

S3 = SpeakerProfile.create(eng_name: "Alan Tai", chi_name: "戴松青", bio: "Alan Tai 戴松青，2012年畢業於MIT Master of Science in Architecture Studies - Design and Computation group，2009年畢業於University of Pennsylvania Master of Architecture program。從小到大學畢業之前住在台北，之後輾轉遷徙於不同的地方，包括台中，台北，費城，紐約，波士頓及香港。大學就讀於台灣大學電機工程系。大學三年級的時候，從在書店看書開始慢慢對建築產生興趣，並修習建築相關的課程。於大學四年級的時候決定申請國外建築研究所，並在畢業及服役之後，前往University of Pennsylvania就讀建築碩士班。在建築領域中，對於電腦運算在建築方的影響以及應用感到興趣，包括演算法，幾何最佳化，數位製造。現在於香港Front Inc擔任建築立面設計顧問，主要的工作為facade system design, BIM and parametric modeling, architectural geometry optimization。預計明年返回美國工作。之前的工作經驗包括Rafael Vinoly Architects,Morphosis Architects。 [此講座於2013年1月錄製]")
AcadamicHistory.create(speaker_profile_id: S3.id, nation: "United States", school: "MIT", department: "Architecture Studies - Design and Computation group", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S3.id, nation: "United States", school: "University of Pennsylvania", department: "Architecture", degree:"MSc")
AcadamicHistory.create(speaker_profile_id: S3.id, nation: "Taiwan, Republic Of China", school: "NTU", department: "EE", degree: "BSc")

S4 = SpeakerProfile.create(eng_name: "Johnny Chang", chi_name: "張家銘", bio: "Johnny Chang 張家銘，現就讀於Master of Industrial Design (MID)，Rhode Island School of Design (RISD)，預計於2013年取得學位。台灣台北出生，大學起初就讀於中正大學物理系，兩年後通過轉學考至清華大學動力機械系二年級；並於一年後平轉至清華大學物理系三年級。畢業後，申請上台灣大學物理研究所就讀，三個月後，發覺並非自己所愛，不顧家人反對辦理休學，並因未在規定時間內復學而遭台灣大學退學。因此基本上一位學生在學制內能做的事（轉學、轉系、休學、退學）都經歷過了一次。於休學後，經歷兩年的摸索，申請上了RISD的工業設計研究所。個人對於解決問題的設計沒有什麼太大的興趣，喜好琢磨於文化、概念上的設計，現今朝著成立自己的設計工作室、自己的設計品牌努力。 歡迎觀眾參觀Johnny的個人網站： http://johnnychangis.me/   [此講座於2013年1月錄製]")
AcadamicHistory.create(speaker_profile_id: S4.id, nation: "United States", school: "RISD (Rhode Island School of Design)", department: "Industrial Design", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S4.id, nation: "Taiwan, Republic Of China", school: "NTHU", department: "Physics", degree: "BSc")

S5 = SpeakerProfile.create(eng_name: "Archiz Lin", chi_name: "林嘉慧", bio: "Archiz Lin 林嘉慧，大學畢業於淡江大學建築系，2005年取得台灣建築師執照，隨後前往英國讀書，08年取得UCL Bartlett School of Architecture, Master of Architecture in Architectural Design 。目前為中華民國開業建築師，並在淡江大學以及中國科技大學擔任建築系講師。 [此講座於2013年5月錄製]")
AcadamicHistory.create(speaker_profile_id: S5.id, nation: "United Kingdom", school: "UCL", department: "Architecture in Architectural Design", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S5.id, nation: "Taiwan, Republic Of China", school: "淡江大學", department: "Architecture", degree: "BSc")

S6 = SpeakerProfile.create(eng_name: "Jossy Lee", chi_name: "李楓真", bio: "Jossy Lee 李楓真，於 2012年取得MIT Sloan School of Management的MBA學位，是「若水國際」社會企業創投公司的早期成員之一；目前於美國波士頓Analytics Consult, LLC工作。")
AcadamicHistory.create(speaker_profile_id: S6.id, nation: "United States", school: "MIT", department: "Sloan School of Management", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S6.id, nation: "Taiwan, Republic of China", school: "NTU", department: "國際企業學系", degree: "BSc")

S7 = SpeakerProfile.create(eng_name: "Edward Shen", chi_name: "沈育德", bio: "Edward Shen 沈育德，自踏入麻省理工學院媒體實驗室之後，沈育德一路以故事和人工智慧為兩個主軸，遊走在科技與藝術之間，不但在ACM CHI, IUI等大型國際會議發表了多篇技術論文，其紀錄片作品也在Plymouth Independent Film Festival獨立影展獲得好評。2009年，他在台灣創立了 StorySense Computing 軟體公司，開發具有文本理解能力的人工智慧技術，並於2011年推出了第一個手機App - WhatsTheNumber，至今在台灣地區逾70萬下載，並供美國、日本、香港、中國...等其他地區的iPhone及Android用戶下載使用。StorySense並企圖改變人類使用資訊的生硬方式，創造「連阿公阿嬤都覺得簡單好用」的使用經驗，進而降低使用科技與資訊的門檻。沈育德目前定居於台北，並且相信台灣將以其豐厚的人文涵養，融合其科技的基礎，在不久的未來呈現一個前所未有的新風貌。")
AcadamicHistory.create(speaker_profile_id: S7.id, nation: "United States", school: "MIT", department: "Media Arts and Sciences", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S7.id, nation: "Taiwan, Republic of China", school: "NTU", department: "CS", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S7.id, nation: "Taiwan, Republic of China", school: "NTU", department: "EE", degree: "BSc")

S8 = SpeakerProfile.create(eng_name: "Tim Wong", chi_name: "黃駿賢", bio: "Tim Wong 黃駿賢，本身在香港出生，12歲到美國就讀中學。大學就讀於University of Michigan, Bachelor of Science in Architecture。02年到 Harvard Graduate school of Design, Master of Architecture和Master of Architecture in Urban Design就讀，05年畢業後去了舊金山工作，08年回到亞洲。目前在台灣從事教學以及共創平台的建立。 [此講座於2013年2月錄製]")
AcadamicHistory.create(speaker_profile_id: S8.id, nation: "United States", school: "Harvard", department: "Graduate school of Design", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S8.id, nation: "United States", school: "Harvard", department: "Architecture in Urban Design", degree: "MSc")
AcadamicHistory.create(speaker_profile_id: S8.id, nation: "United States", school: "University of Michigan", department: "Architecture", degree: "BSc")