# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ProblemCategory.create([{ category_name: "Slow Computer",                           css_class: "slow-computer"},
                        { category_name: "Android Problems",                        css_class: "android"},
                        { category_name: "iPhone & iPad Problems",                  css_class: "apple"},
                        { category_name: "Helping the Older Generation",            css_class: "older-generation"},
                        { category_name: "Wireless Networks",                       css_class: "wireless"},
                        { category_name: "Internet Access",                         css_class: "internet"},
                        { category_name: "Routers",                                 css_class: "routers"},
                        { category_name: "Keeping Systems and Software Up to Date", css_class: "up-to-date"}
                        ])