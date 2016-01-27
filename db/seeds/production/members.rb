# coding: utf-8

names = %w(user0 user1)
0.upto(1) do |idx|
  Member.create(number: idx + 11,
    name: names[idx],
    administrator: (idx == 0),
    password: "p@ssw0rd",
    password_confirmation: "p@ssw0rd"
  )
end
names = %w(admin0 admin1)
0.upto(1) do |idx|
  Member.create(number: idx + 1,
    name: names[idx],
    administrator: 1,
    password: "p@ssw0rd",
    password_confirmation: "p@ssw0rd"
  )
end


