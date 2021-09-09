# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Admin Record
admin = User.create(f_name: "admin", l_name: "admin", email: "admin@yopmail.com", password: "123456",password_confirmation: "123456", contact: 1234567890, is_admin: true, confirmed_at: Time.now.utc )

#Create CountryDetail Record
country_detail = CountryDetail.create(name: "India", code: "+91")

# Create Tax Record
tax = Tax.create(tax_name: "GST", tax_percentage: 8.0)
