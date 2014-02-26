 
  K = 0
  if (length(sub) == 0) return(unlist(template,recursive=TRUE, use.names = FALSE))
  if (length(template) == 0) return(unlist(template,recursive=TRUE, use.names = FALSE))
  if (template[1] == wildcard){
    template[[1]] = sub
    #print(unlist(template))
    if(length(template) == 1){
      return(unlist(template,recursive=TRUE, use.names = FALSE))
    }else{
      print('############# ==1')
      template[1] = sub
      sol = unlist(template,recursive=TRUE, use.names = FALSE)
      print(sol)
      K = 1
      #return(sol)
    }
  }else{
    if(length(template) > 1 && template[[1]] == wildcard){
      print('########$$$$$$$$$$')
      #template[1] = sub
      print(unlist(template,recursive=TRUE, use.names = FALSE))
      print('$$$$$$$$$$')
      return(unlist(template,recursive=TRUE, use.names = FALSE))
    }
  }
  print('++++++++++++')
  #template = c(template[1], c=PatternSubstitute(wildcard,template[-1], sub))
  #return(c(template[[1]], c=PatternSubstitute(wildcard,template[-1], sub)))