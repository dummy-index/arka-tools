
/* cf. http://www.asahi-net.or.jp/~wg5k-ickw/html/online/flex-2.5.4/flex_6.html */

%{
#include <stdio.h>
#include <string.h>
#include "arka-lalr.tab.h"      /* これはBisonにより生成される */

#define TRUE  1
#define FALSE 0

#define copy_and_return(token_type) \
         { \
             strcpy(yylval.name,yytext);\
             return(token_type); \
         }

int yylexlinenum = 0;  /* 行数カウント用 */
%}

%%
   /* 字句解析ルールがここから始まる */

AN|DER|DAI|AMI|MEN|EMA|NOEL|GAN                copy_and_return(WATASI)  /* 多義 an(5) ［副詞］［南方］en */
YUNA|NON|NOA|NANA|MEID                         copy_and_return(WATASI)  /*  */
ANT|DENT|DAID|AMIT|MENAL|EMIL|NOTTE|GANET      copy_and_return(WATASINO)
YUNOL|NOAN|NOETT|NANATU|MEIDEN                 copy_and_return(WATASINO)
ANS|ORFEN|CUUD|SEAN|LIIA|POLTE|XENON|KALAS     copy_and_return(WATASIRA)
KOLET|LENA|LENOA|NANASSE|XELIS                 copy_and_return(WATASIRA)
ANTES|ORGANT|CUUDIS|SEANT|LIIAN|POLTON|XENOAN|KALDES   copy_and_return(WATASIRANO)
EKOL|LENAN|LENOAN|NANASSETU|XELIEN                     copy_and_return(WATASIRANO)
TI|DIS|BAZ|TOL|SALA|TWA|XIAN|BEG               copy_and_return(ANATA)
MOE|TYU|TIAM|MINA|HALKA                        copy_and_return(ANATA)
TIIL|DIN|BAZEL|TOLTE|SALEN|TWAL|XIANT|BEGET    copy_and_return(ANATANO)
MOEN|TUAN|TIAMET|MINATU|HALKAN                 copy_and_return(ANATANO)
TIIS|SEDIS|BCAND|FLENT|SETYU|KLANS|TELUL|WALET copy_and_return(ANATARA)
FELIE|LILIS|LETIAM|MINASSE|ISFEL               copy_and_return(ANATARA)
TIILES|SEDIN|BCENDI|FLANDOL|SETUT|KLANSEN|TELET|WOLDEN copy_and_return(ANATARANO)
FELIAL|LILIN|LETIANT|MINASSETU|ISFELIA                 copy_and_return(ANATARANO)
KOK|KAAK|DAXXA|RANXEL|XATTA|SOONA|SANNA|YATTE  copy_and_return(DESUNE)
AXEM|SETE|KOTTA|NANO|MALIA                     copy_and_return(DESUNE)
SEI|DAANA|ZOR|FIXET|SIVAN|YUNDI|ENXE|INDI      copy_and_return(KANAA)
TUUYU|EYO|ANSEM|MILEI|NYANNYA                  copy_and_return(KANAA)
TISEE|DIZMAL|LAGA|FLENZEL|RAMMA|WEEZE|XIIMA|BELZE      copy_and_return(DAYO)
LINOA|TISSE|SANTE|SIAN|YUULIA                          copy_and_return(DAYO)
MIA                  copy_and_return(DESUKA)
MYU                  copy_and_return(GOBI)
LU           copy_and_return(KARE)
LUUT         copy_and_return(KARENO)
LUUS|LUAN    copy_and_return(KARERA)
LUUTES|LUANT copy_and_return(KARERANO)
LA           copy_and_return(ANOHITO)
LAAT         copy_and_return(ANOHITONO)
LAAS|LAIN    copy_and_return(ANOHITORA)
LAATES|LAINT copy_and_return(ANOHITORANO)
TU           copy_and_return(KORE)
TUUL         copy_and_return(KORENO)
TUUS|TUTU    copy_and_return(KORERA)
TUULES|TUTUL copy_and_return(KORERANO)
LE           copy_and_return(LE)
LEET         copy_and_return(ARENO)
LEES|LELE    copy_and_return(ARERA)
LEETES|LEENT copy_and_return(ARERANO)
EL      copy_and_return(HUTUUNOHITO)
IL      copy_and_return(ALL)
VEI     copy_and_return(SOME)
XE      copy_and_return(PARTICULAR)
FI      copy_and_return(ANY)
WEL     copy_and_return(WHICH)
YUU     copy_and_return(NOBODY)
NE      copy_and_return(WHO)
TO      copy_and_return(WHAT)  /* 疑問の代動詞にもなる */
NETAL   copy_and_return(WHOEVER)
TOTAL   copy_and_return(WHATEVER)
E       copy_and_return(E)
T['-][a-z]+ {strcpy(yylval.name,"t'-");yyless(2);return(T_);}
L['-][a-z]+ {strcpy(yylval.name,"l'-");yyless(2);return(L_);}
CA      copy_and_return(CA)
DEL     copy_and_return(DEL)
FALA    copy_and_return(FALA)
  /* soa ［代詞］［形容詞］そんな 名詞には前置。形容詞などには後置。 */
  /* yua ［代詞］［形容詞］あんな 名詞には前置。形容詞などには後置。 */
SOL     copy_and_return(SOL)
YUL     copy_and_return(YUL)
A|AL    copy_and_return(A)  /* 多義 al  */
I|IT    copy_and_return(I)  
IM      copy_and_return(IM)  /* ［名詞］時点、時間、頃 */
OK|XED  copy_and_return(OK)
KON|VIT copy_and_return(KON)
KOKKO|TATTA copy_and_return(KOKKO)
KA      copy_and_return(KA)
ALMAN|MAN|MIL copy_and_return(MAN)  /* alman ［格詞］［文頭純詞］ */
OL      copy_and_return(OL)
XEL     copy_and_return(XEL)
LEX     copy_and_return(LEX)
  /* ento ～なほど */
  /* "［格詞］～の"で全文検索 */
pot|tant|seel|mes|lot|leks     copy_and_return(PREP_N)  /* 内外中心周囲内側外側 */
ipot|aseel     copy_and_return(PREP)
sa|xi|lank|mik|sanl|hal|mol     copy_and_return(PREP_N)  /* 前後左右横上下 sanl左右xtar上下ink前後だがsanl以外は格詞にならない */
isa|alank|amik|ahal     copy_and_return(PREP)  /* amik(2) ［音楽］カラオケ */
axti|alas|fleu|xiar     copy_and_return(PREP_N)  /* 東西南北 */
frem|flon|amox     copy_and_return(PREP)  /* 近遠隣 */
afrem|alamox     copy_and_return(PREP)
hete|yulo|lit|rak|lie|looz     copy_and_return(PREP_N)  /* 裏表限度内限度外奥端 */
arak|alie     copy_and_return(PREP)  /* alie(1) ［被服］アリエ */
fol|kor|kos|xalt|ist     copy_and_return(PREP_N)  /* 期間方向方法観点代わり */
kolset|milgaal|fiina     copy_and_return(PREP)  /* おかげせいため */
ati|du|sas|emo|pask|fixt     copy_and_return(PREP_N)  /* 程度量順番ソース過程結果 emoとfixtについてあとで確認 */
lana     copy_and_return(PREP_N)  /* ［格詞］～するために ［動詞］yulを狙う ［名詞］目標 */

XOM|SON|SOC copy_and_return(SON)
SEE|YAN     copy_and_return(YAN)
HAYU        copy_and_return(YAN)
DEE|TET     copy_and_return(TAL)
TAL|TAC     copy_and_return(TAL)

ET      copy_and_return(ET)  /* 繋辞 */
DE      copy_and_return(DE)  /* 否定の繋辞（男性） 女性はte */
AT|OR|IK    copy_and_return(ET_TENSE) /* 過去進行完了 時制の繋辞（語尾が独り立ち） */
ES          copy_and_return(ES) /* 継続相の繋辞（語尾が独り立ち） es(2) ［文頭純詞］なぜ */

SO      copy_and_return(VERB)  /* 代動詞 */
AR|IS   copy_and_return(VERB)  /* 死生動詞 */

RE|REN|MIR|SANT|MYUN      copy_and_return(ADVERB_PRE) /* 命令～依頼 */
DEN|TE|FON|LEU            copy_and_return(ADVERB_PRE) /* 禁止命令 */
EN                        copy_and_return(ADVERB_PRE) /* 否定 */
_AT|_OR|_IK               copy_and_return(ADVERB_POST) /* 過去進行完了 */
_ES                       copy_and_return(ADVERB_POST) /* 継続相 es(2) ［文頭純詞］なぜ */
SES|TUR|SIL|LUT           copy_and_return(ADVERB_TENSE) /* 経験過去現代未来通時 時制の繋辞にもなる */ /* ［名詞］［形容詞］過去現在未来、［遊離副詞］［形容詞］常に */
YU                        copy_and_return(ADVERB_POST) /* 受身 */
LAN|RIN|SEN|VIL           copy_and_return(ADVERB_POST) /* したいしたくないできるできない */
FLEN|XIN|DAS|XIIT         copy_and_return(ADVERB_POST) /* 許可禁止提案勧誘 */
FAL                       copy_and_return(ADVERB_POST_D) /* 義務　［文頭純詞］［名詞］ */
DIA             copy_and_return(ADVERB_POST) /* [rente]das ［名詞］まぼろし ［形容詞］無形の */
XIR|BAS         copy_and_return(ADVERB_POST) /* 必要不必要　［動詞］［形容詞］ */
FONL            copy_and_return(ADVERB_POST) /* しないほうがよい　［動詞］［名詞］避ける */
HAO             copy_and_return(ADVERB_POST_D) /* 当然　［文頭純詞］［名詞］ */
VAN             copy_and_return(ADVERB_POST) /* ～する、～しよう。意思・意志 */
ATU         copy_and_return(ADVERB) /* a ka tuの略 ［名詞］ここ  */
LYU         copy_and_return(ADVERB) /* lyu ［名詞］あそこ  */
LEIZ|KALIS|KAL  copy_and_return(ADVERB) /* 程度 弱 ［副詞］［形容詞］ kal(2) 刀 kal(3)=kalzas 悪心カルザス、アルミヴァの６番目 */
YUE|SELTE|TAR   copy_and_return(ADVERB) /* 程度 中 ［副詞］［形容詞］  */
TIN|TINKA|VART  copy_and_return(ADVERB) /* 程度 強 ［副詞］［形容詞］  */
leizel|kalisel|kalel copy_and_return(EL_ADVERB)
yuel|tar            copy_and_return(EL_ADVERB)  /* seltelはseltの副詞形っぽくなる */
tinel|tinkal|vartel copy_and_return(EL_ADVERB)
AAXA|VADEN|KILA     copy_and_return(ADVERB_PRE) /* 確率 低 ［遊離副詞］［形容詞］ aaxa ［感動詞］ */
XIEL|GALD|XALET     copy_and_return(ADVERB_PRE) /* 確率 中 ［遊離副詞］［形容詞］ gald ［経済］コイン */
KAMIL|VILOT|ALUUT   copy_and_return(ADVERB_PRE) /* 確率 高 ［遊離副詞］［形容詞］ (前置|elをつけて後置)(名詞や形容詞につくときはelなしで後置？) */
aaxal|vadenel|kilal     copy_and_return(EL_ADVERB) /* aaxal ［天文］ ［組み数字］６/８ */
xielel|galdel|xaletel   copy_and_return(EL_ADVERB)
kamilel|vilotel|aluutel copy_and_return(EL_ADVERB)
FRAL    copy_and_return(ADVERB)  /* ［名詞］［形容詞］［副詞］ 代詞ilの影響で前置することもある */

YUN         copy_and_return(ADJ)  /* ［格詞］～であるかのようだ［動詞］solはyulであるかのようだ［副詞］～しそうな［文末純詞］～であるかのような */
YUNEN       copy_and_return(CONJUNCTION)  /* ［接続詞］ */
O|ONT|AZ|UL copy_and_return(CONJUNCTION)  /* ［接続詞］ 強選言azは「～かどうか」の意味あり */

TIE     copy_and_return(LPAREN)
TUN     copy_and_return(RPAREN)

  /* マルバツ系 */
tia copy_and_return(ADJ)  /* 正しい ［名詞］正解 */
evit copy_and_return(ADJ)  /* 間違った */
ya|tee copy_and_return(INTERJECTION)
ax copy_and_return(INTERJECTION)  /* ［感動詞］［形容詞］はい ［感動詞］ぜひ ［法副詞］～すべき */
passo|ilpasso copy_and_return(INTERJECTION)  /* 大丈夫 */
len copy_and_return(ADJ_D)  /* ［文頭純詞］やはり［形容詞］予想通り */
xan copy_and_return(ADJ_D)  /* ［名詞］［形容詞］［文頭純詞］［副詞］本当 ［文末純詞］［rente］xa */
aal copy_and_return(ADJ_D)  /* ［形容詞］［文頭純詞］［副詞］特別 */
leim copy_and_return(ADJ_D)  /* ［形容詞］［文頭純詞］ふつう［数学］自然数 */

luna|kei|ke copy_and_return(VERB)  /* 来る追う行く luna,ke ［副詞］～しに来る/いく */
leev copy_and_return(VERB_I)  /* 去る */
/* elf ［動詞］逃げる ［法副詞］～しようとしない … */
xen|axt|fit|yol|alk copy_and_return(VERB)  /* 食べる書くあげる使う助ける */
in|ter|toan|oj|xoit|navn copy_and_return(VERB)  /* 5+1感 */
xa copy_and_return(VERB)  /* yul（場所）にいる・ある ［文末純詞］～だ ［法副詞］状態動詞の無相 */
mi copy_and_return(VERB)  /* yulにいない、ない */
lef|luk copy_and_return(VERB)  /* 走る歩く */
xook|miks|xax copy_and_return(VERB)  /* 会話する歌う教える */
na copy_and_return(VERB)  /* ［動詞］感じる ［名詞］心、気持ち */
hom|deyu|met|kim|isk copy_and_return(VERB)  /* 開け閉め落とす曲げる読む */
sef|mix copy_and_return(VERB)  /* 授受 */
axo|bad|xim|ret copy_and_return(VERB)  /* 遊ぶ叩く得る頼む */
siina|tiia copy_and_return(VERB)  /* siina 好き［形容詞］お気に入りの［副詞］（siinan）好んで［文末純詞］～してくれる（好意） tiia 愛する［名詞］［形容詞］ */
mok copy_and_return(VERB)  /* 眠らせる、眠る */
atm|tau copy_and_return(VERB)  /* 売買 */
dil|alk copy_and_return(VERB)  /* 邪魔手伝 */
set copy_and_return(VERB)  /* 殺 */

xidia copy_and_return(VERB_I)  /* ［感動詞］おやすみ［rente］［動詞］mok */
tua copy_and_return(VERB_I)  /* ［感動詞］はい、はいどうぞ［動詞］差し出す */
seere|seeretis copy_and_return(VERB_I)  /* （頼んだ）［感動詞］［動詞］［文末純詞］ */
sent|sentant copy_and_return(VERB_I)  /* （頼んでない）［感動詞］［動詞］［普通動名詞］ */

tan copy_and_return(ADJ)  /* ～も */
atx|yaamo|kai|lis copy_and_return(ADJ)  /* lis(2) ［人名］クリスの略称 */
sort|diit|melt|hart copy_and_return(ADJ)  /* 寒～熱 いずれもADJかVERB */
tax|demi|di|kalo copy_and_return(ADJ)  /* 速い遅い多い少ない kalo［感動詞］おしい */
vien|ivn copy_and_return(ADJ)  /* 強い弱い */
vem copy_and_return(ADJ)  /* ［名詞］(na)怖い［形容詞］怯えた［形容詞］（vemanで）怖い */
    /* 冷たいをナすると言うのにsortの項に［名詞］がない→当面はobjに［形容詞］が来れるようにする */
    /* become, get, feel and seem in English (these may also be called "semi-copulas" or "pseudo-copulas"). (Wikipedia) */
alxa copy_and_return(ADJ)  /* ～というものは */
har|ver copy_and_return(ADJ)  /* 赤黒 */
gek copy_and_return(ADJ)  /* 丸い ［名詞］球、弾 */

tanel copy_and_return(EL_ADVERB)
atxel|yaamol|kail|lisel copy_and_return(EL_ADVERB)  /* kail ［動詞］収穫する  */
sortel|diitel|meltel|hartel copy_and_return(EL_ADVERB)
taxel|demil copy_and_return(EL_ADVERB)

    /* 前置で全文検索、形容詞を抽出（たいてい名詞にもなる） */
fe|fian copy_and_return(ADJ_PRE)
    /* 前基後序ルール */
fou|toal copy_and_return(ADJ_PRE)
    /* 基数にしか使わないので前置 */
togal copy_and_return(ADJ_PRE)
    /* 地学政治交通建築シリーズ 前置 */
ardu|delk|erei|erke|kad|kalto|karx|klik|lizl|moet|reis|taka|tier|wal|xial copy_and_return(ADJ_PRE)
gaavlop|galt|lopn|pafi copy_and_return(ADJ_PRE_N)
    /* 呼称シリーズ①前置 */
dain|rau copy_and_return(ADJ_PRE_N)
ert|saar|deem|adel|selest|sart copy_and_return(ADJ_PRE_N)  /* 流れから言うとmirokはここ */
midyussou|milan|neeme|rau copy_and_return(ADJ_PRE_N)
    /* 呼称シリーズ②後置 */
liij copy_and_return(ADJ)
    /* 呼称シリーズ③両方（たいてい名詞にもなる）（原則：苗字には前置、名前には後置） */
dyussou|san|sou|liiz copy_and_return(ADJ)  /* san(2)～さん san(1)式、数式 */
lua|rsiila|sensee copy_and_return(ADJ)  /*  */
xanxa|daiz|rsiila|felan|salan copy_and_return(ADJ)  /* felan以降はっきりしない salanは呼びかけでは後置 */

    /* ［文頭純詞］で全文検索、［レベル］１で格詞とか形副詞とかでないもの抽出 ［感動詞］［文頭純詞］となっているものは［文頭純詞］として扱う */
aca|ak|ala|alson|am copy_and_return(DISJUNCT)  /* ak ［代詞］どのような、どんな 前置 ［文頭純詞］［感動詞］ */
dee|diin|dina|hai copy_and_return(DISJUNCT)
kaat|lala|lulu|pin copy_and_return(DISJUNCT)
    /* om 文中でも使える tail(1) ［名詞］［形容詞］Ｔ字型 */

artan|lont|diax|melsel copy_and_return(NOUN)
pof|xakl|tokl|koka|hat|etek|teks|elen|skil copy_and_return(NOUN)
arka|hacm|kaz|melk copy_and_return(NOUN)
omi|bikt|kuki|ez|lonz|moka|mokt|kove|bal|aks copy_and_return(NOUN)
nabi|fapx|xaki|gimbelt|kil|gels|kese copy_and_return(NOUN)
xisa|hia|reb|ane|rebane copy_and_return(NOUN)
fia|kaxa|lei|est copy_and_return(NOUN)  /* fia ［名詞］世界［形容詞］有形の⇔dia */
atolas|arbazard|arna copy_and_return(NOUN)
osn|main|aad|las|tak|luwa|zam|eel|ins|tem|toa|kuo copy_and_return(NOUN)  /* ins ［動詞］見かける */
pap|er|kuto|mel|tems copy_and_return(NOUN)
siinaol|sovmel copy_and_return(NOUN)
hac|eld copy_and_return(NOUN)
obo|esmit|amo|yuli|kaan copy_and_return(NOUN)
vik|min copy_and_return(NOUN)  /* ［名詞］［形容詞］男女 */
etto|altfian|bekka|anse copy_and_return(NOUN)
miik|lisik copy_and_return(NOUN)
kum|oma|ket copy_and_return(NOUN)
ping|seron copy_and_return(NOUN)

  /* xidiaなどの［感動詞］［動詞］はVERB_I */
teo|melka|"al karte"|soonoyun copy_and_return(INTERJECTION)
ou|ag|myep|kyaa|vantant copy_and_return(INTERJECTION)
"yuu aalel" copy_and_return(INTERJECTION)  /* 【成句】これといってない */
anestol|alkyunk copy_and_return(INTERJECTION)
    /* ［感動詞］で全文検索、［レベル］１抽出…多い */
"a ha"|"a ya"|aag|ag|ak copy_and_return(INTERJECTION)  /* ak ［文頭純詞］どうやって、どのように、どのくらい［代詞］どのような、どんな*/
"al avan"|"al diar"|"al haizen" copy_and_return(INTERJECTION)
alt|altoo|arkas|arte copy_and_return(INTERJECTION)  /* alt ［名詞］他、もうひとつ［形容詞］ほかの、もう一つの arte ［名詞］アルテ(神)*/

","                         copy_and_return(COMMA);
[.?!]+                      copy_and_return(PERIOD);
[0-9']+                     copy_and_return(NUMBER);
 /*"\n"                        yylexlinenum++; return(NEWLINE);*/
[a-z]+  {strcpy(yylval.name,yytext);fprintf(stderr,"UNKNOWN:%s ",yytext);return(UNKNOWN);}

%%
