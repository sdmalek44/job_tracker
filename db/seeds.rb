Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = [Category.create!(title: "Medicine"), Category.create!(title: "Carpentry"), Category.create!(title: "Military"), Category.create!(title: "Sports")]
COMMENT_NAMES = ['Colin', 'Stephen', 'Bob', 'Joe', 'Jerry', 'Lucas', 'Rob', 'Jill', 'Tristan', 'Matt', 'Terry', 'Martha', 'Justin', 'Courtney', 'Megan', 'Melissa', 'Elliot']
COMMENT_BODIES = ['Hello', "What's up", 'Just got fired', 'Just got hired', "It's a job", 'I hate this job', 'Just had an interview', "They're not returning my calls", "They're not returning my emails"]
CONTACT_NAMES = ['Colin', 'Stephen', 'Bob', 'Joe', 'Jerry', 'Lucas', 'Rob', 'Jill', 'Tristan', 'Matt', 'Terry', 'Martha']
POSITIONS = ['Manager', 'Janitor', 'CEO', 'Secretary', 'Maintenance', 'Intern', 'Cook', 'President', 'Accountant', 'Lawyer']

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    job = company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: rand(1..5), city: CITIES.sample, category_id: CATEGORIES.sample.id)
    4.times do
      job.comments.create!(author: COMMENT_NAMES.sample, body: COMMENT_BODIES.sample)
    end
  end
  4.times do |num|
    company.contacts.create!(name: CONTACT_NAMES.sample, position: POSITIONS.sample, email: 'email@email.com')
  end
end
