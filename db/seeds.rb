User.create!(
  email: 'test@test.test',
  password: 'test@test.test',
  password_confirmation: 'test@test.test',
  first_name: 'Foo',
  last_name: 'Bar'
)

types      = [ 'task', 'proposal', 'bug' ]
priorities = [ 'low', 'normal', 'critical' ]
status     = [ 'new', 'progress', 'solved', 'feedback', 'reopened', 'closed' ]

types.each do |n|
  TaskType.create!(
    name: n,
    icon: "#{n}.png"
  )
end

priorities.each do |n|
  TaskPriority.create!(
    name: n,
    icon: "#{n}.png"
  )
end

status.each do |n|
  TaskStatus.create!(
    name: n
  )
end