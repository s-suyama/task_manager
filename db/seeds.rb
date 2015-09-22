# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# statues
Status.create(id: 1, name: '未着手', sequence: 1)
Status.create(id: 2, name: '進行中', sequence: 2)
Status.create(id: 3, name: '完了', sequence: 3)
