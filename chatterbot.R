## File: chatterbot.R
## Author: Bavin Ondieki
## ------------------------

PatternMatch <- function(wildcard, pattern, target) {
  ## Function to perform pattern matching on two lists.
  ## Args:
  ##   wildcard - object which may match any sub-list.
  ##   pattern - list possibly containing wildcard elements.
  ##   target - list not containing wildcard elements.
  ## Returns:
  ##   The sub-list of target that matches the first occurrence of wildcard
  ##   in pattern, or NULL if the two lists do not match.

  if(length(pattern) == 0 && length(target)== 0){
    return(list())
  }

  if(length(pattern) == 0 && length(target) != 0){
    return(list())
  }

  if(length(pattern) == 1 && pattern[[1]] == '*' && length(target) != 0){
    return(target)
  }


  if(length(pattern) != 0 && length(target) == 0){
    if(pattern[[1]] == wildcard && length(pattern) == 1){
      return(NULL)
    }

    if(pattern[[1]] == wildcard && length(pattern) > 1 ){
      return(PatternMatch(pattern[-1], target))
    }
  }
  
  if(pattern[[1]] == wildcard && length(target) >= 1){
    if(pattern[1] != '*'){
      L = list()
      for(i in 1:length(target)){
        if(pattern[[i]] == wildcard){
            L = c(L,c=target[[1]])
        }
      }
      return(L)
    }
    if(length(grep(wildcard,list(target[1]))) > 0){
      pattern[[1]] = target[[1]]
    } 
  }

  if(pattern[[1]] != target[[1]]){return(NULL)}

  if (pattern[[1]] == target[[1]]) return(PatternMatch(wildcard,pattern[-1], target[-1]))
  return(PatternMatch(wildcard,pattern, target[-1]))
}

PatternSubstitute <- function(wildcard, template, sub) {
  ## Function to replace each occurrence of wildcard in template with sub.
  ##
  ## Args:
  ##   wildcard - object to be treated as wildcard.
  ##   template - list possibly containing wildcardee elements.
  ##   sub - object to substitute in place of wildcard elements.
  ## Returns:
  ##   Modified template.
  ## <your code here>

  result = list()
  sent = unlist(template[1])
  K = length(sent)
  for(i in 1:K ){
    t = sent[i]
    if(t == wildcard){
      result = c(result, c=sub)
    }else{
      result = c(result, c=t)
    }
  }
  return(result)
}   


PatternTransform <- function(target, rule, aux = NULL, wildcard = "*") {
  ## Function to apply a chatterbot rule to a target list.
  ##
  ## Args:
  ##   target - list to match against rule's pattern.
  ##   rule - list containing pattern and templates.
  ##   aux - function to apply to the result of the pattern match *before*
  ##         the substitution is made. Do this only if aux is non-NULL.
  ##   wildcard - object which may match any sub-list.
  ## Returns:
  ##   A list of transformations, or NULL if target does not match
  ##   rule's pattern.

  pat <- GetPattern(rule)
  temps <- GetTemplates(rule)
  result = PatternMatch(wildcard = wildcard, pattern = pat, target)
  
  if(length(result) == 0){
    if(length(result) == 0 ){
      return(NULL)
    }
  }
  
  reflect = ''
  
  SOL = NULL

  if(length(result) != 0 && length(target) != 0){
    reflect = Reflect(result)
    k = sample(1:length(pat), 1)
    sub = PatternSubstitute(wildcard,temps[k],reflect)
    SOL = sub
  }

  R = unlist(SOL,recursive=TRUE, use.names = FALSE)
  print(R)
  return(R)
}

Reflect <- function(target) {
  ## Function to reflect elements of target.
  ##
  ## Args:
  ##   target - list with words to reflect.
  ## Returns:
  ##   Modified target.
  sol = list()

  for(i in 1:length(target)){
    word = target[[i]]
    if(length(word) == 0){
       break;
    } 

    if(is.null(reflections[[unlist(word)]]) == FALSE){
      target[[i]] = reflections[[unlist(word)]]
      sol = c(sol, c=reflections[[unlist(word)]])
    }else{
      sol = c(sol, c= target[[i]] )
    }
  }
  return(target)
}

## Main function which instantiates the chatterbot from the specified
## init file and begins the interactive loop.
RunChatterbot <- function(init.file = "./init_chatterbot.R") {
  source(init.file)
  while (TRUE) {
    ## Read question from console.
    question <- scan(what = character(0), nlines = 1, quiet = TRUE)
    if (length(question) == 0) {
      break;
    }
    ## Tokenize question into suitably formatted list.
    question <- as.vector(unlist(strsplit(question, " ")), mode = "list")
    print(question)
    for (i in 1:length(chatterbot)) {
      rule <- chatterbot[[i]]
      if(question[[1]] == ""){
        transforms <- (unlist(chatterbot[1],recursive=TRUE))
      }else{
        transforms <- PatternTransform(question, rule, aux = Reflect)
      }
      if (is.null(transforms)) {
        next
      } else {
        print(transforms)
        answer <- transforms[[sample(1:length(transforms), 1)]]
        #print(paste(unlist(answer), collapse = " "))
        break
      }
    }
  }
}
