USE `aci` ;

INSERT INTO `category` VALUES (6,'training','The agents have to attend to specialized courses.',1,'2024-04-28 18:01:50','2024-05-01 23:19:07',1),(7,'intervene','Supervisor must barge into the call to calm things up.',3,'2024-04-28 18:06:52','2024-05-01 23:19:35',1),(9,'transfer','Move an agent to a resource where its help is needed',2,'2024-04-28 18:22:01','2024-05-01 23:20:00',1);
INSERT INTO `insight` VALUES (10,6,'Clear Communication and Documentation Familiarity','The extended call times and excessive hold times indicate that agents may struggle with maintaining concise and efficient conversations. Moreover, the disparity between personal AHT and skill-based AHT, as well as personal Hold Time exceeding Hold Time by skill, suggests that agents may not be effectively utilizing available resources or are unfamiliar with necessary documentation. A focused training is needed to enhance agents\' ability to communicate clearly and concisely, as well as to improve their familiarity with relevant documentation to reduce wait times and enhance call handling efficiency.','2024-05-01 16:35:51','2024-05-01 16:35:51',1),(11,6,'Improving Schedule Adherence by Reducing Disconnects','The schedule adherence rate falling below 90% indicates that agents are disconnecting from their schedules frequently. To address this issue, agents need to minimize the number of disconnections and adhere more closely to their assigned schedules.','2024-05-01 16:38:08','2024-05-01 16:38:08',1),(12,6,'Enhancing Response Time and Interface Familiarity for Improved ASA','The high Average Speed of Answer (ASA) with personal ASA exceeding skill-based ASA indicates that agents need to respond faster. Additionally, with personal ASA at or below 5 seconds, agents should be more familiar with the documentation interface. Training should focus on improving response times and ensuring agents are adept at navigating documentation interfaces to maintain high service levels.','2024-05-01 16:39:16','2024-05-01 16:39:16',1),(13,7,'Addressing High Call Times and Negative Contact Lens','The situation where personal Average Handling Time (AHT) exceeds skill-based AHT, along with contact lenses indicating anger, calls for intervention. Agents need assistance in managing both call times and effectively handling irate contact lenses.','2024-05-01 16:41:18','2024-05-01 16:41:18',1),(14,9,'Optimizing Agent Skill Allocation for Improved SL','To maintain a high Service Level (SL), agents from Skill A should be moved to Skill B if the SL of Skill A falls below 80% within 20 seconds, provided that Skill B has an SL greater than 80% within the same timeframe. This proactive adjustment can ensure better service delivery and optimize resource allocation.','2024-05-01 16:45:16','2024-05-01 16:45:16',1),(15,9,'Optimizing Agent Skill Allocation for Improved ACR','To address high Average Call Resolution (ACR) rates, agents from Skill A should be moved to Skill B if the ACR of Skill A exceeds 5%. This transfer should be made to a skill with an SL greater than 80%. By reallocating agents based on ACR performance, overall efficiency and customer satisfaction can be enhanced.','2024-05-01 16:46:20','2024-05-01 16:46:20',1),(16,9,'Optimizing Agent Skill Allocation for High Occupancy','When the average occupancy of Skill A exceeds 95%, agents should be moved from Skill A to Skill B, which has a lower average occupancy. This proactive reallocation ensures that agents are distributed effectively to maintain optimal occupancy levels across skills.','2024-05-01 16:47:04','2024-05-01 16:47:04',1);
INSERT INTO `training` VALUES (1,'Software Development','Training program for software development','2024-04-10 00:00:00','2024-04-15 00:00:00',1),(2,'Quality Control','Training program for quality control in manufacturing','2024-04-12 00:00:00','2024-04-16 00:00:00',1),(3,'Project Management','Training program for project management','2024-04-14 00:00:00','2024-04-18 00:00:00',1),(4,'Renewable Energy Technologies','Training program for renewable energy technologies','2024-04-15 00:00:00','2024-04-19 00:00:00',1),(6,'Software Development 1','Training program for software development','2024-04-25 00:00:00','2024-04-25 00:00:00',0),(7,'Software Development 2','Training program for software development','2024-04-25 00:00:00','2024-04-25 00:00:00',1),(8,'Software Development 3','Training program for software development 3','2024-04-25 00:00:00','2024-04-25 00:00:00',1),(9,'Software Development 4','Training program for software development 4','2024-04-25 00:00:00','2024-04-25 00:00:00',0),(11,'Software Development 5','Training program for software development','2024-04-25 00:00:00','2024-04-25 00:00:00',0),(13,'Spring Boot basics','The basics of Spring Boot development','2024-04-30 14:43:01','2024-04-30 14:43:01',1);
