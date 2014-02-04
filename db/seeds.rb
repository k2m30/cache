require 'faker'

[Site, Internal, External, Banner].each do |table|
  table.delete_all
end
19.times do
  site = Site.create(name: Faker::Internet.domain_name, css: Faker::Company.suffix, banner: Banner.create(code: Faker::Lorem.paragraph(3)) )

  rand(2..20).times do
    site.externals.create(url: Faker::Internet.url, internal: Internal.create(url: Faker::Internet.url))
  end
end

