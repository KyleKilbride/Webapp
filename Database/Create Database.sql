create database my_elective;   
use my_elective;  
  
SET global general_log = 1;
SET global log_output = 'table';  
  
CREATE  TABLE `my_elective`.`electives` (
  `id` int NOT NULL auto_increment,
  `course_code` VARCHAR(8) NOT NULL,
  `elective_name` VARCHAR(200) NOT NULL ,  
  `description` VARCHAR(5000) NOT NULL,
  `average_rating` int,
  PRIMARY KEY (`id`) );   

CREATE  TABLE `my_elective`.`users` (
  `id` int NOT NULL auto_increment,
  `user_name` VARCHAR(200) NOT NULL ,  
  `password` VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `program` VARCHAR(200) NOT NULL,
  `email_address` VARCHAR(200) NOT NULL,
  `status` VARCHAR(5),
  PRIMARY KEY (`id`) );

CREATE  TABLE `my_elective`.`ratings` (
  `id` int NOT NULL auto_increment ,
  `rating` int NOT NULL,
  `hours_per_week` int NOT NULL,
  `comment` longtext,
  `date` int unsigned,
  `electives_id` int NOT NULL,
  `users_id` int NOT NULL,
  FOREIGN KEY (`electives_id`) REFERENCES electives(`id`),
  PRIMARY KEY (`id`) );

CREATE TABLE `my_elective`.`bad_words` (
`id` int NOT NULL auto_increment ,
`word` varchar(45) not null,
PRIMARY KEY (`id`) );

CREATE TABLE `my_elective`.`ratings_has_bad_words`(
`ratings_id` int not null,
`bad_words_id` int not null,
FOREIGN KEY (`ratings_id`) REFERENCES ratings(`id`),
FOREIGN KEY (`bad_words_id`) REFERENCES bad_words(`id`),
PRIMARY KEY (`ratings_id`, `bad_words_id`));

INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('kyle', 'password', 'Kyle', 'Usherwood', 'Computer Engineering - Computer Science', 'ushe0010@algonquinlive.com', 'admin');
INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('lesserkyle', 'password', 'Kyle', 'Kilbride', 'Computer Engineering - Computer Science', 'kilb0067@algonquinlive.com', 'admin');
INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('matt', 'password', 'Matthew', 'Boyd', 'Computer Engineering - Computer Science', 'boyd0077@algonquinlive.com', 'admin');  
INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('superman346', 'lastSUN', 'Kal', 'El', 'Farming', 'el1933@algonquinlive.com', 'user');
INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('i''mbatman', 'aintnorest123', 'Bruce', 'Wayne', 'Forensics', 'wayn1939@algonquinlive.com', 'user');
INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('DAflash', 'arribaARRIBA', 'Barry', 'Allen', 'Kinesiology', 'alle1956@algonquinlive.com', 'user');
INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('green-lantern', 'yElLoWbAd', 'Hal', 'Jordan', 'Aviation', 'jord1959@algonquinlive.com', 'user');
INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `program`, `email_address`, `status`) VALUES ('wonder_woman', 'themyscira4eva', 'Diana', 'Prince', 'Classical Studies', 'prin0077@algonquinlive.com', 'user');

INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('ARC9001', 'Conserving Canada''s Architectural Heritage', 'If your field is architecture, building trades, engineering, social planning or tourism, your future is certain to include our past. To Canadians, preserving our heritage resources is a visible sign of community pride and environmental responsibility. Protecting heritage buildings requires an understanding of their histories and the principles of conservation shared by the preservation community. Conserving Canada''s Architectural Heritage traces the study of building styles and traditional building techniques as they have evolved across the Canadian landscape.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('DSN2001', 'History of Design','Explore the many influences of graphic design from the invention of writing and alphabets to the present day computer revolution and its impact on contemporary design. You will learn the philosophies, methods, and techniques of the eras in design including the origins of printing and typography, Victorian and Art Nouveau, Modern Art and Post Modern design. The course involves online discussion and analysis of each of the eras.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('ENL1725', 'Popular Canadian Literature','Canadian identity is challenging to define, but depictions of our multicultural society are found and explored in our literature. This course introduces students to a wide range of literature with the dual aim of exploring the theme of the Canadian identity while enhancing students'' cultural and self-awareness. The course explores the importance of writers'' perceptions of the world, and how those perceptions affect contemporary Canadian society. Through assigned readings, discussion, presentations and essay writing, students investigate the role of the artist in defining and shaping society.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('ENL1726', 'Artistic Expression: A Canadian Exploration','From drawings on cave walls to masterpieces painted on church ceilings, humans have expressed themselves through paintings, sculpture, graffiti, installation art, and even body modification. In this interactive, discussion-based course, students analyze and critique art in the context of both theoretical principles and historical influences. Through an examination of past and present forms of traditional and non-traditional art, students align individual perceptions with artistic works and consider the value of cultural and ethical boundaries on expression. To complete their experience, students create and annotate an outlet for their own artistic expression, using a medium of their choice.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('ENL1798', 'Contemporary Canadian Issues','A critical understanding of contemporary Canadian issues is essential to being an active member in our democratic society. Students explore a variety of topics and analyze their ethical implications and relevance to Canadian life. Discussions and debates, as well as related interactive activities, offer opportunities to consider recent controversies from different perspectives. Use of a variety of media (e.g. newspapers, articles and electronic resources) allows for in-depth reflection on the history of current social and political issues.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('ENL1825', 'Communication Dynamics','Personal growth and self-reflection are key components to enhance quality of life. Students examine important perspectives on personal growth, character and interpersonal relations. Case-studies, in-class discussions, and learning activities focus on the powerful forces that drive our day-to-day lives. Special attention is paid to current events in order to explore personal growth within a variety of contexts.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('ENL1829', 'The Power of Public Speaking','From its beginnings as storytelling, oratory has remained a constantly evolving source of human knowledge. Theoretical components of public speaking are considered and examined. Students prepare workshops to explore the psychological and physiological aspects of this art. Additionally, students gain an appreciation of the artistry evidenced in great orators who have influenced, and continue to influence, human activity. To complete their experience, students deliver a formal presentation as an outlet for their own storytelling and public expression of ideas.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('ENV0002', 'Environmental Citizenship','Based on the general principles of national citizenship, environmental citizenship goes beyond national borders to emphasize global environmental rights and responsibilities - to focus on both conservation of and planned sustainable use of our planet''s resources, as well as the recognition that environmental health is a prerequisite to human health. Environmental citizenship is a personal commitment to learning more about the environment and to taking responsible environmental action. This course is a journey into adopting attitudes and behaviours that foster global environmental responsibility.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('FAM1218', 'A Cultural Diversity Quest','This course explores the concept of multiculturalism and examines some of the ways in which it is interpreted by Canadian society. The cultural diversity quest embedded in the course gives learners an opportunity to expand their knowledge of Canada''s various cultural groups. In addition, learners examine the issue of ethnocentricity and analyze factors that lead to prejudice, racism, and discrimination in Canadian society. Finally, learners are encouraged to seek out ways to appreciate cultural differences and promote positive intercultural relationships in their communities and in their workplaces.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('FIN2300', 'Introduction to Personal Finance','This is a self study reading and research course. Students will receive directed reading assignments on the topics of saving, investment, life insurance, retirement, housing, credit, income taxes, disability insurance, and funding post-secondary education. Students are required to research these topics and critically evaluate the role of the financial service provider when implementing the consumer''s plans.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED1896', 'The Middle East:  An Understanding of Media Sources & Their Impact','We live in an age where influential messages about pressing events and social issues are delivered through mass media.  It is essential that people consciously analyze and evaluate media messages when interpreting history and current events.  In this course, students learn how to seek out current, accurate and credible sources of information and examine the influence that media messages have on their understanding of the world.  Through the analysis of readings and audio and video materials, students develop critical thinking skills while gaining an understanding of historical and current events in the Middle East.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED5002', 'Victimology','An increased awareness of the ripple effect of crime has given rise to Victimology as a significant field of study.  In this course, particular emphasis is given to victims of crime and its impact on their lives, their families, and on society.  The history of victimology and the victims'' movement, the nature and extent of victimization, its emerging theories and resulting legislation are traced.  Victims'' services, accessibility to services, rights of the victim, and the victim in the criminal justice system are examined.  Students learn about crime in the workplace, schools, and campuses, and the importance of recognizing those at risk.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED5004', 'Living Green','The need to lead healthy, environmentally conscious lives is becoming increasingly important.  In this course students learn the practical knowledge and skills they require to explore current environmental challenges and identify personal plans for living in an environmentally responsible manner. Students learn the history and development of current environmental concerns, the environmental impact of our choices and behaviours and, finally, the strategies involved in living green.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED5005', 'Greek Mythology','Greek Mythology introduces students to intriguing characters, important places, and famous myths of Classical Greece.  By examining a variety of popular myths, students discover how the Ancient Greeks crafted narratives of gods, goddesses, monsters, and heroic figures to make sense of their lives and the world around them.  Using examples from art, science, and industry, learners explore how these epic stories from oral tradition have evolved and endured to influence the intricate artistic and literary fabric of contemporary society.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED5006', 'World Religions','In Canada, our society embraces people from many cultures of the world. By exploring different religious beliefs about the world, the individual, the meaning of life and death, and how individuals are encouraged to conduct themselves, we can begin to appreciate the underlying forces that shape followers'' lives.  Students in this course explore the history and basic teachings of six of the major religions of the world: Hinduism, Buddhism, Judaism, Christianity, Islam, and the Baha''i Faith. Each religion''s distinctive features are highlighted, and their similarities and shared values examined.  Students have the opportunity to broaden their worldview in light of their understanding of divergent religious traditions.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED5009', 'Digging into Ancestral Roots','In this general education course, students learn how science and technology can help them become amateur genealogists, tracing their family roots. They learn how scientists use DNA evidence to trace one''s origins back to the beginning of humankind''s existence, and to determine how contemporary individuals might be related to one another.  They examine microfilm technology and computer databases that are used to store and retrieve data about their ancestors, data such as birth, death and marriage records, and land transactions. Through discussion forum activities and individual research, students use both microfilm and the computer to retrieve family records. They examine the privacy issues associated with putting one''s family tree online.  Finally, using commercial technology, they construct a four-generational family tree that is supported by genealogical evidence.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED5200', 'Learning Disabilities, The Invisible Disability','This course is Web based. It introduces the field of learning disabilities by providing an historical overview, definitions, characteristics, and various models of the causes of learning disabilities. Students have an opportunity to learn about the impact a learning disability has on a person''s day-to-day life and the strategies that may be used to compensate for it. Students experience a variety of on-line learning activities facilitated by an expert in the field of learning disabilities. Activities also include group work, independent research, reflection, and case studies. Course participants are encouraged to share personal experience and knowledge. Some experience in using the Internet and doing on-line searches is recommended.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED5300', 'The Science of Everyday Life','Students consider basic concepts from a number of scientific disciplines, such as biology, physics and chemistry. Through the examination of everyday occurrences the student is introduced to scientific ways of thought and to the problem-solving methods used by scientists. A background in science and math is not required for this course.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GED6022', 'A Sense of Humour','This course leads the learner to an understanding of the development, use, and value of humour in Canadian visual and creative arts.  Varieties of humour (e.g. irony, satire, farce) are positioned in the context of Canadian culture to enhance the learner''s appreciation of humour and self-awareness.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GEN1001', 'Ethics: What''s the Big Deal?','Some would say that "there is a hole in the moral ozone and it''s getting bigger". This course is designed to examine and address the ethical challenges we face every day. It will assist students to clarify their own values and understand how these values impact the course of their lives. The course will provide students with a number of tools and decision making models to deal with personal and professional ethical dilemmas.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GEN1957', 'Science Fiction','Science fiction is both a genre of popular entertainment and a mode of social commentary. Learners explore the formal conventions and the history of the genre, consume and analyze a representative range of science fiction, and strive to heighten their critical appreciation of the role and place of science fiction in society. Learners also have an opportunity to create their own piece of science fiction.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GEN2000', 'Film and Multiculturalism','Multiculturalism has been official policy in Canada since 1971, but remains controversial in many sectors of Canadian life. Through viewing and reflecting on a programme of films, learners enhance their understanding of multiculturalism and the values and representations of multiculturalism, positive and negative, that the films present. Among the issues covered are immigration, refugees, ethnic enclaves, the "Quebec question" and indigenous relations, as well as racism and ethnic violence.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GEN2003', 'Healthy Lifestyle','Through self -evaluation, weekly journals, research and hands on exercises students will gain the knowledge and skills necessary to lead a healthy lifestyle.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GEN2007', 'Community Services ','Volunteerism not only benefits a community, but it can broaden the world view of the volunteer. Students who give their time and energy to a particular cause, in return, gain an opportunity to reflect on the value of the volunteer in contemporary society.  Through research and discussion, students consider different types of volunteer settings, trace the history of volunteer organizations, examine the various roles volunteers play within society, and reflect on ethical issues.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('GEN2009', 'Geology of the Ottawa Area','This general education course leads students back through the record of time. Moving first by centuries, then millennia, taking time in ever increasing bites until the origin of the planet is discussed. A digital photo library explores local sites of interest which reveal the principles of geology. The building blocks of rocks, from minerals to atoms, are explained with a minimum of jargon using only the key words necessary to unlock the world of science. Students develop the ability to appreciate the genesis of mountains, and speculate intelligently on the age and mineralogy of a pebble from their shoe. The dynamics of the ever-shifting continents and their impact upon the Ottawa area are explored.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('HIS0001', 'Saints and Heroes: Shining a Spotlight on the ''Dark Ages'', Europe A.D. 410-1096','When the mighty Roman Empire began to collapse, it was attacked from all directions by Barbarian armies. The resulting turmoil caused Europe to sink into a period of social and political upheaval known as The Dark Ages. However, during these troubled times, extraordinary warriors and missionaries emerged whose profound influence has played a vital role in shaping what has become our modern world. This course examines the social, political, intellectual, and economic history of this era and explores its enduring impact on modern western society.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('HIS2000', 'Good Times and Bad - 70 Years in the Life of Canada','During the 70 years from 1897 to 1967, Canadians experienced times of prosperity and progress as well as periods of depression and war. There were times of optimism and moments of crisis. Through it all we have built a nation and contributed across the world. This course explores the political framework of Canada, recurring social issues and the place of Canada in the world.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('HOS2228', 'Wine, Food and Culture','An understanding of culture can be discovered by exploring eating and drinking customs.  Students experience a virtual global tour, exploring culture, history and traditions through the lens of wine and food. Students acquire a sense of the customs of their culture and those of others. Through comparison, observation, discussion, and reflection, students discover something found in all cultures: the importance of food and drink.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('LIB1982', 'Reading for Recreation','Reading gives us knowledge and new ideas to draw from in the future. It tones the mind in ways similar to the way exercise tones the body. As a result, time spent in reading for recreation has benefits beyond the immediate appreciation of the text. In this course, students examine appeal factors of various genres of fiction and non-fiction. They review the history and classics of each genre, consider the therapeutic values of reading, and examine recent trends in online reading and publishing.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('MGT7330', 'Trends in Today''s Workplace','In today''s work culture, every employee needs to be knowledgeable of current trends and issues in the workplace. In this course, students learn about emerging issues facing employees in today''s technology-driven workplace and explore the realities of social networking, diversity in the workplace and work mobility.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('MVM8800', 'The Impact of the Car on North American Culture','This course provides learners with an opportunity to explore the social, economic, political and environmental impact of the automobile on our lives. It traces the history of the automobile from its introduction to the present day and allows learners to explore the changes it has introduced to manufacturing, lifestyles, design principles, transportation systems, the environment and labour-management negotiation, and economic organization.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('PSI0003', 'Globalization and Sustainability','The rapid growth of the global economy raises fundamental questions: How does trade and politics affect development and the environment? What are the effects of free trade and the rise of multi-national corporations on local cultures? What are the effects of the ‘‘clash of cultures'' produced by international travel, migration, and new social, collaborative technologies that send film, books, television, music, and other ‘‘proprietary'' content spinning around the world instantly? Is globalization environmentally sustainable? This course is designed to examine these and other questions and to provide students with the skills to analyze the day-to-day choices raised by globalization in an increasingly interconnected world.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('PSI1702', 'Government of Canada','Students explore the Canadian governmental system and consider key principles of democracy and federalism. In addition, students analyze the impact of government on the lives of its citizens, as well as the ways in which citizens and communities affect the government. Finally, students examine the diverse political, national and ideological dynamics of Canadian politics.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('RAD2001', 'Popular Culture','This introductory, Internet-based course will examine recent North American popular culture including trends, fads, styles, theories and the cult of the new. This course will explore our perceptions of culture, the trivialization of society and how the media has inexorably helped to shape today''s values. Students will, through on-line research, assigned readings, and participation in self-directed learning, critically study popular culture''s place in North American society concentrating on their decade of choice. One dictionary definition of popular culture is the "totality of socially transmitted behaviour patterns, arts, beliefs, institutions, and all other products of human work and thought." That definition allows us great freedom and scope.');
INSERT INTO `electives` (`course_code`, `elective_name`, `description`) VALUES ('SOC2003', 'Understanding Human Sexuality','This course provides an interdisciplinary introduction to the study of human sexuality. It examines the basic understanding of human sexuality through an investigation of history, culture, physiology, sexual development, sexual behaviours, sexually transmitted diseases, attitudes, sex, deviance, and sexual relationships.');

INSERT INTO `bad_words` (`word`) VALUES ('fuck');
INSERT INTO `bad_words` (`word`) VALUES ('shit');
INSERT INTO `bad_words` (`word`) VALUES ('piss');
INSERT INTO `bad_words` (`word`) VALUES ('cock');
INSERT INTO `bad_words` (`word`) VALUES ('ass');
INSERT INTO `bad_words` (`word`) VALUES ('cunt');
INSERT INTO `bad_words` (`word`) VALUES ('tit');
INSERT INTO `bad_words` (`word`) VALUES ('twat');
INSERT INTO `bad_words` (`word`) VALUES ('dick');
INSERT INTO `bad_words` (`word`) VALUES ('bastard');
INSERT INTO `bad_words` (`word`) VALUES ('cum');

CREATE TRIGGER update_avg AFTER INSERT ON `ratings`
FOR EACH ROW UPDATE electives
  SET average_rating = (SELECT AVG(rating) from ratings where ratings.id=electives.id)
WHERE electives.id=NEW.id;

INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('6', '5', 'Lorem Ipsem', '4', UNIX_TIMESTAMP(), '1');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('2', '7', 'Lorem Ipsem', '4', UNIX_TIMESTAMP(), '23');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('8', '1', 'Lorem Ipsem', '4', UNIX_TIMESTAMP(), '15');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('2', '1', 'i''m batman', '5', UNIX_TIMESTAMP(), '2');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('5', '2', 'i''m batman', '5', UNIX_TIMESTAMP(), '23');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('6', '1', 'i''m batman', '5', UNIX_TIMESTAMP(), '30');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('4', '3', 'Lorem Ipsem', '6', UNIX_TIMESTAMP(), '1');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('6', '7', 'Lorem Ipsem', '6', UNIX_TIMESTAMP(), '22');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('10', '5', 'Lorem Ipsem', '6', UNIX_TIMESTAMP(), '32');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('9', '13', 'Lorem Ipsem', '7', UNIX_TIMESTAMP(), '1');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('1', '25', 'Lorem Ipsem', '7', UNIX_TIMESTAMP(), '23');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('3', '2', 'Lorem Ipsem', '7', UNIX_TIMESTAMP(), '1');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('7', '3', 'Lorem Ipsem', '8', UNIX_TIMESTAMP(), '5');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('6', '4', 'Lorem Ipsem', '8', UNIX_TIMESTAMP(), '12');
INSERT INTO `ratings` (`rating`, `hours_per_week`, `comment`, `users_id`, `date`, `electives_id`) VALUES ('6', '6', 'Lorem Ipsem', '8', UNIX_TIMESTAMP(), '11');
