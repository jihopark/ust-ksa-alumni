# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
industry_list = [
   ["Postgraduate Studies", true],
   ["Airlines/Aviation",false],
   ["Alternative Dispute Resolution",false],
   ["Alternative Medicine",false],
   ["Animation",false],
   ["Apparel & Fashion",true],
   ["Architecture & Planning",false],
   ["Arts and Crafts",false],
   ["Automotive",false],
   ["Aviation & Aerospace",false],
   ["Banking",true],
   ["Biotechnology",false],
   ["Broadcast Media",false],
   ["Building Materials",false],
   ["Business Supplies and Equipment",false],
   ["Capital Markets",true],
   ["Chemicals",false],
   ["Civic & Social Organization",false],
   ["Civil Engineering",false],
   ["Commercial Real Estate",false],
   ["Computer & Network Security",false],
   ["Computer Games",false],
   ["Computer Hardware",false],
   ["Computer Networking",false],
   ["Computer Software",true],
   ["Construction",false],
   ["Consumer Electronics",true],
   ["Consumer Goods",false],
   ["Consumer Services",true],
   ["Cosmetics",true],
   ["Dairy",false],
   ["Defense & Space",false],
   ["Design",false],
   ["Education Management",true],
   ["E-Learning",false],
   ["Electrical/Electronic Manufacturing",true],
   ["Entertainment",true],
   ["Environmental Services",false],
   ["Events Services",false],
   ["Executive Office",false],
   ["Facilities Services",false],
   ["Farming",false],
   ["Financial Services",true],
   ["Fine Art",false],
   ["Fishery",false],
   ["Food & Beverages",true],
   ["Food Production",false],
   ["Fund-Raising",false],
   ["Furniture",false],
   ["Gambling & Casinos",false],
   ["Glass, Ceramics & Concrete",false],
   ["Government Administration",false],
   ["Government Relations",true],
   ["Graphic Design",false],
   ["Health, Wellness and Fitness",false],
   ["Higher Education",false],
   ["Hospital & Health Care",false],
   ["Hospitality",false],
   ["Human Resources",true],
   ["Import and Export",false],
   ["Individual & Family Services",false],
   ["Industrial Automation",false],
   ["Information Services",true],
   ["Insurance",false],
   ["International Affairs",false],
   ["International Trade and Development",false],
   ["Internet Technology(IT)",true],
   ["Investment Banking",true],
   ["Investment Management",true],
   ["Judiciary",false],
   ["Law Enforcement",false],
   ["Law Practice",false],
   ["Legal Services",true],
   ["Legislative Office",false],
   ["Leisure, Travel & Tourism",true],
   ["Libraries",false],
   ["Logistics and Supply Chain",true],
   ["Luxury Goods & Jewelry",true],
   ["Machinery",false],
   ["Management Consulting",true],
   ["Maritime",false],
   ["Marketing and Advertising",true],
   ["Market Research",true],
   ["Mechanical or Industrial Engineering",true],
   ["Media Production",true],
   ["Medical Devices",false],
   ["Medical Practice",false],
   ["Mental Health Care",false],
   ["Military",false],
   ["Mining & Metals",false],
   ["Motion Pictures and Film",true],
   ["Museums and Institutions",false],
   ["Music",false],
   ["Nanotechnology",false],
   ["Newspapers",false],
   ["Nonprofit Organization Management",true],
   ["Oil & Energy",false],
   ["Online Media",true],
   ["Outsourcing/Offshoring",false],
   ["Package/Freight Delivery",false],
   ["Packaging and Containers",false],
   ["Paper & Forest Products",false],
   ["Performing Arts",false],
   ["Pharmaceuticals",false],
   ["Philanthropy",false],
   ["Photography",false],
   ["Plastics",false],
   ["Political Organization",false],
   ["Primary/Secondary Education",false],
   ["Printing",false],
   ["Professional Training & Coaching",false],
   ["Program Development",false],
   ["Public Policy",false],
   ["Public Relations and Communications",true],
   ["Public Safety",false],
   ["Publishing",false],
   ["Railroad Manufacture",false],
   ["Ranching",false],
   ["Real Estate",false],
   ["Recreational Facilities and Services",false],
   ["Religious Institutions",false],
   ["Renewables & Environment",false],
   ["Research",false],
   ["Restaurants",false],
   ["Retail",true],
   ["Security and Investigations",false],
   ["Semiconductors",false],
   ["Shipbuilding",false],
   ["Sporting Goods",false],
   ["Sports",false],
   ["Staffing and Recruiting",false],
   ["Startups",true],
   ["Supermarkets",false],
   ["Telecommunications",true],
   ["Textiles",false],
   ["Think Tanks",false],
   ["Tobacco",false],
   ["Translation and Localization",false],
   ["Transportation/Trucking/Railroad",false],
   ["Utilities",false],
   ["Venture Capital & Private Equity",true],
   ["Veterinary",false],
   ["Warehousing",false],
   ["Wholesale",false],
   ["Wine and Spirits",false],
   ["Wireless",false],
   ["Writing and Editing",false]
]

major_list = [
  ["School of Science", "ENVS", "Environmental Science"],
  ["School of Science", "BCB", "Biochemistry and Cell Biology"],
  ["School of Science", "BISC", "Biological Science"],
  ["School of Science", "CHEM", "Chemistry"],
  ["School of Science", "MATH", "Mathematics"],
  ["School of Science", "MAEC", "Mathematics and Economics"],
  ["School of Science", "PHYS", "Physics"],
  ["School of Engineering", "CENG", "Chemical Engineering"],
  ["School of Engineering", "CBME", "Chemical and Biomolecular Engineering"],
  ["School of Engineering", "CEEV", "Chemical and Environmental Engineering"],
  ["School of Engineering", "CIVL", "Civil Engineering"],
  ["School of Engineering", "CIEV", "Civil and Environmental Engineering"],
  ["School of Engineering", "CPEG", "Computer Engineering"],
  ["School of Engineering", "COMP", "Computer Science"],
  ["School of Engineering", "ELEC", "Electronic Engineering"],
  ["School of Engineering", "IEEM", "Industrial Engineering and Engineering Management"],
  ["School of Engineering", "IELM", "Logistics Management and Engineering"],
  ["School of Engineering", "MECH", "Mechanical Engineering"],
  ["School of Engineering", "ELEC", "Electronic Engineering"],
  ["School of Engineering", "COSC", "BSc in Computer Science"],
  ["School of Business", "ACCT", "Accounting"],
  ["School of Business", "ECON", "Economics"],
  ["School of Business", "FINA", "Finance"],
  ["School of Business", "GBM", "General Business Management"],
  ["School of Business", "GBUS", "Global Business"],
  ["School of Business", "IS", "Information Systems"],
  ["School of Business", "OM", "Operations Management"],
  ["School of Business", "MARK", "Marketing"],
  ["School of Business", "MGMT", "Management"],
  ["School of Business", "ECOF", "BSc in Economics & Finance"],
  ["School of Business", "QFIN", "BSc in Quantitative Finance"],
  ["School of Business", "WBB", "World Business"],
  ["School of Humanities and Social Science", "GCS", "Global China Studies"],
  ["Interdisciplinary Programs Office","RMBI", "Risk Management and Business Intelligence"],
  ["Interdisciplinary Programs Office","EVMT", "Environmental Management and Technology"]
]

industry_list.each do |name, favorite|
  Industry.create( name: name, favorite: favorite )
end

major_list.each do |school, code, name|
  Major.create( school:school, name: name, code:code )
end