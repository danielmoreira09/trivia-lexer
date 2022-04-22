// parser.mly

%token                 EOF
%token <int>           LITINT
%token <Symbol.symbol> ID
%token                 PLUS
%token                 LT
%token                 EQ
%token                 COMMA
%token                 LPAREN
%token                 RPAREN
%token                 INT
%token                 BOOL
%token                 IF
%token                 THEN
%token                 ELSE
%token                 LET
%token                 IN

%left                  LT
%left                  PLUS

%start <Absyn.lprogram> program

%%

program:
  | EOF                                  {}
  | Funs                                 {}
;

Funs:
  | Fun                                  {}
  | Fun Funs                             {}
;

Fun:
  | TypeId LPAREN TypeIds RPAREN EQ Exp  {}
;

TypeId:
  | LITINT ID                            {}
  | BOOL ID                              {}
;

TypeIds:
  | TypeId                               {}
  | TypeId COMMA TypeIds                 {}
;

Exp:
  | LITINT                               {}
  | ID                                   {}
  | Exp PLUS Exp                         {}
  | Exp LT Exp                           {}
  | IF Exp THEN Exp ELSE Exp             {}
  | ID LPAREN Exps RPAREN                {}
  | LET ID EQ Exp IN Exp                 {}
;

Exps:
  | Exp                                  {}
  | Exp COMMA Exps                       {}
;