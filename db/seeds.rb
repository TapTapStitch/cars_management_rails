# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Car.create(make: 'Ford', model: 'Fusion', year: 2017, odometer: 65_000,
           price: 18_000, description: 'Selling a good car')
Car.create(make: 'Chevrolet', model: 'Volt', year: 2015, odometer: 35_000, price: 14_000, description: 'Great choice')
Car.create(make: 'Lexus', model: 'ES 350', year: 2008, odometer: 121_000, price: 13_000,
           description: 'Sell the car in an ideal condition')
Car.create(make: 'Skoda', model: 'Octavia Tour', year: 2010, odometer: 60_000, price: 8700,
           description: 'For fans and connoisseurs of the skoda brand')
Car.create(make: 'Infiniti', model: 'Q50', year: 2017, odometer: 32_000, price: 21_600,
           description: 'The condition of the car, as with a car dealership')
Car.create(make: 'Audi', model: 'A4', year: 2012, odometer: 103_000, price: 12_500,
           description: 'Audi a4 quattro premium 2012')
Car.create(make: 'Ford', model: 'Focus', year: 2017, odometer: 103_000, price: 19_000, description: 'Like new')
Car.create(make: 'Audi', model: 'Q7', year: 2012, odometer: 180_000, price: 22_800,
           description: 'Audi q7 3.0 tdi climate control cruise control')
Car.create(make: 'BMW', model: 'X5', year: 2003, odometer: 245_000, price: 10_500,
           description: 'Car in very good condition, LPG installed')
Car.create(make: 'Renault', model: 'Megane', year: 2018, odometer: 245_000, price: 10_500,
           description: 'Car in very good condition, LPG installed')
Car.create(make: 'Volkswagen', model: 'Passat', year: 2013, odometer: 205_000, price: 12_200,
           description: 'Sell volkswagen passat b7 bluemotion technology')
Car.create(make: 'BMW', model: 'X5', year: 2014, odometer: 130_000, price: 29_900,
           description: 'The car is in perfect condition, fully serviced')
Car.create(make: 'Volkswagen', model: 'Tiguan', year: 2013,
           odometer: 157_000, price: 15_600, description: 'Official car')
Car.create(make: 'Peugeot', model: '3008', year: 2013, odometer: 160_000, price: 10_650, description: 'Official car')
