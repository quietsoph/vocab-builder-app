# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create :email => 'jonesy@ga.co', :is_admin => true
u2 = User.create :email => 'craigsy@ga.co'
puts "#{ User.count } users"

Root.destroy_all
r1 = Root.create :text => 'stand'
r2 = Root.create :text => 'cut'
r3 = Root.create :text => 'lose'
puts "#{ Root.count } roots"

Concept.destroy_all
c1 = Concept.create :text => 'stand out', :meaning => 'exceptionally good', :image => 'https://www.freepik.com/free-photo/closeup-rubber-duckies_3011776.htm#query=stand%20out&position=25&from_view=keyword', :example => "The article focuses on Montgomery's strength as Fanboys President but also highlights her as a stand out among an industry dominated by men.", :source => 'An article titled Fanboys Marketplace President Lisa Montgomery Makes the Dallas Morning News', :note => "Tone: neutral /n Mode : neutral /n Register: neutral /n Nuance: neutral /n Dialect: neutral"
c2 = Concept.create :text => "can't stand", :meaning => 'strongly dislike', :image => 'https://pyxis.nymag.com/v1/imgs/9fa/3d5/5072220798b8fd6f8b1c1505fad02aaaa3-02-misophonia.rhorizontal.w700.jpg', :example => "A small group of people with a condition called misophonia, can't stand even small noise", :source => 'News', :note => "Tone: neutral /n Mode : neutral /n Register: neutral /n Nuance: neutral /n Dialect: British"
c3 = Concept.create :text => "stand", :meaning => 'Exist. If a decision, law, or offer stands, it still exists and has not been changed or cancelled.', :image => 'https://boatplanet.com/storage/ZWy6YtQOqoqcLWHxzfbiXEQ1IEOFRCbJLT3faPMy.png', :example => "Although exceptions could be made, the rule still stands.", :source => 'News', :note => "Tone: formal /n Mode : Written /n Register: Law /n Nuance: neutral /n Dialect: American"
c4 = Concept.create :text => 'stand to lose', :meaning => 'very likely to lose', :image => 'https://www.azquotes.com/picture-quotes/quote-the-more-you-want-the-more-you-stand-to-lose-aesop-40-82-16.jpg', :example => 'They could stand to lose the majority of their workforce due to the strike.', :source => 'News', :note => 'Tone: neutral'
c5 = Concept.create :text => "cut out", :meaning => 'stop eating', :image => 'https://www.usnews.com/dims4/USNEWS/5d495a6/2147483647/crop/1996x1331%2B0%2B0/resize/970x647/quality/85/?url=https%3A%2F%2Fwww.usnews.com%2Fcmsmedia%2Fc7%2F62%2F6829ed304f2d8cacd1d7cf9a88e6%2F200603-stock.jpg', :example => "I have tried to cut out sweets but failed.", :source => 'Radio', :note => "Tone: neutral /n Mode: neutral /n Register: Law /n Nuance: neutral /n Dialect: American"
c6 = Concept.create :text => "cut a long story short", :meaning => 'only talk about the most important or interesting details', :image => 'https://s3.amazonaws.com/lowres.cartoonstock.com/literature-story-novel-to_cut_a_long_story_short-long_story-saw-mly0865_low.jpg', :example => "To cut a long story short, we are going to be homeless for forty years.", :source => 'Funny quote', :note => "Tone: neutral /n Mode: neutral /n Register: Law /n Nuance: neutral /n Dialect: American"

puts "#{ Concept.count } concepts created"

Category.destroy_all
g1 = Category.create :name => "Idiom"
g2 = Category.create :name => "Noun"
g3 = Category.create :name => "Adjective"
g4 = Category.create :name => "Adverb"
g5 = Category.create :name => "Verb"
g6 = Category.create :name => "Phrase"
puts "#{ Category.count } Categories created"

Relation.destroy_all
a1 = Relation.create :name => 'Similarity'
a2 = Relation.create :name => 'Contrast'
a3 = Relation.create :name => 'Contiguity'
puts "#{ Relation.count } relations created"


# ------------------------Association -------------------#
puts "Users and roots"
u1.roots << r1 << r2
u2.roots << r3

puts 'Roots and concepts'
c1.roots << r1
c2.roots << r1
c3.roots << r1 << r3
c4.roots << r1
c5.roots << r2
c6.roots << r2

# r1.concepts << c1 << c2 << c3 << c4
# r2.concepts << c5 << c6 << c5 << c6
# r3.concepts << c4 << c4 << c4 << c4


puts "Concepts and categories"
g6.concepts << c1 << c2 << c4 << c5
g1.concepts << c6
g4.concepts << c3


puts "Concepts and its linking concepts"
c1.linking_concepts << c2 << c4
c2.linking_concepts << c4 << c6





