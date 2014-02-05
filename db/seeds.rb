User.create!(
  email: 'test@test.test',
  password: 'test@test.test',
  password_confirmation: 'test@test.test',
  first_name: 'Foo',
  last_name: 'Bar'
)

types      = [ 'task', 'proposal', 'bug' ]
priorities = [ 'low', 'normal', 'critical' ]

types.each do |n|
  TaskType.create!(
    name: n,
    number: types.index( n ) + 1
  )
end

priorities.each do |n|
  TaskPriority.create!(
    name: n,
    number: priorities.index( n ) + 1
  )
end