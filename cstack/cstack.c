struct s_test {
  int i;
  char c;
  char str[5];
};

void f1 (int);
void f2 (char);
void f3 (char[5]);
void f4 (struct s_test);

void fn () {
  int local_i;
  char local_c;
  char local_str[5];
  struct s_test local_s;

  local_i = 7;
  local_c = 'A';
  local_str[0] = 'B';
  local_str[1] = 'B';
  local_str[2] = 'B';
  local_str[3] = 'B';
  local_str[4] = '\0';

  // struct
  local_s.i = 9;
  local_s.c = 'C';
  local_s.str[0] = 'D';
  local_s.str[1] = 'D';
  local_s.str[2] = 'D';
  local_s.str[3] = 'D';
  local_s.str[4] = '\0';

  f1 (local_i);
  f2 (local_c);
  f3 (local_str);
  f4 (local_s);

}
