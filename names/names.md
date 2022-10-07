❲ x ⎟ Hello World Sequential ⎟ ❲\⎟name containing unicode-or-bars\⎟❳❳
❲ x ⎟ synonym ❳
❲ x ❲ nested name ❳❳


namestring = 
  | "❲" namestringcontainingspaces "❳"
  | notbracketnotspace+

namestringcontainingspaces = 
  | "❲" namestringcontainingspaces "❳"
  | notbracket+

notbracketnotspace =  ~space ~"❲" ~"❳" ~"⎟" escapedChar
notbracket =  ~"❲" ~"❳" ~"⎟" escapedChar

escapedChar = 
  | "\" any
  | any
  
namewithsynonyms =
  | "❲" namewithsynonyms "⎟" namestring "❳"
  | "❲" namestring "❳"
  |  namestring

