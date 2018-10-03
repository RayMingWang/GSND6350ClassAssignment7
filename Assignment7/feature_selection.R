
#load data and remove the id and trejactory
rawdata<-read.csv("C:/Users/yzcvo/Desktop/GSND 6350/week3/VPALDataParsed.csv")
rawdata<-rawdata[-17]
names(rawdata)<-c("id","quest_taken","quest_complete","dialogues","loots","items","dead","shots","kills"
                  ,"interactionNPC","container","attacks","quest_attack","friendly_attack","unmotivated_attack","selfdefense_attack")

#backward feature selection
step(lm(friendly_attack+unmotivated_attack ~ ., data=rawdata), direction="backward")
step(lm(dialogues~.,data = rawdata),direction = "backward")
step(lm(quest_taken+quest_complete~.,data = rawdata),direction = "backward")

#forward feature selection
step(lm(friendly_attack+unmotivated_attack~1,data = rawdata),direction = "forward",scope = ~quest_taken+quest_complete+dialogues+loots+items+dead+shots+kills+interactionNPC+container+attacks+quest_attack+selfdefense_attack)
step(lm(dialogues~1,data = rawdata),direction = "forward",scope = ~quest_taken+quest_complete+loots+items+dead+shots+kills+interactionNPC+container+attacks+quest_attack+selfdefense_attack+friendly_attack+unmotivated_attack)
step(lm(quest_taken+quest_complete~1,data = rawdata),direction = "forward",scope = ~dialogues+loots+items+dead+shots+kills+interactionNPC+container+attacks+quest_attack+selfdefense_attack+friendly_attack+unmotivated_attack)

