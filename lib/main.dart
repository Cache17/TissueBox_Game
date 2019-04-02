import'package:shared_preferences/shared_preferences.dart';import'package:audioplayers/audioplayers.dart';import'package:flutter/material.dart';import'package:flutter/services.dart';import'package:flutter/gestures.dart';import'package:flame/sprite.dart';import'package:flame/flame.dart';import'package:flame/util.dart';import'package:flame/game.dart';import'dart:math';main()async{var u=Util();await u.fullScreen();await u.setOrientation(DeviceOrientation.portraitUp);const m='.mp3';await Flame.images.loadAll(['b','0','1','2','3','4','5','6','t']);p(c)async=>(await Flame.audio.load(c)).path;i(a,s,v)async{await a.setUrl(await p(s),isLocal:true);a.setVolume(v);}G.sa(G.l1,await p('s$m'));G.sa(G.l2,await p('d$m'));G.sa(G.l3,await p('t$m'));await i(G.at,'tk$m',1.0);await i(G.aw,'a$m',.5);var g=G((await SharedPreferences.getInstance()).getInt('hs')??0);var h=HorizontalDragGestureRecognizer();var v=VerticalDragGestureRecognizer();h.onUpdate=g.du;h.onStart=g.ds;h.onEnd=g.de;v.onUpdate=g.du;v.onStart=g.ds;v.onEnd=g.de;runApp(g.widget);u.addGestureRecognizer(h);u.addGestureRecognizer(v);}enum D{t,b,n}class G extends Game{static sp(g)=>Sprite(g);static var at=AudioPlayer(),aw=AudioPlayer(),l1=[AudioPlayer(),AudioPlayer(),AudioPlayer()],l2=[AudioPlayer(),AudioPlayer()],l3=[AudioPlayer(),AudioPlayer()],f=0,d=0,i3=0;static sa(a,s)=>a.forEach((x){x.setUrl(s,isLocal:true);x.setVolume(.2);});var bg=sp('b'),cr=sp('c'),ip=Offset.zero,dp=Offset.zero,m=D.n,g=false,o=false,u=.0,h=0,s=0,l=0;static i(a){if(a==1)f=f<l1.length-1?f+1:0;else if(a==2)d=d<l2.length-1?d+1:0;else if(a==3)i3=i3<l3.length-1?i3+1:0;return a==1?f:a==2?d:i3;}final e=true;double ts,sx;double get k=>sS.width/5/ts;static get a1=>l1[i(1)];static get a2=>l2[i(2)];static get a3=>l3[i(3)];static w(a,b,c,d)=>Rect.fromLTWH(a,b,c,d);Size sS;Rect r;B b;init()async{resize(await Flame.util.initialDimensions());r=w(.0,sS.height-ts*23,ts*9,ts*23);b=B(this);}sh()async=>await(await SharedPreferences.getInstance()).setInt('hs',h);G(this.h){init();}@override render(c){tx(s,o,u,f){var t=TextPainter(text:TextSpan(style:TextStyle(color:Colors.white,fontSize:f,fontFamily:'NS'),text:s),textScaleFactor:k,textDirection:TextDirection.ltr);t.layout();t.paint(c,u?B.of(o.dx-t.width/2,o.dy):o);}bg.renderRect(c,r);b.rd(c);var ct=b.il+b.r.width/2;if(g)tx(u.toStringAsFixed(u<1?1:0)+'s',B.of(ct+8,k*23),e,k*10);var d=h.toString();tx(d,B.of(d.length==1?44.0:d.length>2?22.0:33.0,k*30),!e,k*12);cr.renderRect(c,w(28.0,k*10,49.2,39.0));tx(s.toString(),B.of(ct,k*50),e,k*25);h=s>h?s:h;}@override update(t){b.ud(t);u-=g||o?t:0;if(u<0&&g){b.a=e;g=!e;u=2;o=e;sh();b.nG();}else if(g&&!o){var v=u.floor();if(v<l&&v<6&&v!=0)B.v(Duration(milliseconds:300),()=>G.at.resume());l=v;}o=u<=0&&o?!e:o;}resize(s){sS=s;ts=sS.width/9;}ds(d){var p=d.globalPosition;m=b.ti.r.contains(p)?D.t:b.r.contains(p)?D.b:D.n;ip=B.of(p.dx==0?ip.dx:p.dx,p.dy==0?ip.dy:p.dy);sx=(b.ti.r.left-p.dx).abs();}du(d){if(o||m==D.n)return;var p=d.globalPosition;dp=B.of(p.dx==0?dp.dx:p.dx,p.dy==0?dp.dy:p.dy);if(m==D.t){if(ip.dy-dp.dy>100){if(g!=e&&o!=e){g=e;u=10;s=0;}var st=(sx -(b.ti.r.left-p.dx).abs()).abs();var sa=st<3?3:st<6?2:1;m=D.n;b.nT(sa);t(sa);s+=sa;}}else if(m==D.b){b.r=w(b.il+dp.dx-ip.dx,b.r.top,B.q.dx,B.q.dy);b.m=e;}}t(i)=>(i==1?G.a1:i==2?G.a2:G.a3).resume();de(d){ip=Offset.zero;m=D.n;b.ti.m=!e;b.m=!e;dp=ip;}}class B{Rect get ir=>G.w(r.center.dx-T.w/2,r.top-r.height+19,T.w,T.w);Sprite get gb=>G.sp(y.nextInt(7).toString());var l=List<TA>(),y=Random(),m=false,a=false;Offset get u=>of(ir.left,ir.top-150);final G g;Sprite b;Rect r;int tc;T ti;double get il=>g.sS.width/2-B.q.dx/2;double get it=>g.sS.height-g.ts*5.5;static var q=B.of(150.0,100.0);B(this.g){r=G.w(il,it,q.dx,q.dy);tc=10-y.nextInt(5);ti=T(g,this);b=gb;}rd(c){b.renderRect(c,r);ti.rd(c);l.forEach((x)=>x.rd(c));}ud(t){ti.u(t);l.removeWhere((x)=>x.a);l.forEach((x)=>x.u(t));var v=r.left-il;if(m&&!g.o){if(v.abs()>50&&tc==0)a=g.e;}else if(a&&!g.o){r=r.shift(of(v>0?r.left+g.k*11:r.left-g.k*11,r.top));if(r.right<-50||r.left>g.sS.width+50)nB();}else if(a&&g.o){var o=of(r.left,g.sS.height+T.w)-of(r.left,r.top);r=r.shift(g.k*11<o.distance?Offset.fromDirection(o.direction,g.k*11):o);}else{var o=of(il,it)-of(r.left,r.top);r=r.shift(g.k*11<o.distance?Offset.fromDirection(o.direction,g.k*11):o);}}static of(x,y)=>Offset(x,y);nT(i){var d=Duration(milliseconds:100);l.add(TA(g,this));if(i>1)v(d,(){l.add(TA(g,this));if(i>2)v(d,(){l.add(TA(g,this));});});ti=T(g,this,--tc==0);}nB(){b=gb;r=G.w(r.right<-0?g.sS.width+50-q.dx:-50.0,it,q.dx,q.dy);tc=10-y.nextInt(5);ti=T(g,this);a=!g.e;m=!g.e;}nG()async{a=g.e;G.aw.resume();await v(Duration(seconds:2),(){});nB();}static v(da,db())async=>await Future.delayed(da,db);}class T{var s=G.sp('t'),m=false;static var w=100.0;final B b;final G g;bool a;Rect r;T(this.g,this.b,[this.a=false]){r=b.ir;}rd(c)=>s.renderRect(c,r);u(t)=>r=a?r.shift(Offset.infinite):b.ir;}class TA extends T{TA(G g,B b):super(g,b);rd(c)=>s.renderRect(c,r);u(t){var s=500*t;Offset o=b.u-B.of(r.left,r.top);if(s<o.distance)r=r.shift(Offset.fromDirection(o.direction,s));else a=g.e;}}