//////////dictionnaire d'instruments

///// Vous pouvez ajouter de nouveaux instruments en mettant du code en-dessous, dans la syntaxe:
/// SynthDef ("nomInstr", { argumentsModifiables }
/// son = code
/// Out.ar(son)
/// })


//synth muy important

SynthDef(\sampler, 
{ |out, bufnum, freq = 1, amp = 1, atk, decay, sustain, rel|
    var  sig, env;
	//env=EnvGen.kr(Env.adsr(atk, decay, sustain, rel, amp));
	env= EnvGen.kr(Env.linen(atk,sustain, rel, amp), doneAction:2);
	sig = PlayBuf.ar(1, bufnum, rate: freq/1000, doneAction: 2) * env;
    Out.ar(out, sig ! 2)
}).add;


SynthDef(\marimba,
 
 {arg out=0, amp=0.3, t_trig=1, sustain=0.5, gate=1, freq=100, rq=0.006;
	var env, signal;
	var rho, theta, b1, b2;
	env = EnvGen.kr(Env.adsr(0.0001, sustain, sustain/2, 0.3), gate, doneAction:2);
	b1 = 1.987 * 0.9889999999 * cos(0.09);
	b2 = 0.998057.neg;
	signal = SOS.ar(K2A.ar(t_trig), 0.3, 0.0, 0.0, b1, b2);
	signal = RHPF.ar(signal*0.8, freq, rq) + DelayC.ar(RHPF.ar(signal*0.9, freq*0.99999, rq*0.999), 0.02, 0.01223);
	signal = Decay2.ar(signal, 0.4, 0.3, signal);
	Out.ar(out, (signal*env)*(amp*0.65)!2);
}).add;


SynthDef(\wood, 

{arg out=0, amp=0.3, pan=0, sustain=0.5, t_trig=1, freq=100, rq=0.06;
	var env, signal;
	var rho, theta, b1, b2;
	b1 = 2.0 * 0.97576 * cos(0.161447);
	b2 = 0.9757.squared.neg;
	signal = SOS.ar(K2A.ar(t_trig), 1.0, 0.0, 0.0, b1, b2);
	signal = Decay2.ar(signal, 0.4, 0.8, signal);
	signal = Limiter.ar(Resonz.ar(signal, freq, rq*0.5), 0.9);
	env = EnvGen.kr(Env.perc(0.00001, sustain, amp), doneAction:2);
	Out.ar(out, Pan2.ar(signal, pan)*env);
}).add;



SynthDef(\bell,

 { |out, accent = 0, amp = 0.1, decayScale = 1|
    var    exc = PinkNoise.ar(amp)
            * Decay2.kr(Impulse.kr(0), 0.01, 0.05),
        sig = Klank.ar(`[
            { ExpRand(400, 1600) } ! 4,
            1 ! 4,
            { ExpRand(0.1, 0.4) } ! 4
        ], exc, freqscale: accent + 1, decayscale: decayScale);
    DetectSilence.ar(sig, doneAction: 2);
    Out.ar(out, sig ! 2)
}).add;

SynthDef(\sax,
 
 { |out, freq, amp=0.1, gate=1|
	var num = 16;
	var harms = Array.series(num, 1, 1) * Array.exprand(num, 0.995, 1.001);
	var snd = SinOsc.ar(freq * SinOsc.kr(Rand(2.0,5.0),0,Rand(0.001, 0.01),1) * harms, mul:Array.geom(num, 1, 0.63));
	snd = Splay.ar(snd);
	snd = BBandPass.ar(snd, freq * XLine.kr(0.1,4,0.01), 2);
	snd = snd * amp * EnvGen.ar(Env.adsr(0.001, 0.2, 0.7, 0.2), gate, doneAction:2);
	Out.ar(out, snd!2);
}).add;

SynthDef(\wobble,
 
 { arg out=0, amp=0.1, gate=1, pan=0, spread=0.8, freq, doneAction=2;
	var sig, sig1, sig2, sig3;
	sig1 = LFSaw.ar(freq * 1 + (0.04 * [1,-1]));
	sig2 = LFSaw.ar(freq * 0.99 );
	sig3 = LFSaw.ar(freq * 1 );
	sig = sig1 + sig2 + sig3;
	sig = (sig*50).tanh;
	sig = sig * EnvGen.ar(\adsr.kr(Env.adsr(0.01,0.1,0.8,0.1)),gate,doneAction:doneAction);
	sig = Splay.ar(sig, spread, amp, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\fatsaw,
	
	{
		arg freq=440, amp=0.3, fat=0.0033, ffreq=2000, atk=0.001, dec=0.3, sus=0.5, rls=0.1,gate=1;
		var f1,f2,f3,f4,synth;
		f1=freq-(freq*fat);
		f2=freq-(freq*fat/2);
		f3=freq+(freq*fat/2);
		f4=freq+(freq*fat);

		synth = LFSaw.ar([f1,f2,f3,f4],[0,0.001,0.002,0.004,0.008]);
		synth = synth * EnvGen.kr(Env([0,1,sus,0],[atk,dec,rls],'lin',2),gate,doneAction:0);
		synth=Splay.ar(synth,0.7);
		synth=RLPF.ar(synth,ffreq*Linen.kr(gate,0.1,0.4,0.2,0),0.4);
		Out.ar([0,1],synth*amp);
},[0.1,0.3,4,2]).add;


SynthDef(\plucking, 

{arg amp = 0.1, freq = 440, decay = 5, coef = 0.1;
var env, snd;
env = EnvGen.kr(Env.linen(0, decay, 0), doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),

        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: coef);
    Out.ar(0, [snd, snd]);
}).add;


///////// Lignes de fin pour mettre le bouzin en route

s.boot;

m=NetAddr("127.0.0.1", 3333);
m.sendMsg("/portSC", NetAddr.langPort);

OSCFunc.newMatching(
    { |message, time, addr, responder|
		message[1].asString.interpret
    }, "/SC", n
);
Scale.major.semitones.asArray;

