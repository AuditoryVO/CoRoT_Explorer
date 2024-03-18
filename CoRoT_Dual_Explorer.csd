;IAS CoRoT Explorer
;Adrián García Riber
;2024
<Cabbage>
form caption("DUAL CoRoT EXPLORER") size(900,715), colour(0,0,0), pluginID("DUAL CoRoT EXPLORER")

image bounds(-12, 432, 900, 200) identchannel("Image") corners(10) file("Lc.png") 
image bounds(-234, -60, 1152, 576) identchannel("Sky") corners(10) file("Coord.png")  

texteditor bounds(766, 682, 74, 19) channel("Period") identchannel("editorIdent0") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
texteditor bounds(608, 682, 74, 19) channel("Mean") identchannel("editorIdent1") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
texteditor bounds(372, 656, 74, 19) channel("RA") identchannel("editorIdent2") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
texteditor bounds(372, 682, 74, 19) channel("DEC") identchannel("editorIdent3") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
texteditor bounds(498, 656, 25, 19) channel("TYPE") identchannel("editorIdent4") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
texteditor bounds(530, 656, 25, 19) channel("CLASS") identchannel("editorIdent5") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
texteditor bounds(498, 682, 25, 19) channel("TYPE-note") identchannel("editorIdent6") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 

vslider bounds(142, 620, 30, 80), channel("level"), text("Level"), range(0, 1, 0.7, 1, 0.001) trackercolour(0, 138, 253, 255)
vslider bounds(730, 620, 30, 80) channel("Send"), text("REV"), range(0, 1, 0.3, 1, 0.001) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255)
vslider bounds(688, 620, 30, 80) channel("Tremolo"), text("TREM"), range(0, 2, 1, 1, 0.001) trackercolour(0, 124, 204, 255) colour(204, 204, 204, 255)
vslider bounds(186, 620, 30, 80), channel("A"), text("A"), range(0.1, 3, 1.1, 1, 0.001) colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)
vslider bounds(224, 620, 30, 80), channel("D"), text("D"), range(0.1, 100, 20, 1, 0.001) colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)
vslider bounds(262, 620, 30, 80), channel("S"), text("S"), range(0.1, 100, 70, 1, 0.001) colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)
vslider bounds(300, 620, 30, 80), channel("R"), text("R"), range(0, 10, 9.054, 15, 0.001)  colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)

button bounds(610, 656, 70, 20) text("Period OFF", "Period ON") channel("Mute1") value(1) corners(4)  identchannel("Mute1") fontcolour:0(164, 39, 39, 255) colour:1(72, 72, 72, 255) colour:0(204, 204, 204, 255) 
button bounds(766, 656, 70, 20) text("Mean OFF", "Mean ON") channel("Mute2") value(1) corners(4)  identchannel("Mute2") fontcolour:0(164, 39, 39, 255) colour:1(72, 72, 72, 255) colour:0(204, 204, 204, 255) 
button bounds(62, 680, 70, 20) text("Ambisonics", "Binaural") channel("Mode") value(1) corners(4)  identchannel("Mode") fontcolour:0(0, 0, 0, 255) colour:1(72, 72, 72, 255) colour:0(204, 204, 204, 255) 
button bounds(530, 682, 70, 20) text("Class OFF", "Class ON") channel("Class") value(1) corners(4)  identchannel("Mute1") fontcolour:0(164, 39, 39, 255) colour:1(72, 72, 72, 255) colour:0(204, 204, 204, 255) 

label bounds(336, 658, 26, 17), text("Ra"), align("left") fontcolour(100, 100, 100, 255)
label bounds(336, 684, 33, 17), text("Dec"), align("left") fontcolour(100, 100, 100, 255)
label bounds(454, 656, 39, 17), text("Type"), align("left") fontcolour(100, 100, 100, 255)

label bounds(454, 682, 39, 17), text("Note"), align("left") fontcolour(100, 100, 100, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps =32
nchnls = 2
0dbfs = 1

;---------------------------Ambisonics UDO--------------------

;Ambisonics 2D first order without distance encoding
;Input: asound, kazimuth

;------------ENCODING------------
opcode  ambi2D_encode_1a, aaa, ak
asnd,kaz        xin
kaz = $M_PI*kaz/180
a0      =       asnd
a11     =       cos(kaz)*asnd
a12     =       sin(kaz)*asnd
                xout            a0,a11,a12
endop

;------------DECODING------------
;Decoding for 8 speakers symmetrically positioned on a circle at "i" angles

opcode  ambi2D_decode_1_8, aaaaaaaa, aaaiiiiiiii
a0,a11,a12,i1,i2,i3,i4,i5,i6,i7,i8      xin
i1 = $M_PI*i1/180
i2 = $M_PI*i2/180
i3 = $M_PI*i3/180
i4 = $M_PI*i4/180
i5 = $M_PI*i5/180
i6 = $M_PI*i6/180
i7 = $M_PI*i7/180
i8 = $M_PI*i8/180
a1      =       (.5*a0 + cos(i1)*a11 + sin(i1)*a12)*2/3
a2      =       (.5*a0 + cos(i2)*a11 + sin(i2)*a12)*2/3
a3      =       (.5*a0 + cos(i3)*a11 + sin(i3)*a12)*2/3
a4      =       (.5*a0 + cos(i4)*a11 + sin(i4)*a12)*2/3
a5      =       (.5*a0 + cos(i5)*a11 + sin(i5)*a12)*2/3
a6      =       (.5*a0 + cos(i6)*a11 + sin(i6)*a12)*2/3
a7      =       (.5*a0 + cos(i7)*a11 + sin(i7)*a12)*2/3
a8      =       (.5*a0 + cos(i8)*a11 + sin(i8)*a12)*2/3
                xout                    a1,a2,a3,a4,a5,a6,a7,a8
endop


;Initializing global variables 

gks init 0
gkplay init 0
gifrec init 0

gkra init 0
gkdec init 0
gkperiod init 0
gkmean init 0
gStype strget p5
gSclass strget p5
gkclass init 0
gSnote strget p5
gkmode init 1

giosc7 OSCinit 9997 
giosc6 OSCinit 9996
giosc5 OSCinit 9995
giosc4 OSCinit 9994
giosc3 OSCinit 9993 ;Note
giosc2 OSCinit 9992 ;Class
giosc1 OSCinit 9991 ;Type
giosc0 OSCinit 9990 ;Class_num

gidelay init 50


instr 1 ;---------------SONIFICATION SYNTHESIZER------------

gkFader chnget "level"
gkMute1 chnget "Mute1"
gkMute2 chnget "Mute2"
gkMute3 chnget "Class"
gkmode chnget "Mode"

giAtt chnget "A"
giDec chnget "D"
giSus chnget "S"
giRel chnget "R"
kSend chnget "Send"

giAtt2 init 1.048;chnget "A2"
giDec2 init 8.887;chnget "D2"
giSus2 init 34.760;chnget "S2"
giRel2 init 8.394;chnget "R2"

;---------- --------TREMOLO-------------------
kaverageamp chnget "Tremolo" 
kaveragefreq = gkperiod-0.49
krandamountfreq = 0
kampminrate init 1
kampmaxrate init 15
kvib vibrato kaverageamp, kaveragefreq, 1, krandamountfreq, kampminrate, kampmaxrate, 1, 15, 1

;----------------------SYNTH 1: VCO2 / SYNTH 2: FMB3 / SYNTH 3: OSCIL3------------------------
iShape=2
iDuty=0.9
iAttack = giAtt
iDecay = giDec
iSustain = giSus
iRelease = giRel

gkEnv madsr iAttack, iDecay, iSustain ,iRelease

aVCO    vco2 p5+ 0.1*kvib*gkMute1/4, p4, iShape, iDuty
aFM     fmb3 p5+ 0.1*kvib*gkMute1/4, p4, 5, .01, .01, .1
aHi   oscil3 p5+ 0.1*kvib*gkMute1/4, p4/4
 
kmix = 0.5

aVCO2    vco2 (p5+ 0.1*kvib*gkMute1/4)*gkMute3/2, 55*gkclass, iShape, iDuty*4

printk2 p4

kEnvFrec expseg 100*2, 2*iAttack, 100*20, iRelease/3, 100

gkEnv2 madsr giAtt2, giDec2, giSus2 ,giRel2

if gkMute2 == 1 then     
    aVCF	moogladder (aFM*4*(1-kmix)- aHi + aVCO*4*kmix - aVCO2)*gkmean, kEnvFrec, .2
else 
    aVCF	moogladder (aFM*4*(1-kmix)- aHi + aVCO*4*kmix - aVCO2), kEnvFrec, .2
endif

gasendL= aVCF*kSend	
gasendR= aVCF*kSend

if gkmode == 1 then ; ---------------------------BINAURAL--------------------------------------------
    ;Loading HRTF
    gS_HRTF_left   =           "hrtf-44100-left.dat"
    gS_HRTF_right  =           "hrtf-44100-right.dat"

                   ;Binaural parameters: [aleft, aright] hrtfmove2 [asrc, kAz, kElev, ifilel, ifiler]    
    aLeft, aRight  hrtfmove2   (aVCF*gkEnv2)*gkFader, (gkra-100.2196)*100, (gkdec-9.6773), gS_HRTF_left, gS_HRTF_right
               outs        aRight, aLeft                 
    
else ;-------------------FIRST ORDER AMBISONICS--------------------------

    a0,a11,a12 ambi2D_encode_1a (aVCF*gkEnv2)*gkFader,(gkra-100.2196)*100
    a1,a2,a3,a4,a5,a6,a7,a8         ambi2D_decode_1_8  a0,a11,a12,
                               0,45,90,135,180,225,270,315
            outc    a1,a2,a3,a4,a5,a6,a7,a8

endif

endin


instr 2 ;--------------GRAPHICS-------------
giosc_s OSCinit 9989
kans_graph OSClisten giosc_s, "/s", "f", gks

if gks!=0 then
	
	Scurve sprintfk "file(%s)", "Lc.png"
    chnset Scurve, "Image"
    giImage imageload "Lc.png"
    
    Splot2 sprintfk "file(%s)", "Coord.png"
    chnset Splot2, "Sky"
    giPlot2 imageload "Coord.png"


elseif gks==0 then
    Scurve sprintfk "file(%s)", "Init.png"
	chnset Scurve, "Image"	
	imagefree giImage
	
	Splot2 sprintfk "file(%s)", "Init2.png"
	chnset Splot2, "Sky"	
	imagefree giPlot2
				
endif

endin


instr 3 ;-------------------OSC INPUTS---------------------

kans3 OSClisten giosc0, "/class", "i", gkclass

kans4 OSClisten giosc4, "/mean", "f", gkmean
SMessage0 sprintfk "text(\"%f\") ", gkmean
chnset SMessage0, "editorIdent0"

kans5 OSClisten giosc5, "/period", "f", gkperiod

SMessage1 sprintfk "text(\"%f\") ", gkperiod
chnset SMessage1, "editorIdent1"

kans6 OSClisten giosc6, "/ra", "f", gkra
SMessage2 sprintfk "text(\"%f\") ", gkra
chnset SMessage2, "editorIdent2"

kans7 OSClisten giosc7, "/dec", "f", gkdec
SMessage3 sprintfk "text(\"%f\") ", gkdec
chnset SMessage3, "editorIdent3"

kans8 OSClisten giosc3, "/type", "s", gStype
SMessage4 sprintfk "text(\"%s\") ", gStype
chnset SMessage4, "editorIdent4"

kans9 OSClisten giosc2, "/class", "s", gSclass
SMessage5 sprintfk "text(\"%s\") ", gSclass
chnset SMessage5, "editorIdent5"

kans0 OSClisten giosc1, "/note", "s", gSnote
SMessage6 sprintfk "text(\"%s\") ", gSnote
chnset SMessage6, "editorIdent6"

endin


instr 6 ;--------------------REVERB---------------------------

gaRevLf, gaRevRf		reverbsc	gasendL,gasendR,0.95,10000
gaRevLr, gaRevRr		reverbsc	gasendL,gasendR,0.95,10000
		
		out	(gaRevLf)*gkFader,(gaRevRf)*gkFader
		clear		gasendL, gasendR

endin





</CsInstruments>
<CsScore>
f 1 0 1024 10 1

i 1 0 3600*24*7
i 2 0 3600*24*7
i 3 0 3600*24*7
i 6 0 3600*24*7

e

</CsScore>
</CsoundSynthesizer>
