def create_users
  max = User.create!(name: 'Chieftain Carrno',
              avatar_url: 'https://avatars.githubusercontent.com/u/87065684?v=4',
              email: "max@tortuga.bay",
              password: 'TortugaLeWagon',
              admin: true)

  daniel = User.create!(name: 'Bossmann Beltrarrn',
              avatar_url: 'https://avatars.githubusercontent.com/u/90935914?v=4',
              email: "daniel@tortuga.bay",
              password: 'TortugaLeWagon',
              admin: true)

  marthe = User.create!(name: 'Milady Mukamarrzimpaka',
              avatar_url: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633203012/swpn3mvzxj4a2he041tp.jpg',
              email: "marthe@tortuga.bay",
              password: 'TortugaLeWagon',
              admin: true)

  wouter = User.create!(name: 'Humpty Hildarrson',
              avatar_url: 'https://avatars.githubusercontent.com/u/32019769?v=4',
              email: "wouter@tortuga.bay",
              password: 'TortugaLeWagon',
              admin: true)
  puts '---------------admins created---------------'
  return [max, daniel, marthe, wouter]
end
