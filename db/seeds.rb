# frozen_string_literal: true

User.create({ username: "Irma Pince", email: "irma.pince@library.org", password: ENV["DEFAULT_LIBRARIAN_PASSWORD"], role: :librarian })

["Action and Adventure", "Biographies", "Classics", "Cookbooks", "Comics", "Essays", "Fantasy", "History", "Horror", "Mystery", "Poetry", "Romance", "Sci-fi", "Short stories"].each do |category|
  Category.create!(name: category)
end

[
  {
   "isbn" => "0446310786",
   "title" => "To Kill a Mockingbird",
   "author" => "Harper Lee",
   "image" => "mockingbird.jpeg",
   "category_id" => 3,
   "description" => %{In a racially divided town in 1930s America, a young girl narrates her experiences growing up. Her father, a lawyer, defends a black man falsely accused of a crime, leading to a gripping trial. As the trial unfolds, the narrative delves into the dynamics of the small community, revealing the prejudices and tensions surrounding the case. The story intricately weaves through the lives of various characters, showcasing their struggles, fears, and societal pressures. Alongside the trial, the protagonist navigates childhood adventures, forming strong bonds with her brother and friend. Through the lens of innocence, the narrative captures the essence of morality, empathy, and societal norms during a turbulent time, culminating in profound revelations about justice and human nature.},
  },
  {
    "isbn" => "0452284239",
    "title" => "1984",
    "author" => "George Orwell",
    "image" => "1984.jpeg",
    "category_id" => 3,
    "description" => %{"1984" is a dystopian novel by George Orwell set in a totalitarian future where the government, led by the Party and its enigmatic figurehead Big Brother, exercises complete control over its citizens. The story follows Winston Smith, a disillusioned member of the outer Party who secretly rebels against the oppressive regime by keeping a forbidden diary and engaging in thought crimes. In this surveillance-dominated society, where history is rewritten and truth is manipulated, Winston embarks on a forbidden love affair with Julia, another Party member. As their rebellion against the Party intensifies, they face the terrifying consequences of their actions. Through Winston's journey, the novel explores themes of censorship, surveillance, propaganda, and the power of language, painting a chilling portrait of a world where individuality and freedom are brutally suppressed.}
  },
  {
    "isbn" => "0743273563",
    "title" => "The Great Gatsby",
    "author" => "F. Scott Fitzgerald",
    "image" => "gatzby.jpg",
    "category_id" => 3,
    "description" => %{"The Great Gatsby" is a captivating novel set in the Roaring Twenties. The story revolves around Jay Gatsby, a wealthy and enigmatic figure known for his lavish parties. Gatsby is deeply in love with Daisy Buchanan, Nick's cousin, who is married to the affluent Tom Buchanan. Amidst the glamour and opulence of the Jazz Age, Gatsby and Daisy reignite their past romance, leading to a series of events marked by love, deceit, and tragedy. The novel explores themes of wealth, the American Dream, and the emptiness that often lurks beneath the surface of extravagance. Through its vibrant characters and evocative storytelling, "The Great Gatsby" offers a poignant commentary on the pursuit of dreams and the complexities of human desires in the backdrop of a changing society.}
  },
  {
    "isbn" => "0747532744",
    "title" => "Harry Potter and the Sorcerer's Stone",
    "image" => "harry-sorc-stone.jpg",
    "author" => "J.K. Rowling",
    "category_id" => 3,
    "description" => %{"Harry Potter and the Sorcerer's Stone" introduces readers to a young boy named Harry Potter, who discovers he's a wizard on his eleventh birthday. He's invited to attend Hogwarts School of Witchcraft and Wizardry, where he learns about his magical heritage. Alongside his new friends Hermione Granger and Ron Weasley, Harry navigates the wonders of the wizarding world, uncovering secrets about his past and his connection to the dark wizard Voldemort. The trio embarks on adventures, facing challenges and discovering the power of friendship and bravery. Set in a world filled with spells, magical creatures, and a rich history, the book captures the excitement and wonder of a young boy's journey into a realm where anything is possible.}
  },
  {
    "isbn" => "0451526343",
    "title" => "Animal Farm",
    "author" => "George Orwell",
    "image" => "animal-farm.jpg",
    "category_id" => 3,
    "description" => %{"Animal Farm" is an allegorical novella that tells the story of a group of farm animals who rebel against their human farmer, Mr. Jones, to establish their own egalitarian society. Led by the pigs, notably Napoleon and Snowball, the animals take control of the farm, aiming for a utopian existence where all animals are equal. However, over time, the pigs, especially Napoleon, gradually take more power, becoming increasingly corrupt and oppressive. They manipulate the principles of Animalism for their benefit, betraying the initial ideals of the revolution. The book mirrors the events leading up to the Russian Revolution and subsequent Stalinist era, using animal characters to critique totalitarianism, the corrupting nature of power, and the manipulation of ideology for personal gain.}

  },
  {
    "isbn" => "1400079156",
    "title" => "The Hobbit",
    "author" => "J.R.R. Tolkien",
    "image" => "hobbit.jpg",
    "category_id" => 3,
    "description" => %{"The Hobbit" follows the journey of Bilbo Baggins, a hobbit who is reluctantly swept into an epic quest by the wizard Gandalf. Bilbo joins a company of dwarves led by Thorin Oakenshield on a mission to reclaim their homeland, which has been taken over by the fearsome dragon Smaug. Along the way, they encounter trolls, goblins, elves, and other fantastical creatures. Bilbo's growth from a timid hobbit into a clever and courageous adventurer forms the heart of the story. Through his wit and resourcefulness, Bilbo navigates challenges, discovers a magical ring that grants invisibility, and plays a pivotal role in the quest's outcome. "The Hobbit" is a classic tale of heroism, friendship, and unexpected courage set in the enchanting world of Middle-earth, crafted by J.R.R. Tolkien.}
  },
  {
    "isbn" => "0449911497",
    "title" => "All Quiet on the Western Front",
    "author" => "Erich Maria Remarque",
    "image" => "western_front.jpg",
    "category_id" => 3,
    "description" => %{"All Quiet on the Western Front" is a powerful anti-war novel by Erich Maria Remarque, depicting the experiences of German soldiers during World War I. The story is narrated by Paul Bäumer, a young German soldier who, along with his comrades, enlists in the army with patriotic fervor, only to face the harsh realities of trench warfare. The narrative vividly portrays the brutalities and horrors of war, revealing the physical and psychological toll it takes on the soldiers. The camaraderie among the men, their struggles with fear, hunger, and the constant threat of death, is poignantly depicted. As the war progresses, Paul and his friends undergo a profound disillusionment with the ideals of nationalism and glory, recognizing the futility and senselessness of the conflict. The novel explores themes of loss, trauma, and the dehumanizing effects of war on individuals, offering a haunting portrayal of the human cost of conflict and the profound impact it has on those who endure it.}
  },
  {
    "isbn" => "1400079158",
    "title" => "The Metamorphosis",
    "author" => "Franz Kafka",
    "image" => "metamorphosis.jpg",
    "category_id" => 3,
    "description" => %{"The Metamorphosis" by Franz Kafka follows the bizarre and unsettling transformation of Gregor Samsa, a traveling salesman, who wakes up one morning to find himself transformed into a giant insect. The story delves into the emotional and psychological effects of this sudden metamorphosis on Gregor and his family. As Gregor grapples with his new insect form, he becomes isolated and unable to communicate with his family, who initially rely on him for financial support. The narrative explores the dynamics within the Samsa household as they struggle to come to terms with Gregor's transformation. His family's reactions range from horror and disgust to a gradual detachment from him as they adjust to their new circumstances. Through Gregor's perspective, Kafka touches upon themes of alienation, identity, and the human condition. The novella serves as a reflection on the pressures of societal expectations and the profound impact of physical and emotional isolation on an individual's sense of self-worth and belonging.}
  },
  {
    "isbn" => "0679720209",
    "title" => "The Stranger",
    "author" => "Albert Camus",
    "image" => "stranger.jpg",
    "category_id" => 3,
    "description" => %{"The Stranger" by Albert Camus follows the story of Meursault, a detached and apathetic French Algerian. The novel begins with Meursault learning about his mother's death, and despite societal expectations, he displays a lack of conventional grief or emotion at her funeral. As the narrative unfolds, Meursault becomes involved in a series of events, including a casual romantic relationship and an altercation with an Arab man on a beach, which leads to a pivotal moment: Meursault inexplicably shoots and kills the Arab. During his trial, Meursault's lack of remorse and his detached view of life and morality become central themes. The novel explores existential themes, portraying Meursault as an outsider in society due to his refusal to conform to societal norms or expectations. Camus delves into the absurdity of life, the indifference of the universe, and the idea that individuals must find meaning and acceptance in an inherently meaningless world. "The Stranger" challenges conventional morality and invites reflection on the nature of existence and human consciousness.}
  },
  {
    "isbn" => "0374531260",
    "title" => "Memoirs of a Geisha",
    "author" => "Arthur Golden",
    "image" => "geisha.jpg",
    "category_id" => 3,
    "description" => %{"Memoirs of a Geisha" by Arthur Golden is a captivating novel that traces the life of a young girl named Chiyo, who is sold into servitude and eventually becomes a renowned geisha named Sayuri in Kyoto, Japan, during the early 20th century. The story follows Sayuri's journey as she navigates the intricate world of geisha culture, learning traditional arts, mastering the art of entertainment, and competing for success and recognition in a highly competitive environment. Amidst the beauty and elegance of her profession, Sayuri faces numerous challenges, including rivalries, love, and the impact of World War II on her life and the geisha community. The novel offers a rich depiction of Japanese culture, customs, and the complex hierarchy within the geisha districts. Through Sayuri's perspective, it explores themes of love, sacrifice, resilience, and the pursuit of personal identity in a society dictated by tradition and expectations. "Memoirs of a Geisha" is a compelling tale of strength, perseverance, and the intricacies of a world few have the chance to experience.}
  },
].each do |book|
  Book.create!(
    title: book["title"],
    author: book["author"],
    isbn: book["isbn"],
    image: book["image"],
    description: book["description"],
    category_id: book["category_id"]
  )
end
