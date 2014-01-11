//////////dictionnaire d'instruments

SynthDef(\sax, { |out, freq=440, amp=0.1, gate=1|
	var num = 16;
	var harms = Array.series(num, 1, 1) * Array.exprand(num, 0.995, 1.001);
	var snd = SinOsc.ar(freq * SinOsc.kr(Rand(2.0,5.0),0,Rand(0.001, 0.01),1) * harms, mul:Array.geom(num, 1, 0.63));
	snd = Splay.ar(snd);
	snd = BBandPass.ar(snd, freq * XLine.kr(0.1,4,0.01), 2);
	snd = snd * amp * EnvGen.ar(Env.adsr(0.001, 0.2, 0.7, 0.2), gate, doneAction:2);
	Out.ar(out, snd!2);
}).add;


///////// Ligne de fin pour mettre le bouzin en route

s.boot;
NetAddr.langPort.postln;

OSCFunc.newMatching(
    { |message, time, addr, responder|
       //"caca".post;
		message[1].asString.interpret
    }, "/SC", n
);


m=NetAddr("127.0.0.1", NetAddr.langPort);
m.sendMsg("SC", "iop")