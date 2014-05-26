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


