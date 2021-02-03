
steve = User.create(username: "Steve", email: "steve@steve.com", password:"password")
gina = User.create(username: "Gina", email: "gina@gina.com", password: "password")

Show.create(title: "Godspell", author: "Some Guy", role: "Judas", style: "musical", year_done: "2021", user_id: steve.id)
Show.create(title: "Avenue Q", author: "Some Dude", role: "Lucy the Slut", style: "musical", year_done: "2015", user_id: gina.id)

steve.shows.create(title: "Avenue Q", author: "Some Dude", role: "Gary Coleman", style: "musical", year_done: "2019")