*command     seg subpa bo eq
form         qkr 00101 01 0001FFFFFFFF
form4        qkr 00102 01 FFFFFFFFFFFF
decode4      qkr 00103 01 FFFFFFFFFFFF
vc01         qkr 00201 01 0205FFFFFFFF
vc02         qkr 00202 01 0205FFFFFFFF
vc03         qkr 00203 01 0205FFFFFFFF
vc04         qkr 00204 01 0205FFFFFFFF
vc05         qkr 00205 01 0205FFFFFFFF
vc06         qkr 00206 01 0205FFFFFFFF
vc07         qkr 00207 01 0205FFFFFFFF
vc08         qkr 00208 01 0205FFFFFFFF
vc09         qkr 00209 01 0205FFFFFFFF
vc10         qkr 00210 01 0205FFFFFFFF
vc11         qkr 00211 01 0205FFFFFFFF
vc12         qkr 00212 01 0205FFFFFFFF
vc13         qkr 00213 01 0205FFFFFFFF
vc14         qkr 00214 01 0205FFFFFFFF
vc15         qkr 00215 01 0205FFFFFFFF
ifd          qkr 00301 01 0205FFFFFFFF
if3          qkr 00302 01 0205FFFFFFFF
mat          qkr 00401 01 FFFFFFFFFFFF
hpib         qkr 00402 01 FFFFFFFFFFFF
wx           qkr 00404 01 FFFFFFFFFFFF
wakeup       qkr 00405 01 FFFFFFFFFFFF
check        qkr 00406 01 FFFFFFFFFFFF
cal          qkr 00407 01 FFFFFFFFFFFF
antenna      qkr 00408 01 FFFFFFFFFFFF
wxcdp        qkr 00409 01 FFFFFFFFFFFF
tape         qk1 00501 01 FFFF0005FFFF
tape1        qk3 00501 01 FFFF0005FFFF
tapepos      qk1 00502 01 FFFF0005FFFF
tapepos1     qk3 00502 01 FFFF0005FFFF
tape         qk2 00511 01 FFFFFFFF0005
tape2        qk3 00511 01 FFFFFFFF0005
tapepos      qk2 00512 01 FFFFFFFF0005
tapepos2     qk3 00512 01 FFFFFFFF0005
st           qk1 00601 01 FFFF0005FFFF
st1          qk3 00601 01 FFFF0005FFFF
et           qk1 00602 01 FFFF0017FFFF
et1          qk3 00602 01 FFFF0017FFFF
rw           qk1 00603 01 FFFF0017FFFF
rw1          qk3 00603 01 FFFF0017FFFF
ff           qk1 00604 01 FFFF0017FFFF
ff1          qk3 00604 01 FFFF0017FFFF
srw          qk1 00605 01 FFFF0017FFFF
srw1         qk3 00605 01 FFFF0017FFFF
sff          qk1 00606 01 FFFF0017FFFF
sff1         qk3 00606 01 FFFF0017FFFF
rec          qk1 00607 01 FFFF0005FFFF
rec1         qk3 00607 01 FFFF0005FFFF
st           qk2 00611 01 FFFFFFFF0005
st2          qk3 00611 01 FFFFFFFF0005
et           qk2 00612 01 FFFFFFFF0017
et2          qk3 00612 01 FFFFFFFF0017
rw           qk2 00613 01 FFFFFFFF0017
rw2          qk3 00613 01 FFFFFFFF0017
ff           qk2 00614 01 FFFFFFFF0017
ff2          qk3 00614 01 FFFFFFFF0017
srw          qk2 00615 01 FFFFFFFF0017
srw2         qk3 00615 01 FFFFFFFF0017
sff          qk2 00616 01 FFFFFFFF0017
sff2         qk3 00616 01 FFFFFFFF0017
rec          qk2 00617 01 FFFFFFFF0005
rec2         qk3 00617 01 FFFFFFFF0005
reset        qkr 00701 01 FFFFFFFFFFFF
newtape      qk1 00702 01 FFFF005FFFFF
newtape1     qk3 00702 01 FFFF005FFFFF
label        qk1 00703 01 FFFF0017FFFF
label1       qk3 00703 01 FFFF0017FFFF
matload      qkr 00704 01 FFFFFFFFFFFF
mount1       qk3 00705 01 FFFF0017FFFF
newtape      qk2 00712 01 FFFFFFFF005F
newtape2     qk3 00712 01 FFFFFFFF005F
label        qk2 00713 01 FFFFFFFF0017
label2       qk3 00713 01 FFFFFFFF0017
mount2       qk3 00715 01 FFFFFFFF0017
enable       qk1 00801 01 FFFF0005FFFF
enable1      qk3 00801 01 FFFF0005FFFF
enable       qk2 00802 01 FFFFFFFF0005
enable2      qk3 00802 01 FFFFFFFF0005
decode       qkr 00901 01 FFFFFFFFFFFF
perr         qk1 00902 01 FFFF0001FFFF
perr1        qk3 00902 01 FFFF0001FFFF
parity       qk1 00903 01 00D70017FFFF
parity1      qk3 00903 01 00D70017FFFF
perr         qk2 00912 01 FFFFFFFF0001
perr2        qk3 00912 01 FFFFFFFF0001
parity       qk2 00913 01 00D7FFFF0017
parity2      qk3 00913 01 00D7FFFF0017
repro        qk1 01001 01 FFFF0001FFFF
repro1       qk3 01001 01 FFFF0001FFFF
repro        qk1 01002 01 FFFF0004FFFF
repro1       qk3 01002 01 FFFF0004FFFF
repro        qk2 01011 01 FFFFFFFF0001
repro2       qk3 01011 01 FFFFFFFF0001
repro        qk2 01012 01 FFFFFFFF0004
repro2       qk3 01012 01 FFFFFFFF0004
source       qkr 01101 01 FFFFFFFFFFFF
radecoff     qkr 01102 01 FFFFFFFFFFFF
azeloff      qkr 01103 01 FFFFFFFFFFFF
onsource     qkr 01104 01 FFFFFFFFFFFF
xyoff        qkr 01106 01 FFFFFFFFFFFF
track        qkr 01107 01 FFFFFFFFFFFF
tpi          qkr 01203 01 FFFFFFFFFFFF
tpical       qkr 01204 01 FFFFFFFFFFFF
tsys         qkr 01205 01 FFFFFFFFFFFF
tpdiff       qkr 01206 01 FFFFFFFFFFFF
tpzero       qkr 01207 01 FFFFFFFFFFFF
tpgain       qkr 01208 01 0012FFFFFFFF
tpdiffgain   qkr 01209 01 0012FFFFFFFF
caltemp      qkr 01210 01 FFFFFFFFFFFF
cable        qkr 01304 01 FFFFFFFFFFFF
pcal         qkr 01401 01 00010001FFFF
patch        qkr 01403 01 02E5FFFFFFFF
*pcals        qkr 1404 01 11
*logout       qkr 1501 01 77
op           qkr 01502 01 FFFFFFFFFFFF
fivept       qkr 01503 01 FFFFFFFFFFFF
*onoff        qkr 1504 01 FFFFFF
*pc           qkr 1505 01 FF
fsversion    qkr 01506 01 FFFFFFFFFFFF
rx           qkr 01601 01 FFFFFFFFFFFF
*head         qkr 1701 01 77
tapeform     qk1 01801 01 FFFF0017FFFF
tapeform1    qk3 01801 01 FFFF0017FFFF
tapeform     qk2 01802 01 FFFFFFFF0017
tapeform2    qk3 01802 01 FFFFFFFF0017
pass         qk1 02101 01 FFFF0017FFFF
pass1        qk3 02101 01 FFFF0017FFFF
stack        qk1 02102 01 FFFF0017FFFF
stack1       qk3 02102 01 FFFF0017FFFF
lvdt         qk1 02103 01 FFFF0017FFFF
lvdt1        qk3 02103 01 FFFF0017FFFF
peak         qk1 02104 01 FFFF0017FFFF
peak1        qk3 02104 01 FFFF0017FFFF
savev        qk1 02105 01 FFFF0017FFFF
savev1       qk3 02105 01 FFFF0017FFFF
hdcalc       qk1 02106 01 FFFF0017FFFF
hdcalc1      qk3 02106 01 FFFF0017FFFF
hecho        qkr 02107 01 FFFF0017FFFF
locate       qk1 02108 01 FFFF0017FFFF
locate1      qk3 02108 01 FFFF0017FFFF
worm         qk1 02109 01 FFFF0017FFFF
worm1        qk3 02109 01 FFFF0017FFFF
hdata        qk1 02110 01 FFFF0017FFFF
hdata1       qk3 02110 01 FFFF0017FFFF
pass         qk2 02111 01 FFFFFFFF0017
pass2        qk3 02111 01 FFFFFFFF0017
stack        qk2 02112 01 FFFFFFFF0017
stack2       qk3 02112 01 FFFFFFFF0017
lvdt         qk2 02113 01 FFFFFFFF0017
lvdt2        qk3 02113 01 FFFFFFFF0017
peak         qk2 02114 01 FFFFFFFF0017
peak2        qk3 02114 01 FFFFFFFF0017
savev        qk2 02115 01 FFFFFFFF0017
savev2       qk3 02115 01 FFFFFFFF0017
hdcalc       qk2 02116 01 FFFFFFFF0017
hdcalc2      qk3 02116 01 FFFFFFFF0017
locate       qk2 02118 01 FFFFFFFF0017
locate2      qk3 02118 01 FFFFFFFF0017
worm         qk2 02119 01 FFFFFFFF0017
worm2        qk3 02119 01 FFFFFFFF0017
hdata        qk2 02120 01 FFFFFFFF0017
hdata2       qk3 02120 01 FFFFFFFF0017
ifdab        qkr 02201 01 0012FFFFFFFF
ifdcd        qkr 02202 01 0012FFFFFFFF
repro        qk1 02301 01 FFFF0012FFFF
repro1       qk3 02301 01 FFFF0012FFFF
repro        qk2 02302 01 FFFFFFFF0012
repro2       qk3 02302 01 FFFFFFFF0012
bbc01        qkr 02401 01 0012FFFFFFFF
bbc02        qkr 02402 01 0012FFFFFFFF
bbc03        qkr 02403 01 0012FFFFFFFF
bbc04        qkr 02404 01 0012FFFFFFFF
bbc05        qkr 02405 01 0012FFFFFFFF
bbc06        qkr 02406 01 0012FFFFFFFF
bbc07        qkr 02407 01 0012FFFFFFFF
bbc08        qkr 02408 01 0012FFFFFFFF
bbc09        qkr 02409 01 0012FFFFFFFF
bbc10        qkr 02410 01 0012FFFFFFFF
bbc11        qkr 02411 01 0012FFFFFFFF
bbc12        qkr 02412 01 0012FFFFFFFF
bbc13        qkr 02413 01 0012FFFFFFFF
bbc14        qkr 02414 01 0012FFFFFFFF
form         qkr 02501 01 0002FFFFFFFF
vform        qkr 02501 01 FFFFFFFFFFFF
enable       qk1 02601 01 FFFF0012FFFF
enable1      qk3 02601 01 FFFF0012FFFF
enable       qk2 02602 01 FFFFFFFF0012
enable2      qk3 02602 01 FFFFFFFF0012
capture      qkr 02701 01 0002FFFFFFFF
dqa          qkr 02801 01 0002FFFFFFFF
vdqa         qkr 02801 01 FFFFFFFFFFFF
tape         qk1 02901 01 FFFF0012FFFF
tape1        qk3 02901 01 FFFF0012FFFF
tape         qk2 02902 01 FFFFFFFF0012
tape2        qk3 02902 01 FFFFFFFF0012
st           qk1 03001 01 FFFF0012FFFF
st1          qk3 03001 01 FFFF0012FFFF
st           qk2 03002 01 FFFFFFFF0012
st2          qk3 03002 01 FFFFFFFF0012
rec          qk1 03101 01 FFFF0012FFFF
rec1         qk3 03101 01 FFFF0012FFFF
rec          qk2 03102 01 FFFFFFFF0012
rec2         qk3 03102 01 FFFFFFFF0012
mcb          qkr 03201 01 FFFFFFFFFFFF
trackform    qkr 03301 01 0002FFFFFFFF
tracks       qkr 03401 01 0002FFFFFFFF
bit_density  qk1 03501 01 FFFF0012FFFF
bit_density1 qk3 03501 01 FFFF0012FFFF
bit_density  qk2 03502 01 FFFFFFFF0012
bit_density2 qk3 03502 01 FFFFFFFF0012
systracks    qk1 03601 01 FFFF0012FFFF
systracks1   qk3 03601 01 FFFF0012FFFF
systracks    qk2 03602 01 FFFFFFFF0012
systracks2   qk3 03602 01 FFFFFFFF0012
rcl          qkr 03701 01 FFFFFFFFFFFF
user_info    qk1 03801 01 FFFF0008FFFF
user_info1   qk3 03801 01 FFFF0008FFFF
st           qk1 03901 01 FFFF0008FFFF
st1          qk3 03901 01 FFFF0008FFFF
et           qk1 04001 01 FFFF0008FFFF
et1          qk3 04001 01 FFFF0008FFFF
rw           qk1 04002 01 FFFF0008FFFF
rw1          qk3 04002 01 FFFF0008FFFF
ff           qk1 04003 01 FFFF0008FFFF
ff1          qk3 04003 01 FFFF0008FFFF
tape         qk1 04101 01 FFFF0008FFFF
tape1        qk3 04101 01 FFFF0008FFFF
rec_mode     qk1 04201 01 FFFF0008FFFF
rec_mode1    qk3 04201 01 FFFF0008FFFF
data_valid   qk1 04301 01 FFFFFFFFFFFF
data_valid1  qk3 04301 01 FFFFFFFFFFFF
data_valid   qk2 04302 01 FFFFFFFFFFFF
data_valid2  qk3 04302 01 FFFFFFFF0FF7
data_valid   qkr 04300 01 FFFFFFFF0FF7
label        qk1 04401 01 FFFF0008FFFF
label1       qk3 04401 01 FFFF0008FFFF
rec          qk1 04501 01 FFFF0008FFFF
rec1         qk3 04501 01 FFFF0008FFFF
form         qkr 04601 01 0054FFFFFFFF
4form        qkr 04601 01 FFFFFFFFFFFF
vsi4         qkr 04602 01 0014FFFFFFFF
tracks       qkr 04701 01 0054FFFFFFFF
4tracks      qkr 04701 01 FFFFFFFFFFFF
trackform    qkr 04801 01 0054FFFFFFFF
4trackform   qkr 04801 01 FFFFFFFFFFFF
rvac         qk1 04901 01 FFFF0012FFFF
rvac1        qk3 04901 01 FFFF0012FFFF
rvac         qk2 04902 01 FFFFFFFF0012
rvac2        qk3 04902 01 FFFFFFFF0012
wvolt        qk1 05001 01 FFFF0012FFFF
wvolt1       qk3 05001 01 FFFF0012FFFF
wvolt        qk2 05002 01 FFFFFFFF0012
wvolt2       qk3 05002 01 FFFFFFFF0012
lo           qkr 05101 01 FFFFFFFFFFFF
user_device  qkr 05102 01 FFFFFFFFFFFF
pcalform     qkr 05201 01 FFFFFFFFFFFF
pcald        qkr 05301 01 FFFFFFFFFFFF
pcalports    qkr 05401 01 0254FFFFFFFF
4pcalport    qkr 05401 01 FFFFFFFFFFFF
save_file    qkr 05501 01 FFFFFFFFFFFF
*k4 commands
k4ib         qkr 05601 01 FFFFFFFFFFFF
et           qk1 05701 01 FFFF0020FFFF
et1          qk3 05701 01 FFFF0020FFFF
rw           qk1 05702 01 FFFF0020FFFF
rw1          qk3 05702 01 FFFF0020FFFF
ff           qk1 05703 01 FFFF0020FFFF
ff1          qk3 05703 01 FFFF0020FFFF
st           qk1 05801 01 FFFF0020FFFF
st1          qk3 05801 01 FFFF0020FFFF
tape         qk1 05901 01 FFFF0020FFFF
tape1        qk3 05901 01 FFFF0020FFFF
rec          qk1 06001 01 FFFF0020FFFF
rec1         qk3 06001 01 FFFF0020FFFF
valo         qkr 06101 01 00E0FFFFFFFF
vblo         qkr 06102 01 00E0FFFFFFFF
vclo         qkr 06103 01 00E0FFFFFFFF
va           qkr 06201 01 00E0FFFFFFFF
vb           qkr 06202 01 00E0FFFFFFFF
vc           qkr 06203 01 00E0FFFFFFFF
vcif         qkr 06301 01 00E0FFFFFFFF
vabw         qkr 06401 01 00E0FFFFFFFF
vbbw         qkr 06402 01 00E0FFFFFFFF
vcbw         qkr 06403 01 00E0FFFFFFFF
form         qkr 06501 01 0080FFFFFFFF
newtape      qk1 06601 01 FFFF0020FFFF
newtape1     qk3 06601 01 FFFF0020FFFF
label        qk1 06701 01 FFFF0020FFFF
label1       qk3 06701 01 FFFF0020FFFF
oldtape      qk1 06801 01 FFFF0020FFFF
oldtape1     qk3 06801 01 FFFF0020FFFF
rec_mode     qk1 06901 01 FFFF0020FFFF
rec_mode1    qk3 06901 01 FFFF0020FFFF
*this recpatch only for non-k4 rec 1
recpatch     qkr 07001 01 FFFF00DFFFFF
recpatch     qk1 07001 01 FFFF0020FFFF
recpatch1    qk3 07001 01 FFFF0020FFFF
*this k4pcalports only for non-k4 rec 1
k4pcalports  qkr 07101 01 FFFF00DFFFFF
k4pcalports  qk1 07101 01 FFFF0020FFFF
k4pcalports1 qk3 07101 01 FFFF0020FFFF
*
select       qkr 07201 01 FFFFFFFFFFFF
scan_name    qkr 07301 01 FFFFFFFFFFFF
ifadjust     qkr 07401 01 0205FFFFFFFF
tacd         qkr 07501 01 FFFFFFFFFFFF
cablelong    qkr 07604 01 FFFFFFFFFFFF
cablediff    qkr 07701 01 FFFFFFFFFFFF
mk5          qkr 07800 01 FFFFFFFFFFFF
jive5ab      qkr 07800 01 FFFFFFFFFFFF
disk_record  qkr 07801 01 FFFFEFFFFFFF
disk_pos     qkr 07802 01 FFFFEFFFFFFF
disk_serial  qkr 07803 01 FFFFEFFFFFFF
data_check   qkr 07804 01 FFFFEFFFFFFF
mk5relink    qkr 07805 01 FFFFEFFFFFFF
mk5close     qkr 07806 01 FFFFEFFFFFFF
bank_check   qkr 07807 01 FFFFEFFFFFFF
bank_status  qkr 07808 01 FFFFEFFFFFFF
disk2file    qkr 07809 01 FFFFEFFFFFFF
in2net       qkr 07810 01 FFFFEFFFFFFF
scan_check   qkr 07811 01 FFFFEFFFFFFF
last_check   qkr 07812 01 FFFFEFFFFFFF
mk5b_mode    qkr 07813 01 FFFFEFFFFFFF
bit_streams  qkr 07814 01 FFFFFFFFFFFF
mk5c_mode    qkr 07815 01 FFFFEFFFFFFF
dbbc         qkr 07820 01 FFFFFFFFFFFF
mk5_status   qkr 07821 01 FFFFFFFFFFFF
fila10g      qkr 07822 01 FFFFFFFFFFFF
dbbc2        qkr 07823 01 FFFFFFFFFFFF
fila10g2     qkr 07824 01 FFFFFFFFFFFF
dbbc3        qkr 07825 01 FFFFFFFFFFFF
fila10g_mode qkr 07826 01 FFFFFFFFFFFF
dbbcrelink   qkr 07827 01 FFFFFFFFFFFF
dbbcclose    qkr 07828 01 FFFFFFFFFFFF
rollform     qkr 07901 01 0254FFFFFFFF
tpicd        qkr 08001 01 FFFFFFFFFFFF
onoff        qkr 08101 01 FFFFFFFFFFFF
holog        qkr 08102 01 FFFFFFFFFFFF
satellite    qkr 08103 01 FFFFFFFFFFFF
satoff       qkr 08104 01 FFFFFFFFFFFF
tle          qkr 08105 01 FFFFFFFFFFFF
cont_cal     qkr 08200 01 0800FFFFFFFF
cont_cal     qkr 08201 01 4000FFFFFFFF
*lba commands
ds           qkr 08301 01 FFFFFFFFFFFF
ifp01        qkr 08401 01 0300FFFFFFFF
ifp02        qkr 08402 01 0300FFFFFFFF
ifp03        qkr 08403 01 0300FFFFFFFF
ifp04        qkr 08404 01 0300FFFFFFFF
cor01        qkr 08501 01 0300FFFFFFFF
cor02        qkr 08502 01 0300FFFFFFFF
cor03        qkr 08503 01 0300FFFFFFFF
cor04        qkr 08504 01 0300FFFFFFFF
mon01        qkr 08601 01 0300FFFFFFFF
mon02        qkr 08602 01 0300FFFFFFFF
mon03        qkr 08603 01 0300FFFFFFFF
mon04        qkr 08604 01 0300FFFFFFFF
ft01         qkr 08701 01 0300FFFFFFFF
ft02         qkr 08702 01 0300FFFFFFFF
ft03         qkr 08703 01 0300FFFFFFFF
ft04         qkr 08704 01 0300FFFFFFFF
trackform    qkr 08801 01 0300FFFFFFFF
* s2das commands
bbc1         qkr 09001 01 0008FFFFFFFF
bbc2         qkr 09002 01 0008FFFFFFFF
bbc3         qkr 09003 01 0008FFFFFFFF
bbc4         qkr 09004 01 0008FFFFFFFF
agc          qkr 09100 01 0008FFFFFFFF
diag         qkr 09101 01 0008FFFFFFFF
encode       qkr 09102 01 0008FFFFFFFF
fs           qkr 09103 01 0008FFFFFFFF
ifx          qkr 09104 01 0008FFFFFFFF
s2version    qkr 09105 01 FFFFFFFFFFFF
mode         qkr 09106 01 0008FFFFFFFF
s2ping       qkr 09107 01 FFFFFFFFFFFF
pwrmon       qkr 09108 01 0008FFFFFFFF
s2status     qkr 09109 01 0008FFFFFFFF
s2check      qkr 09110 01 0008FFFFFFFF
s2delays     qkr 09111 01 0008FFFFFFFF
errmsg       qkr 09200 01 0008FFFFFFFF
stamsg       qkr 09201 01 0008FFFFFFFF
tonedet      qkr 09300 01 0008FFFFFFFF
tonemeas     qkr 09301 01 0008FFFFFFFF
*dbbc
bbc01        qkr 09401 01 0800FFFFFFFF
bbc02        qkr 09402 01 0800FFFFFFFF
bbc03        qkr 09403 01 0800FFFFFFFF
bbc04        qkr 09404 01 0800FFFFFFFF
bbc05        qkr 09405 01 0800FFFFFFFF
bbc06        qkr 09406 01 0800FFFFFFFF
bbc07        qkr 09407 01 0800FFFFFFFF
bbc08        qkr 09408 01 0800FFFFFFFF
bbc09        qkr 09409 01 0800FFFFFFFF
bbc10        qkr 09410 01 0800FFFFFFFF
bbc11        qkr 09411 01 0800FFFFFFFF
bbc12        qkr 09412 01 0800FFFFFFFF
bbc13        qkr 09413 01 0800FFFFFFFF
bbc14        qkr 09414 01 0800FFFFFFFF
bbc15        qkr 09415 01 0800FFFFFFFF
bbc16        qkr 09416 01 0800FFFFFFFF
form         qkr 09500 01 0800FFFFFFFF
ifa          qkr 09501 01 0800FFFFFFFF
ifb          qkr 09502 01 0800FFFFFFFF
ifc          qkr 09503 01 0800FFFFFFFF
ifd          qkr 09504 01 0800FFFFFFFF
bbc_gain     qkr 09600 01 4800FFFFFFFF
ifa          qkr 09701 01 4000FFFFFFFF
ifb          qkr 09702 01 4000FFFFFFFF
ifc          qkr 09703 01 4000FFFFFFFF
ifd          qkr 09704 01 4000FFFFFFFF
ife          qkr 09705 01 4000FFFFFFFF
iff          qkr 09706 01 4000FFFFFFFF
ifg          qkr 09707 01 4000FFFFFFFF
ifh          qkr 09708 01 4000FFFFFFFF
iftpa        qkr 09711 01 4000FFFFFFFF
iftpb        qkr 09712 01 4000FFFFFFFF
iftpc        qkr 09713 01 4000FFFFFFFF
iftpd        qkr 09714 01 4000FFFFFFFF
iftpe        qkr 09715 01 4000FFFFFFFF
iftpf        qkr 09716 01 4000FFFFFFFF
iftpg        qkr 09717 01 4000FFFFFFFF
iftph        qkr 09718 01 4000FFFFFFFF
bbc001       qkr 09801 01 4000FFFFFFFF
bbc002       qkr 09802 01 4000FFFFFFFF
bbc003       qkr 09803 01 4000FFFFFFFF
bbc004       qkr 09804 01 4000FFFFFFFF
bbc005       qkr 09805 01 4000FFFFFFFF
bbc006       qkr 09806 01 4000FFFFFFFF
bbc007       qkr 09807 01 4000FFFFFFFF
bbc008       qkr 09808 01 4000FFFFFFFF
bbc009       qkr 09809 01 4000FFFFFFFF
bbc010       qkr 09810 01 4000FFFFFFFF
bbc011       qkr 09811 01 4000FFFFFFFF
bbc012       qkr 09812 01 4000FFFFFFFF
bbc013       qkr 09813 01 4000FFFFFFFF
bbc014       qkr 09814 01 4000FFFFFFFF
bbc015       qkr 09815 01 4000FFFFFFFF
bbc016       qkr 09816 01 4000FFFFFFFF
bbc017       qkr 09817 01 4000FFFFFFFF
bbc018       qkr 09818 01 4000FFFFFFFF
bbc019       qkr 09819 01 4000FFFFFFFF
bbc020       qkr 09820 01 4000FFFFFFFF
bbc021       qkr 09821 01 4000FFFFFFFF
bbc022       qkr 09822 01 4000FFFFFFFF
bbc023       qkr 09823 01 4000FFFFFFFF
bbc024       qkr 09824 01 4000FFFFFFFF
bbc025       qkr 09825 01 4000FFFFFFFF
bbc026       qkr 09826 01 4000FFFFFFFF
bbc027       qkr 09827 01 4000FFFFFFFF
bbc028       qkr 09828 01 4000FFFFFFFF
bbc029       qkr 09829 01 4000FFFFFFFF
bbc030       qkr 09830 01 4000FFFFFFFF
bbc031       qkr 09831 01 4000FFFFFFFF
bbc032       qkr 09832 01 4000FFFFFFFF
bbc033       qkr 09833 01 4000FFFFFFFF
bbc034       qkr 09834 01 4000FFFFFFFF
bbc035       qkr 09835 01 4000FFFFFFFF
bbc036       qkr 09836 01 4000FFFFFFFF
bbc037       qkr 09837 01 4000FFFFFFFF
bbc038       qkr 09838 01 4000FFFFFFFF
bbc039       qkr 09839 01 4000FFFFFFFF
bbc040       qkr 09840 01 4000FFFFFFFF
bbc041       qkr 09841 01 4000FFFFFFFF
bbc042       qkr 09842 01 4000FFFFFFFF
bbc043       qkr 09843 01 4000FFFFFFFF
bbc044       qkr 09844 01 4000FFFFFFFF
bbc045       qkr 09845 01 4000FFFFFFFF
bbc046       qkr 09846 01 4000FFFFFFFF
bbc047       qkr 09847 01 4000FFFFFFFF
bbc048       qkr 09848 01 4000FFFFFFFF
bbc049       qkr 09849 01 4000FFFFFFFF
bbc050       qkr 09850 01 4000FFFFFFFF
bbc051       qkr 09851 01 4000FFFFFFFF
bbc052       qkr 09852 01 4000FFFFFFFF
bbc053       qkr 09853 01 4000FFFFFFFF
bbc054       qkr 09854 01 4000FFFFFFFF
bbc055       qkr 09855 01 4000FFFFFFFF
bbc056       qkr 09856 01 4000FFFFFFFF
bbc057       qkr 09857 01 4000FFFFFFFF
bbc058       qkr 09858 01 4000FFFFFFFF
bbc059       qkr 09859 01 4000FFFFFFFF
bbc060       qkr 09860 01 4000FFFFFFFF
bbc061       qkr 09861 01 4000FFFFFFFF
bbc062       qkr 09862 01 4000FFFFFFFF
bbc063       qkr 09863 01 4000FFFFFFFF
bbc064       qkr 09864 01 4000FFFFFFFF
bbc065       qkr 09905 01 4000FFFFFFFF
bbc066       qkr 09906 01 4000FFFFFFFF
bbc067       qkr 09907 01 4000FFFFFFFF
bbc068       qkr 09908 01 4000FFFFFFFF
bbc069       qkr 09909 01 4000FFFFFFFF
bbc070       qkr 09910 01 4000FFFFFFFF
bbc071       qkr 09911 01 4000FFFFFFFF
bbc072       qkr 09912 01 4000FFFFFFFF
bbc073       qkr 09913 01 4000FFFFFFFF
bbc074       qkr 09914 01 4000FFFFFFFF
bbc075       qkr 09915 01 4000FFFFFFFF
bbc076       qkr 09916 01 4000FFFFFFFF
bbc077       qkr 09917 01 4000FFFFFFFF
bbc078       qkr 09918 01 4000FFFFFFFF
bbc079       qkr 09919 01 4000FFFFFFFF
bbc080       qkr 09920 01 4000FFFFFFFF
bbc081       qkr 09921 01 4000FFFFFFFF
bbc082       qkr 09922 01 4000FFFFFFFF
bbc083       qkr 09923 01 4000FFFFFFFF
bbc084       qkr 09924 01 4000FFFFFFFF
bbc085       qkr 09925 01 4000FFFFFFFF
bbc086       qkr 09926 01 4000FFFFFFFF
bbc087       qkr 09927 01 4000FFFFFFFF
bbc088       qkr 09928 01 4000FFFFFFFF
bbc089       qkr 09929 01 4000FFFFFFFF
bbc090       qkr 09930 01 4000FFFFFFFF
bbc091       qkr 09931 01 4000FFFFFFFF
bbc092       qkr 09932 01 4000FFFFFFFF
bbc093       qkr 09933 01 4000FFFFFFFF
bbc094       qkr 09934 01 4000FFFFFFFF
bbc095       qkr 09935 01 4000FFFFFFFF
bbc096       qkr 09936 01 4000FFFFFFFF
bbc097       qkr 09937 01 4000FFFFFFFF
bbc098       qkr 09938 01 4000FFFFFFFF
bbc099       qkr 09939 01 4000FFFFFFFF
bbc100       qkr 09940 01 4000FFFFFFFF
bbc101       qkr 09941 01 4000FFFFFFFF
bbc102       qkr 09942 01 4000FFFFFFFF
bbc103       qkr 09943 01 4000FFFFFFFF
bbc104       qkr 09944 01 4000FFFFFFFF
bbc105       qkr 09945 01 4000FFFFFFFF
bbc106       qkr 09946 01 4000FFFFFFFF
bbc107       qkr 09947 01 4000FFFFFFFF
bbc108       qkr 09948 01 4000FFFFFFFF
bbc109       qkr 09949 01 4000FFFFFFFF
bbc100       qkr 09950 01 4000FFFFFFFF
bbc111       qkr 09951 01 4000FFFFFFFF
bbc112       qkr 09952 01 4000FFFFFFFF
bbc113       qkr 09953 01 4000FFFFFFFF
bbc114       qkr 09954 01 4000FFFFFFFF
bbc115       qkr 09955 01 4000FFFFFFFF
bbc116       qkr 09956 01 4000FFFFFFFF
bbc117       qkr 09957 01 4000FFFFFFFF
bbc118       qkr 09958 01 4000FFFFFFFF
bbc119       qkr 09959 01 4000FFFFFFFF
bbc120       qkr 09960 01 4000FFFFFFFF
bbc121       qkr 09961 01 4000FFFFFFFF
bbc122       qkr 09962 01 4000FFFFFFFF
bbc123       qkr 09963 01 4000FFFFFFFF
bbc124       qkr 09964 01 4000FFFFFFFF
bbc125       qkr 09965 01 4000FFFFFFFF
bbc126       qkr 09966 01 4000FFFFFFFF
bbc127       qkr 09967 01 4000FFFFFFFF
bbc128       qkr 09968 01 4000FFFFFFFF
*mk6
*mk6
*mk6
mk6          qkr 10000 01 FFFFFFFFFFFF
mk6a         qkr 10001 01 FFFFFFFFFFFF
mk6b         qkr 10002 01 FFFFFFFFFFFF
*mk6_record   qkr 10100 01 FFFF1000FFFF
*mk6_recorda  qkr 10101 01 FFFF1000FFFF
*mk6_recordb  qkr 10102 01 FFFF1000FFFF
*disk_pos     qkr 10200 01 FFFF1000FFFF
*disk_posa    qkr 10201 01 FFFF1000FFFF
*disk_posb    qkr 10202 01 FFFF1000FFFF
*disk_serial  qkr 10300 01 FFFF1000FFFF
*data_check   qkr 10400 01 FFFF1000FFFF
*mk5relink    qkr 10600 01 FFFF1000FFFF
*mk5close     qkr 10600 01 FFFF1000FFFF
*bank_check   qkr 10700 01 FFFF1000FFFF
*bank_status  qkr 10800 01 FFFF1000FFFF
*disk2file    qkr 10900 01 FFFF1000FFFF
*in2net       qkr 11000 01 FFFF1000FFFF
*scan_check   qkr 11100 01 FFFF1000FFFF
*scan_checka  qkr 11101 01 FFFF1000FFFF
*scan_checkb  qkr 11102 01 FFFF1000FFFF
*scan_checkc  qkr 11103 01 FFFF1000FFFF
*scan_checkd  qkr 11104 01 FFFF1000FFFF
active_mk6s  qkr 11200 01 FFFFFFFFFFFF
*RDBE
rdbe         qkr 12000 01 FFFFFFFFFFFF
rdbea        qkr 12001 01 FFFFFFFFFFFF
rdbeb        qkr 12002 01 FFFFFFFFFFFF
rdbec        qkr 12003 01 FFFFFFFFFFFF
rdbed        qkr 12004 01 FFFFFFFFFFFF
active_rdbes qkr 12100 01 FFFFFFFFFFFF
rdbe_atten   qkr 12200 01 FFFFFFFFFFFF
rdbe_attena  qkr 12201 01 FFFFFFFFFFFF
rdbe_attenb  qkr 12202 01 FFFFFFFFFFFF
rdbe_attenc  qkr 12203 01 FFFFFFFFFFFF
rdbe_attend  qkr 12204 01 FFFFFFFFFFFF
*dbbc pfb
vsi1         qkr 13000 01 0800FFFFFFFF
vsi2         qkr 13001 01 0800FFFFFFFF
pfb1         qkr 13101 01 0800FFFFFFFF
pfb2         qkr 13102 01 0800FFFFFFFF
pfb3         qkr 13103 01 0800FFFFFFFF
pfb4         qkr 13104 01 0800FFFFFFFF
* boss internal
cont         *xx 00000 02 FFFFFFFFFFFF
halt         *xx 00000 03 FFFFFFFFFFFF
log          xxx 00000 04 FFFFFFFFFFFF
schedule     xxx 00000 05 FFFFFFFFFFFF
xlog         *xx 00000 06 FFFFFFFFFFFF
xdisp        *xx 00000 07 FFFFFFFFFFFF
echo         *xx 00000 08 FFFFFFFFFFFF
*break        *xx 0000 14 77FF
terminate    *xx 00000 10 FFFFFFFFFFFF
flush        *xx 00000 11 FFFFFFFFFFFF
sy           *xx 00000 12 FFFFFFFFFFFF
ti           *xx 00000 13 FFFFFFFFFFFF
proc         xxx 00000 15 FFFFFFFFFFFF
list         *xx 00000 16 FFFFFFFFFFFF
status       *xx 00000 17 FFFFFFFFFFFF
help         *xx 00000 18 FFFFFFFFFFFF
?            *xx 00000 18 FFFFFFFFFFFF
date         *xx 00000 19 FFFFFFFFFFFF
op_stream    *xx 00000 20 FFFFFFFFFFFF
tnx          *xx 00000 21 FFFFFFFFFFFF
