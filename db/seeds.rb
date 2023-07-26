# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

until Post.count == 100 do
    Post.create(
        title: Faker::Creature::Cat.name,
        post: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
        pic: 'https://imagenes.elpais.com/resizer/n48DlQR-crZegLmg09HVeig_Qf0=/414x0/filters:focal(1133x620:1143x630)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/ZZIDTAAXOZEQXPZ2BP3VGO7KIY.jpg' 
    )
end

i = 0
until User.count == 20 do
    User.create(email: "test#{i}@gmail", password: "asdasdasd", "password_confirmation": "asdasdasd", photo: Faker::Avatar.image, name: Faker::Name.name)
    i += 1
end

posts = Post.all
users = User.all

until Comment.count == 1000 do
    Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), post_id: posts.sample.id, user_id: users.sample.id)
end

r_type = %w[post comment]
comments = Comment.all
kinds = Post::Kinds

until Reaction.count == 1000 do
    rel_type = r_type.sample

    if rel_type == "post"
        Reaction.create(post_id: posts.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    else
        Reaction.create(comment_id: comments.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    end
end