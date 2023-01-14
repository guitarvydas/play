```
*globals*
*code*
*synonyms*
*constants*
*temp*
*arg*
*parameter*
*result*
```

```
char identity (char c) {
  return c;
}

int main (int argc, char **argv) {
  char x = identity ('x');
  printf ("result = %c\n", x);
}```

... main ...
def "x" <dd, @1, "char", *temp*, "x">
...
pushArg <dd, @0, "char", -, "x">
call "identity"
  ... identity ...
  move <od, *arg*, 0> -> <od, *parameter*, 0>
  move <od, *parameter*, 0> -> <od, *result*, 0>
... resume main ...
move <od, *result*, 0> -> <dd, @1, "char" *temp*, "x">
...
createTemp  "result = %c\n" -> <dd, @1, *temp*, "_">
pushArg <dd, @1, *temp*, "_">
pushArg <dd, @1, "char", *temp*, "x">
call "printf"
ignore <od, *result*, 0>
```