## File: init_chatterbot.R
## Author: <your name here>
## ------------------------

## This file is constructs the chatterbot and provides other
## useful utility functions. You do not need to change anything, but
## you may have fun modifying/adding to the chatterbot rules below.

## The chatterbot is initially defined as a list of rules, each rule consisting
## of a pattern and list of templates.
chatterbot <<- list(

  list("",
  list("Speak up ! I can't hear you .")),

  list("I need *",
  list("Why do you need * ?",
       "Would it really help you to get * ?",
       "Are you sure you need * ?")),

  list("Why don't you *",
  list("Do you really think I don't * ?",
       "Perhaps eventually I will * .",
       "Do you really want me to * ?")),

  list("Why can't I *",
  list("Do you think you should be able to * ?",
       "If you could * , what would you do ?",
       "I don't know -- why can't you * ?",
       "Have you really tried ?")),

  list("I can't *",
  list("How do you know you can't * ?",
       "Perhaps you could * if you tried .",
       "What would it take for you to * ?")),

  list("I am *",
  list("Did you come to me because you are * ?",
       "How long have you been * ?",
       "How do you feel about being * ?")),

  list("I'm *",
  list("How does being * make you feel?",
       "Do you enjoy being * ?",
       "Why do you tell me you're * ?",
       "Why do you think you're * ?")),

  list("Are you *",
  list("Why does it matter whether I am * ?",
       "Would you prefer it if I were not * ?",
       "Perhaps you believe I am * .",
       "I may be * -- what do you think ?")),

  list("What *",
  list("Why do you ask ?",
       "How would an answer to that help you ?",
       "What do you think ?")),

  list("How *",
  list("How do you suppose ?",
       "Perhaps you can answer your own question .",
       "What is it you're really asking ?")),

  list("Because *",
  list("Is that the real reason ?",
       "What other reasons come to mind ?",
       "Does that reason apply to anything else ?",
       "If * , what else must be true ?")),

  list("* sorry *",
  list("There are many times when no apology is needed .",
       "What feelings do you have when you apologize ?")),

  list("Hello *",
  list("Hello , I'm glad you could drop by today .",
       "Hi there , how are you today ?",
       "Hello , how are you feeling today ?")),

  list("I think *",
  list("Do you doubt * ?",
       "Do you really think so ?",
       "But you're not sure * ?")),

  list("* friend *",
  list("Tell me more about your friends .",
       "When you think of a friend, what comes to mind ?",
       "Why don't you tell me about a childhood friend ?")),

  list("Yes",
  list("You seem quite sure .",
       "OK , but can you elaborate a bit ?")),

  list("* computer *",
  list("Are you really talking about me ?",
       "Does it seem strange to talk to a computer ?",
       "How do computers make you feel ?",
       "Do you feel threatened by computers ?")),

  list("Is it *",
  list("Do you think it is * ?",
       "Perhaps it's * -- what do you think ?",
       "If it were * , what would you do ?",
       "It could well be that * .")),

  list("It is *",
  list("You seem very certain .",
       "If I told you that it probably isn't * , what would you feel ?")),

  list("Can you *",
  list("What makes you think I can't * ?",
       "If I could * , then what ?",
       "Why do you ask if I can * ?")),

  list("Can I *",
  list("Perhaps you don't want to * .",
       "Do you want to be able to * ?",
       "If you could * , would you ?")),

  list("You are *",
  list("Why do you think I am * ?",
       "Does it please you to think that I'm * ?",
       "Perhaps you would like me to be * .",
       "Perhaps you're really talking about yourself ?")),

  list("You're *",
  list("Why do you say I am * ?",
       "Why do you think I am * ?",
       "Are we talking about you , or me ?")),

  list("I don't *",
  list("Don't you really * ?",
       "Why don't you * ?",
       "Do you want to * ?")),

  list("I feel *",
  list("Good , tell me more about these feelings .",
       "Do you often feel * ?",
       "When do you usually feel * ?",
       "When you feel * , what do you do ?")),

  list("I have *",
  list("Why do you tell me that you've * ?",
       "Have you really * ?",
       "Now that you have * , what will you do next ?")),

  list("I would *",
  list("Could you explain why you would * ?",
       "Why would you * ?",
       "Who else knows that you would * ?")),

  list("Is there *",
  list("Do you think there is * ?",
       "It's likely that there is * .",
       "Would you like there to be * ?")),

  list("My *",
  list("I see , your * .",
       "Why do you say that your * ?",
       "When your * , how do you feel?")),

  list("You *",
  list("We should be discussing you , not me.",
       "Why do you say that about me ?",
       "Why do you care whether I * ?")),

  list("Why *",
  list("Why don't you tell me the reason why * ?",
       "Why do you think * ?")),

  list("I want *",
  list("What would it mean to you if you got * ?",
       "Why do you want * ?",
       "What would you do if you got * ?",
       "If you got * , then what would you do ?")),

  list("* mother *",
  list("Tell me more about your mother .",
       "What was your relationship with your mother like ?",
       "How do you feel about your mother ?",
       "How does this relate to your feelings today ?",
       "Good family relations are important .")),

  list("* father *",
  list("Tell me more about your father .",
       "How did your father make you feel ?",
       "How do you feel about your father ?",
       "Does your relationship with your father relate to your feelings ?",
       "Do you have trouble showing affection with your family ?")),

  list("* child *",
  list("Did you have close friends as a child ?",
       "What is your favorite childhood memory ?",
       "Do you remember any dreams or nightmares from childhood ?",
       "Did the other children sometimes tease you ?",
       "Do you think your childhood experiences relate to your feelings ?")),

  list("* ?",
  list("Why do you ask that ?",
       "Please consider whether you can answer your own question .",
       "Perhaps the answer lies within yourself ?",
       "Why don't you tell me ?")),

  list("quit",
  list("Thank you for talking with me .",
       "Good-bye .",
       "Thank you , that will be $150 . Have a good day !")),

  list("*",
  list("Please tell me more .",
       "Let's change focus a bit ... Tell me about your family .",
       "Can you elaborate on that ?",
       "Why do you say that * ?",
       "I see .",
       "Very interesting .",
       "* .",
       "I see . And what does that tell you ?",
       "How does that make you feel ?",
       "How do you feel when you say that ?"))
)

# For the chatterbot to work with our pattern matching functions,
# we must tokenize each pattern/template into its component words
# and represent strings as a lists of words.
TokenizeChatterbot <- function(chatterbot) {
  TokenizeLine <- function(line) {
    return(as.vector(unlist(strsplit(line, " ")), mode = "list"))
  }
  TokenizeRule <- function(rule) {
    return(list(TokenizeLine(rule[[1]]), lapply(rule[[2]], TokenizeLine)))
  }
  return(lapply(chatterbot, TokenizeRule))
}

chatterbot <- TokenizeChatterbot(chatterbot)


## Utility functions for chatterbot rules.
GetPattern <- function(rule) {
  return(rule[[1]])
}

GetTemplates <- function(rule) {
  return(rule[[2]])
}


## List of reflections.
reflections <<- list(
  "am" = "are",
  "was" = "were",
  "I" = "you",
  "I'm" = "you are",
  "I'd" = "you would",
  "I've" = "you have",
  "I'll" = "you will",
  "my" = "your",
  "me" = "you",
  "are" = "am",
  "you're" = "I am",
  "you've" = "I have",
  "you'll" = "I will",
  "your" = "my",
  "yours" = "mine",
  "you" = "me"
)
