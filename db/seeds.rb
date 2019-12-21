User.create name: 'Go', status: :active, kind: :salesman, email: 'go@test.com', password: 123456
User.create name: 'Rust', status: :active, kind: :salesman, email: 'rust@test.com', password: 123456
User.create name: 'Cristal', status: :active, kind: :manager, email: 'cristal@test.com', password: 123456

Product.create name: 'Razer DeathAdder Elite Gaming Mouse', description: 'Equipped with the new eSports-grade optical sensor that has true 16,000 DPI and true tracking at 450 Inches Per Second (IPS).', status: :active, price: 10
Product.create name: 'SanDisk Ultra 32GB', description: 'Ultra-fast cards to take better pictures and Full HD video with your compact to mid-range point-and-shoot cameras and camcorders. ', status: :active, price: 15
Product.create name: 'Samsung 970 EVO SSD 1TB', description: 'Accelerate into next-gen computing. The Samsung 970 EVO delivers breakthrough speeds.', status: :active, price: 35
Product.create name: 'Huawei Mate 20 Pro', description: 'Product descriptionUnlocked cell phones are compatible with GSM carrier such as AT&T and T-Mobile.', status: :active, price: 100

Client.create name: 'Ana', company_name: 'Google', document: '24440362857', email: 'ana@google.com', user: User.first
Client.create name: 'Julio', company_name: 'Google', document: '24440362857', email: 'julio@google.com', user: User.first