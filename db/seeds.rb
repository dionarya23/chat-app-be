# Menggunakan room_name sebagai atribut yang benar untuk model Room
rooms = Room.create([
  { room_name: "General" },
  { room_name: "Tech" },
  { room_name: "Design" }
])

# Pesan-pesan acak terkait topik room
general_messages = [
  "Halo semuanya, bagaimana kabarnya?",
  "Ada rencana hangout akhir minggu ini?",
  "Siapa yang punya rekomendasi tempat makan enak di sekitar sini?",
  "Baru selesai marathon film, ada rekomendasi lain?",
  "Apa kabar? Semoga harinya menyenangkan!"
]

tech_messages = [
  "Ada yang tahu cara optimasi query SQL?",
  "Apakah kalian lebih suka menggunakan React atau Vue untuk front-end?",
  "Baru saja mencoba Docker dengan Rails, ada tips?",
  "Gimana cara improve performa aplikasi Node.js?",
  "Ada yang pernah implementasi GraphQL di project kalian?"
]

design_messages = [
  "Apakah kalian lebih suka Figma atau Sketch untuk desain UI?",
  "Baru saja buat prototype, minta feedback dong!",
  "Bagaimana menurut kalian tentang tren desain minimalis tahun ini?",
  "Siapa yang punya tips tentang penggunaan warna yang baik di UI?",
  "Ada rekomendasi tools untuk animasi micro-interaction?"
]

# Menambahkan pesan acak ke setiap room
rooms.each do |room|
  case room.room_name
  when "General"
    10.times do
      Message.create(
        message: general_messages.sample, # pilih pesan acak terkait general
        room: room,
        user: Faker::Name.name        # generate nama user acak
      )
    end
  when "Tech"
    10.times do
      Message.create(
        message: tech_messages.sample,    # pilih pesan acak terkait tech
        room: room,
        user: Faker::Name.name       # generate nama user acak
      )
    end
  when "Design"
    10.times do
      Message.create(
        message: design_messages.sample,  # pilih pesan acak terkait design
        room: room,
        user: Faker::Name.name       # generate nama user acak
      )
    end
  end
end

puts "Berhasil menambahkan #{Room.count} room dan #{Message.count} pesan."
