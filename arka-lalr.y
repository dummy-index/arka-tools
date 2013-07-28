
/* cf. http://www.asahi-net.or.jp/~wg5k-ickw/html/online/flex-2.5.4/flex_6.html */

/* Cコードはファイルの先頭で提供する */

%{

#include <stdio.h>                          
#include <string.h>

extern int  yylexlinenum;  /* lex.yy.cに存在する */
extern char *yytext;       /* カレント・トークン */
int yylex(void);
void yyerror(char *);
%}

/* キーワードと予約語がここから始まる */

%union{                    /* これはデータの共用体 */
    char   name[128];      /* 名前                 */
}

%start paragraph
/*------------- 予約語 ------------------*/

%token <name> COMMA
%token <name> PERIOD
%token <name> NUMBER
%token <name> UNKNOWN

                    /* ova) seet, milia */

%token <name> WATASI       /* an, non */
%token <name> WATASINO     /* ant, noan */
%token <name> WATASIRA     /* ans, lena */
%token <name> WATASIRANO   /* antes, lenan */
%token <name> ANATA        /* ti, tyu */
%token <name> ANATANO      /* tiil, tuan */
%token <name> ANATARA      /* tiis, lilis */
%token <name> ANATARANO    /* tiiles, lilin */

%token <name> DESUNE       /* kok, sete */
%token <name> KANAA        /* sei, eyo */
%token <name> DAYO         /* tisee, tisse */
%token <name> DESUKA       /* mia */
%token <name> GOBI         /* その他の文末純詞 */

%token <name> KARE         /* lu */
%token <name> KARENO       /* luut */
%token <name> KARERA       /* luus, luan */
%token <name> KARERANO     /* luutes, luant */
%token <name> ANOHITO      /* la */
%token <name> ANOHITONO    /* laat */
%token <name> ANOHITORA    /* laas, lain */
%token <name> ANOHITORANO  /* laates, laint */

%token <name> KORE     /* tu - これ、この*/
%token <name> KORENO   /* tuul - 「この」ではない */
%token <name> KORERA   /* tuus, tutu */
%token <name> KORERANO /* tuules, tutul */
%token <name> LE      /* le - あれ、あの */
%token <name> ARENO    /* leet */
%token <name> ARERA    /* lees, lele */
%token <name> ARERANO  /* leetes, leent */

%token <name> HUTUUNOHITO  /* el - 四人称 */
%token <name> ALL          /* il */
%token <name> SOME         /* vei */
%token <name> PARTICULAR   /* xe */
%token <name> ANY          /* fi */
%token <name> WHICH        /* wel */
%token <name> NOBODY       /* yuu */
%token <name> WHO          /* ne */
%token <name> WHAT         /* to */
%token <name> WHOEVER      /* netal */
%token <name> WHATEVER     /* total */

%token <name> E             /* e(1)［接続詞］ e(4)［文末純詞］ */
%token <name> T_            /* e(1)の変形 */
%token <name> L_            /* le(2)の変形 */

%token <name> CA           /* ca - その、強調限定 前置形容詞 */
%token <name> DEL          /* del - 同格の接続詞  */
%token <name> FALA         /* fala - ［名詞］番号 ［格詞］～番目の （falaenが混ざってる？） */

%token <name> SOL      /* 主格 */
%token <name> YUL      /* 対格 */
%token <name> A        /* 与格to */
%token <name> I        /* 奪格from */
%token <name> IM       /* 時格 */
%token <name> OK       /* 随伴格 */
%token <name> KON      /* 道具格 */
%token <name> KOKKO    /* 随伴格か道具格 */
%token <name> KA       /* 場所格 */
%token <name> MAN      /* 理由格because */
%token <name> OL       /* 場合格if */
%token <name> XEL      /* 主格の同格 */
%token <name> LEX      /* 対格の同格 */
%token <name> SON      /* ［格詞］［文頭純詞］結果 */
%token <name> YAN      /* ［格詞］［文頭純詞］順接 */
%token <name> TAL      /* ［格詞］［文頭純詞］逆接 */
%token <name> PREP PREP_N  /* 格詞 _Nは名詞になりうるもの */

%token <name> ET  /* 繋辞 */
%token <name> DE
%token <name> ET_TENSE
%token <name> ES  /* es(1) 継続相の繋辞 es(2) ［文頭純詞］なぜ */
%token <name> ADVERB_PRE ADVERB_POST_D ADVERB_POST ADVERB_TENSE  /* 法副詞 ADVERB_PREは前置する遊離副詞と共用 */
%token <name> VERB VERB_I  /* 動詞 _Iは感動詞になりうるもの */
%token <name> ADJ ADJ_D  /* 形容詞 _Dは文頭純詞になりうるもの */
%token <name> ADJ_PRE ADJ_PRE_N  /* 前置する形容詞 _Nは呼称系 ADJ_PRE determiner_pre ADJ_PRE_Nの順で出てくる（多分） ca tu galt */
%token <name> ADVERB  /* elのついていない遊離副詞 */
%token <name> EL_ADVERB  /* elのついている副詞 副詞句の目印になる */
%token <name> DISJUNCT  /* 文頭純詞 */
%token <name> CONJUNCTION  /* 接続詞 */
%token <name> LPAREN RPAREN  /* tie, tun */

%token <name> NOUN
%token <name> INTERJECTION  /* 感動詞 */

%type <name> personal_pronoun pronoun
%type <name> determiner_pre determiner_post
%type <name> adj_pre  /* 形容詞（前置） */

%type <name> noun_word
%type <name> noun_phrase1a noun_phrase1b noun_phrase1c noun_phrase2a noun_phrase2b
%type <name> noun_phrase3 noun_phrase
/*%type <name> clause*/              /*  */
%type <name> possessive_clause   /* e, t' */
%type <name> noun_appositive   /* del, ",", ca,  */
%type <name> that_clause1a that_clause2a that_clause3a
%type <name> that_clause1b that_clause2b that_clause3b
%type <name> that_clause         /* le, l'- - 同格または関係詞節 */

%type <name> adjective_phrase

%type <name> subj obj compl trans_adjunct
%type <name> verb1 verb2 verb3 verb4 verb verb_that
%type <name> be_verb
%type <name> preposition_d preposition1 preposition /* 格詞 _dは文頭純詞になりうるもの */
%type <name> adjunct adverb el_adverb
%type <name> sv disjunct gobi interj
%type <name> sentence_b1 sentence_b2 sentence_b
%type <name> sentence
%type <name> paragraph

/* ぶら下がりELSEの明示的な解決方法 */
/* http://docs.oracle.com/cd/E19620-01/805-5827/6j5gfran3/index.html */

%nonassoc REDUCE
%nonassoc SON YAN TAL MAN A I IM OK KON KOKKO KA OL XEL LEX SOL YUL PREP PREP_N EL_ADVERB
%left CONJUNCTION E T_ LE L_ CA COMMA DEL FALA
%left ADVERB

%%

/* 名：名詞 代：代詞 前形：形容詞（前置） 形：形容詞 接：接続詞 */
/* 動：動詞 繋：繋辞 法：法副詞（両方） 副：副詞 el副：副詞（el付加形） 格：格詞 純：純詞（両方） 感：感動詞 */

/* 2013/07/21
    that_clause なし：3 shift/reduce, 4 reduce/reduce
                あり：6 shift/reduce, 11 reduce/reduce
    objに動詞句?あり：12 shift/reduce, 13 reduce/reduce*/

preposition_d : SON | YAN | TAL | MAN
/* manやmilには［文頭純詞］はないがalmanにはある */
/* mil ket siina ~ は文頭純詞？ 理由格のみの文？ */
preposition1 : A | I | IM | OK | KON | KOKKO | KA | OL | XEL | LEX
            | SOL | YUL | PREP | PREP_N
preposition : preposition_d {strcpy($$,"格 ");}
            | preposition1 {strcpy($$,"格 ");}


personal_pronoun : HUTUUNOHITO 
                /* 限定詞にならない？ */
pronoun : personal_pronoun
        /* 限定詞にならない？ */
determiner_pre : ALL | SOME | PARTICULAR | ANY | WHICH | NOBODY | WHO | WHAT | WHOEVER | WHATEVER /*| ak*/
                | WATASI | WATASIRA | ANATA | ANATARA | KARE | KARERA | ANOHITO | ANOHITORA
                | KORE | KORERA | LE | ARERA
                /* 限定詞かもしれないし代名詞かもしれない */
determiner_post : WATASINO | WATASIRANO | ANATANO | ANATARANO | KARENO | KARERANO | ANOHITONO | ANOHITORANO
                | KORENO | KORERANO | ARENO | ARERANO
                /* 限定詞かもしれないし代名詞かもしれない */
possessive_clause : E noun_phrase {sprintf($$,"接 %s",$2);}
                    | T_ noun_phrase {sprintf($$,"接'%s",$2);}
                    /*| E clause | T_ clause*/

adj_pre : CA | ADJ_PRE
noun_word : NOUN {strcpy($$,"名 ");}
            | pronoun {strcpy($$,"代 ");}
            | UNKNOWN {strcpy($$,"名 ");}
noun_phrase1a : noun_word {strcpy($$,$1);}
            | ADJ_PRE_N {strcpy($$,"名 ");}
            | determiner_pre {strcpy($$,"代 ");}
            | ADJ_PRE_N noun_word {sprintf($$,"前形 %s",$2);}
            | determiner_pre noun_word {sprintf($$,"代 %s",$2);}
            | determiner_pre ADJ_PRE_N {strcpy($$,"代 名 ");}
            | determiner_pre ADJ_PRE_N noun_word {sprintf($$,"代 前形 %s",$3);}
            | adj_pre noun_phrase1a {sprintf($$,"前形 %s",$2);}
            | CA PREP {sprintf($$,"前形 固？ ");}  /* 後ろの語が固有名詞であることを示す用法 */
            | CA VERB {sprintf($$,"前形 固？ ");}
            | CA VERB_I {sprintf($$,"前形 固？ ");}
noun_phrase1b : PREP_N {strcpy($$,"名 ");}
            | adj_pre noun_phrase1b {sprintf($$,"前形 %s",$2);}
/* determiner_pre PREP_Nの並びは「まさにその、（格詞としての）上」みたいな？とりあえずありえないとする */
noun_phrase1c : determiner_post {strcpy($$,"代 ");}
            /*| ADJ_PRE_N determiner_post {sprintf($$,"前形 代 ");}*/
            | adj_pre noun_phrase1c {sprintf($$,"前形 %s",$2);}
noun_phrase2a : noun_phrase1a {strcpy($$,$1);}
            | noun_phrase1c {strcpy($$,$1);}
            | noun_phrase2a ADJ {sprintf($$,"%s形 ",$1);}
            | noun_phrase2a ADJ_D {sprintf($$,"%s形 ",$1);}
            | noun_phrase2a determiner_post {sprintf($$,"%s代 ",$1);}
/* adjがdeterminer_postより前と決まっているのかもしれないが */
noun_phrase2b : noun_phrase1b {strcpy($$,$1);}
            | noun_phrase2b ADJ {sprintf($$,"%s形 ",$1);}
            | noun_phrase2b ADJ_D {sprintf($$,"%s形 ",$1);}
/* PREP_N determiner_postの並びが「私のものである上」ということもないだろうから除外 */
noun_phrase3 : noun_phrase2a {strcpy($$,$1);}
            | noun_phrase2b {strcpy($$,$1);}
noun_phrase : noun_phrase3 %prec REDUCE {strcpy($$,$1);}
            | noun_phrase3 possessive_clause {sprintf($$,"%s%s",$1,$2);}
            | noun_phrase3 noun_appositive {sprintf($$,"%s%s",$1,$2);}
            | noun_phrase3 FALA NUMBER {sprintf($$,"%s%s%s",$1,$2,$3);}
            | noun_phrase CONJUNCTION noun_phrase {sprintf($$,"%s接 %s",$1,$3);}
            | noun_phrase that_clause {sprintf($$,"%s%s",$1,$2);}
adjective_phrase : ADJ {strcpy($$,"形 ");}
                | ADJ_D {strcpy($$,"形 ");}
                | adjective_phrase ADVERB {sprintf($$,"%s副 ",$1);}
                | adjective_phrase CONJUNCTION adjective_phrase {sprintf($$,"%s接 %s",$1,$3);}
noun_appositive : DEL noun_phrase {sprintf($$,"=接 %s",$2);}
                /*| COMMA noun_word {sprintf($$,"=, %s",$2);}*/
                | CA noun_phrase {sprintf($$,"=前形 %s",$2);}
                /*| CA ADJ_PRE_N {sprintf($$,"=前形 名");}*/

/* 代詞の形容詞用法をとりあえず限定詞determinerと呼んでいる */

verb1 : VERB {strcpy($$,"動 ");}
    | VERB_I {strcpy($$,"動 ");}
    | UNKNOWN {strcpy($$,"動 ");}
verb2 : ADVERB_PRE verb1 {sprintf($$,"法 %s",$2);}
    | ADVERB_PRE verb2 {sprintf($$,"法 %s",$2);}
verb3 : verb2 {strcpy($$,$1);}
    | verb1 ADVERB_POST {sprintf($$,"%s法 ",$1);}
    | verb1 ADVERB_POST_D {sprintf($$,"%s法 ",$1);}
    | verb1 ADVERB_TENSE {sprintf($$,"%s法 ",$1);}
    | verb3 ADVERB_POST {sprintf($$,"%s法 ",$1);}
    | verb3 ADVERB_POST_D {sprintf($$,"%s法 ",$1);}
    | verb3 ADVERB_TENSE {sprintf($$,"%s法 ",$1);}
verb4 : verb3 {strcpy($$,$1);}
    | verb1 adverb {sprintf($$,"%s%s",$1,$2);}
    | verb4 adverb {sprintf($$,"%s%s",$1,$2);}
verb : verb1 {strcpy($$,$1);fprintf(stderr, "verb ");}
    | verb4 %prec REDUCE {strcpy($$,$1);fprintf(stderr, "verb ");}


be_verb : ET {strcpy($$,"繋 ");fprintf(stderr, "be_verb ");}
        | DE {strcpy($$,"繋 ");fprintf(stderr, "be_verb ");}
        | ET_TENSE {strcpy($$,"繋 ");fprintf(stderr, "be_verb ");}
        | ADVERB_TENSE {strcpy($$,"繋 ");fprintf(stderr, "be_verb ");}
        | ES {strcpy($$,"繋 ");fprintf(stderr, "be_verb ");}  /* es(1) */

/* UNKNOWN ADVERB_TENSEの並びはsubj be_verbと考える→都合によりnoun_word: UNKNOWNより後にverb1: UNKNOWN */
/* 2 reduce/reduce */

subj : noun_phrase {strcpy($$,$1);fprintf(stderr, "subj ");}
obj : noun_phrase %prec REDUCE {strcpy($$,$1);fprintf(stderr, "obj ");}
    | adjective_phrase %prec REDUCE {strcpy($$,$1);fprintf(stderr, "obj ");}  /* naのための応急処置 */
    | that_clause3b {strcpy($$,$1);fprintf(stderr, "obj ");}  /* siina xidia potのための応急処置 */
    | LPAREN sentence_b RPAREN {sprintf($$,"（ %s） ",$2);fprintf(stderr, "obj ");}
compl : noun_phrase %prec REDUCE {strcpy($$,$1);fprintf(stderr, "compl ");}
        | adjective_phrase {strcpy($$,$1);fprintf(stderr, "compl ");}
trans_adjunct : preposition1 noun_phrase {sprintf($$,"格 %s",$2);fprintf(stderr, "adjunct ");}
            | FALA NUMBER {sprintf($$,"%s%s",$1,$2);fprintf(stderr, "adjunct ");}
            | trans_adjunct adjunct {sprintf($$,"%s%s",$1,$2);}

adjunct : preposition noun_phrase %prec REDUCE {sprintf($$,"%s%s",$1,$2);fprintf(stderr, "adjunct ");}
        | preposition that_clause3a %prec REDUCE {sprintf($$,"%s%s",$1,$2);fprintf(stderr, "adjunct ");}
        | preposition LPAREN that_clause3a RPAREN %prec REDUCE {sprintf($$,"%s（ %s） ",$1,$3);fprintf(stderr, "adjunct ");}
        | FALA NUMBER {sprintf($$,"%s%s",$1,$2);fprintf(stderr, "adjunct ");}
/* verb後のPREP_N PREP_Nの並びはadjunct？1語objの後のadjunct？ */
/* verb前のPREP_N PREP_Nの並びはadjunctとしなければいけない */
/* 1 reduce/reduce */
/* verb後のPREP_N UNKNOWNの並びはadjunctのはず（仮定：UNKNOWNはadjectiveではない、文脈：UNKNOWNはverbである可能性が低い） */
/* verb前のPREP_N UNKNOWNの並びはUNKNOWNがnounかverbか不明であるが */
/* 1 reduce/reduce */
/* 上のPREP_N PREP_Nと独立に制御するには定義の並び順では無理 */
/* subjかtrans_adjunctかを識別するのとobjかadjunctかを識別するのが似ているので状態がまとめられてしまう、ダミー条件追加の必要あり */
/* 現時点ではすべて最初のPREP_Nからadjunctであることにして、定義の並び順で対処 */

adverb : ADVERB {strcpy($$,"副 ");fprintf(stderr, "adverb ");}
        | EL_ADVERB {strcpy($$,"el副 ");fprintf(stderr, "adverb ");}
el_adverb : EL_ADVERB {strcpy($$,"el副 ");fprintf(stderr, "adverb ");}

/* sentence_bではverbからVERB_IとUNKNOWNを除外 */
sv : subj verb {sprintf($$,"%s%s",$1,$2);}
    | trans_adjunct verb {sprintf($$,"%s%s",$1,$2);}  /* 倒置や強調 */
    | VERB {strcpy($$,"動 ");fprintf(stderr, "verb ");}  /* 命令など */  /* VERB_IとUNKNOWNを除外 */
    | verb4 {sprintf($$,"%s",$1);fprintf(stderr, "verb ");}  /* 命令など */
/* verb前のdeterminer_pre UNKNOWNの並びはUNKNOWNがnounかverbか不明である */
/* 1 shift/reduce */

sentence_b1 : sv obj {sprintf($$,"%s%s",$1,$2);}  /* PREP_Nの識別のためにobjとadjunctを横並びにしている */
            | sv adjunct {sprintf($$,"%s%s",$1,$2);}
            /*| sv adverb {sprintf($$,"%s%s",$1,$2);}   直接並んでいたadverbはすべてverbに取り込んである */
            | subj be_verb compl {sprintf($$,"%s%s%s",$1,$2,$3);}
sentence_b2 : sentence_b1 {sprintf($$,"%s",$1);}
            | sentence_b2 adjunct {sprintf($$,"%s%s",$1,$2);}
            | sentence_b2 el_adverb {sprintf($$,"%s%s",$1,$2);}
sentence_b : sentence_b2 {sprintf($$,"%s",$1);}
            | subj {sprintf($$,"%s",$1);}
            | sv {sprintf($$,"%s",$1);}

/* that_clauseではverbからUNKNOWNを除外 */
verb_that : VERB {strcpy($$,"動 ");fprintf(stderr, "verb ");}
        | VERB_I {strcpy($$,"動 ");fprintf(stderr, "verb ");}
        | verb4 %prec REDUCE {strcpy($$,$1);fprintf(stderr, "verb ");}
that_clause1a : subj verb_that obj {sprintf($$,"%s%s%s",$1,$2,$3);}
            | subj verb_that adjunct {sprintf($$,"%s%s%s",$1,$2,$3);}
that_clause2a : that_clause1a %prec REDUCE {sprintf($$,"%s",$1);}
            | that_clause2a adjunct {sprintf($$,"%s%s",$1,$2);}
            | that_clause2a adverb {sprintf($$,"%s%s",$1,$2);}
that_clause3a : that_clause2a %prec REDUCE {sprintf($$,"%s",$1);}
            | subj verb_that %prec REDUCE {sprintf($$,"%s%s",$1,$2);}
that_clause1b : verb_that obj {sprintf($$,"%s%s",$1,$2);}
            | verb_that adjunct {sprintf($$,"%s%s",$1,$2);}
that_clause2b : that_clause1b %prec REDUCE {sprintf($$,"%s",$1);}
            | that_clause2b adjunct {sprintf($$,"%s%s",$1,$2);}
            | that_clause2b el_adverb {sprintf($$,"%s%s",$1,$2);}
that_clause3b : that_clause2b %prec REDUCE {sprintf($$,"%s",$1);}
            | verb_that %prec REDUCE {sprintf($$,"%s",$1);}
that_clause : L_ that_clause3a {sprintf($$,"接'%s",$2);}
            | L_ that_clause3b {sprintf($$,"接'%s",$2);}
            | L_ that_clause3a preposition {sprintf($$,"接'%s%s",$2,$3);}
            | LE that_clause3a {sprintf($$,"接 %s",$2);}
            | LE that_clause3b {sprintf($$,"接 %s",$2);}
            | LE that_clause3a preposition {sprintf($$,"接 %s%s",$2,$3);}

disjunct : DISJUNCT {strcpy($$,"純 ");fprintf(stderr, "disjunct ");}
        | ADVERB_POST_D {strcpy($$,"純 ");fprintf(stderr, "disjunct ");}
        | ES {strcpy($$,"純 ");fprintf(stderr, "disjunct ");}  /* es(2) */
        | preposition_d {strcpy($$,"純 ");fprintf(stderr, "disjunct ");}
        | ADJ_D {strcpy($$,"純 ");fprintf(stderr, "disjunct ");}

/* 文末にある単語が文末純詞かどうかを文法から判定できるか？ */
gobi : DESUNE {strcpy($$,"純 ");fprintf(stderr, "gobi ");}
    | KANAA {strcpy($$,"純 ");fprintf(stderr, "gobi ");}
    | DAYO {strcpy($$,"純 ");fprintf(stderr, "gobi ");}
    | DESUKA {strcpy($$,"純 ");fprintf(stderr, "gobi ");}
    | GOBI {strcpy($$,"純 ");fprintf(stderr, "gobi ");}

interj : INTERJECTION {strcpy($$,"感 ");fprintf(stderr, "interj ");}
        | VERB_I {strcpy($$,"感 ");fprintf(stderr, "interj ");}
        /*| UNKNOWN {strcpy($$,"感 ");fprintf(stderr, "interj ");}*/

/* UNKNOWN COMMAはとりあえず感動詞、UNKNOWN PERIODはとりあえず名詞 */
sentence : /*UNKNOWN UNKNOWN PERIOD            {sprintf($$,"? ? . ");fprintf(stderr, "\n%s\n",$$);}*/
         sentence_b PERIOD             {sprintf($$,"%s. ",$1);fprintf(stderr, "\n%s\n",$$);}
        | disjunct sentence_b PERIOD    {sprintf($$,"%s%s. ",$1,$2);fprintf(stderr, "\n%s\n",$$);}
        | sentence_b gobi PERIOD        {sprintf($$,"%s%s. ",$1,$2);fprintf(stderr, "\n%s\n",$$);}
        | disjunct sentence_b gobi PERIOD {sprintf($$,"%s%s%s. ",$1,$2,$3);fprintf(stderr, "\n%s\n",$$);}
        | interj COMMA                  {sprintf($$,"%s, ",$1);fprintf(stderr, "\n%s\n",$$);}
        | UNKNOWN COMMA                 {sprintf($$,"感 , ");fprintf(stderr, "interj \n%s\n",$$);}
        | interj PERIOD                 {sprintf($$,"%s. ",$1);fprintf(stderr, "\n%s\n",$$);}
        | disjunct gobi PERIOD          {sprintf($$,"%s%s. ",$1,$2);fprintf(stderr, "\n%s\n",$$);}
        | disjunct disjunct gobi PERIOD {sprintf($$,"%s%s%s. ",$1,$2,$3);fprintf(stderr, "\n%s\n",$$);}  /* lala es yundiへの対応 */
        | gobi PERIOD                   {sprintf($$,"%s. ",$1);fprintf(stderr, "\n%s\n",$$);}
        | error PERIOD                  {sprintf($$,"error . ");fprintf(stderr, "\n%s\n",$$);}

paragraph : sentence
        | paragraph sentence

%%
int main(void)
{
	return (yyparse());
}

void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
}
