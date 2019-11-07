import ("stdfaust.lib") ;

panpot = vslider ("[01]panpot [style:knob]", 0.5, 0, 1, 0.1) ;

fader = vslider ("[01]volume", 1, 0, 2, 0.1) ;

vmeter(x)		= attach(x, envelop(x) : vbargraph("[02][unit:dB]", -70, +5));

envelop         = abs : max ~ -(1.0/ma.SR) : max(ba.db2linear(-70)) : ba.linear2db;

process = _ <: _* (1-panpot), _* (panpot) :  hgroup ("[02]nome",* (fader), * (fader) : vmeter, vmeter) ; 
