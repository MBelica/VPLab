# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', firstname: 'Lucius', lastname: 'Lucullus', matrikel: 1, role: 2, terms: true,  confirmed_at: Time.now.utc)
User.create!(email: 'mod@example.com',   password: 'password', password_confirmation: 'password', firstname: 'Carl',   lastname: 'Clausewitz', matrikel: 2, role: 1, terms: true, confirmed_at: Time.now.utc)
User.create!(email: 'student@uni-landau.de',  password: 'password', password_confirmation: 'password', firstname: 'Hideki',  lastname: 'Tojo',  matrikel: 3, role: 0, terms: true, confirmed_at: Time.now.utc)

users = User.order(:created_at)
j = 0
k = 12
users.each { |user|
  k.times do |i|
    experiment = Experiment.create!(user_id: user.id, title: "Experiment " + (i + j).to_s, contact_name: user.lastname, contact_email: user.email)
    t1 = ExperimenterAssignment.create!(user_id: user.id, experiment_id: experiment.id)
    t2 = ExperimenterAssignment.create!(user_id: [1, 2, 3].sample, experiment_id: experiment.id)
  end
  j = j + k
}