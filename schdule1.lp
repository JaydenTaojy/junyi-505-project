%Implement the following LPOD program into ASP on Clingo: 1) cinema × beach<-not hot;2)beach × cinema<-hot 3) cool× hot<-not summer

{ap(X1,X2,X3,X4,X5,X6): X1=0..3, X2=0..3,X3=0..3,X4=0..2, X5=0..3,X6=0..3}. :~ ap(X1,X2,X3,X4,X5,X6). [-1,X1,X2,X3,X4,X5,X6]


% cinema × library ×beach <-cool. 
body_1(X1,X2,X3,X4,X5,X6):- ap(X1,X2,X3,X4,X5,X6), cool(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X1=0, body_1(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X1>0, not body_1(X1,X2,X3,X4,X5,X6).
cinema(X1,X2,X3,X4,X5,X6):- body_1(X1,X2,X3,X4,X5,X6), X1=1. 
library(X1,X2,X3,X4,X5,X6):- body_1(X1,X2,X3,X4,X5,X6), X1=2.
beach(X1,X2,X3,X4,X5,X6):- body_1(X1,X2,X3,X4,X5,X6), X1=3. 
:- body_1(X1,X2,X3,X4,X5,X6), X1!=1, cinema(X1,X2,X3,X4,X5,X6).
:- body_1(X1,X2,X3,X4,X5,X6), X1!=2, not cinema(X1,X2,X3,X4,X5,X6), library(X1,X2,X3,X4,X5,X6).
:- body_1(X1,X2,X3,X4,X5,X6), X1!=3, not cinema(X1,X2,X3,X4,X5,X6), not library(X1,X2,X3,X4,X5,X6), beach(X1,X2,X3,X4,X5,X6).

% beach × cinema× library<-hot. 
body_2(X1,X2,X3,X4,X5,X6) :- ap(X1,X2,X3,X4,X5,X6),hot(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X2=0, body_2(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X2>0, not body_2(X1,X2,X3,X4,X5,X6).
beach(X1,X2,X3,X4,X5,X6):- body_2(X1,X2,X3,X4,X5,X6), X2=1. 
cinema(X1,X2,X3,X4,X5,X6):- body_2(X1,X2,X3,X4,X5,X6), X2=2. 
library(X1,X2,X3,X4,X5,X6):- body_2(X1,X2,X3,X4,X5,X6), X2=3. 
:- body_2(X1,X2,X3,X4,X5,X6), X2!=1, beach(X1,X2,X3,X4,X5,X6).
:- body_2(X1,X2,X3,X4,X5,X6), X2!=2, not beach(X1,X2,X3,X4,X5,X6), cinema(X1,X2,X3,X4,X5,X6).
:- body_2(X1,X2,X3,X4,X5,X6), X2!=3, not beach(X1,X2,X3,X4,X5,X6), not cinema(X1,X2,X3,X4,X5,X6), library(X1,X2,X3,X4,X5,X6).

body_3(X1,X2,X3,X4,X5,X6):- ap(X1,X2,X3,X4,X5,X6), cinema(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X3=0, body_3(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X3>0, not body_3(X1,X2,X3,X4,X5,X6).
jap(X1,X2,X3,X4,X5,X6):- body_3(X1,X2,X3,X4,X5,X6), X3=1. 
chn(X1,X2,X3,X4,X5,X6):- body_3(X1,X2,X3,X4,X5,X6), X3=2. 
span(X1,X2,X3,X4,X5,X6):- body_3(X1,X2,X3,X4,X5,X6), X3=3. 
:- body_2(X1,X2,X3,X4,X5,X6), X3!=1, jap(X1,X2,X3,X4,X5,X6).
:- body_2(X1,X2,X3,X4,X5,X6), X3!=2, not jap(X1,X2,X3,X4,X5,X6), chn(X1,X2,X3,X4,X5,X6).
:- body_2(X1,X2,X3,X4,X5,X6), X3!=3, not jap(X1,X2,X3,X4,X5,X6), not chn(X1,X2,X3,X4,X5,X6), span(X1,X2,X3,X4,X5,X6).


% cool× hot<-not summer. 
body_4(X1,X2,X3,X4,X5,X6):- ap(X1,X2,X3,X4,X5,X6),not summer(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X4=0, body_4(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X4>0, not body_4(X1,X2,X3,X4,X5,X6).
hot(X1,X2,X3,X4,X5,X6):- body_4(X1,X2,X3,X4,X5,X6), X4=2. 
cool(X1,X2,X3,X4,X5,X6):- body_4(X1,X2,X3,X4,X5,X6), X4=1. 
:- body_4(X1,X2,X3,X4,X5,X6), X4!=1, cool(X1,X2,X3,X4,X5,X6).
:- body_4(X1,X2,X3,X4,X5,X6), X4!=2, not cool(X1,X2,X3,X4,X5,X6), hot(X1,X2,X3,X4,X5,X6).

body_5(X1,X2,X3,X4,X5,X6):- ap(X1,X2,X3,X4,X5,X6), beach(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X5=0, body_5(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X5>0, not body_5(X1,X2,X3,X4,X5,X6).
span(X1,X2,X3,X4,X5,X6):- body_5(X1,X2,X3,X4,X5,X6), X5=1. 
chn(X1,X2,X3,X4,X5,X6):- body_5(X1,X2,X3,X4,X5,X6), X5=2. 
jap(X1,X2,X3,X4,X5,X6):- body_5(X1,X2,X3,X4,X5,X6), X5=3. 
:- body_5(X1,X2,X3,X4,X5,X6), X5!=1, span((X1,X2,X3,X4,X5,X6).
:- body_5(X1,X2,X3,X4,X5,X6), X5!=2, not span(X1,X2,X3,X4,X5,X6), chn(X1,X2,X3,X4,X5,X6).
:- body_5(X1,X2,X3,X4,X5,X6), X5!=3, not span(X1,X2,X3,X4,X5,X6), not chn(X1,X2,X3,X4,X5,X6), jap(X1,X2,X3,X4,X5,X6).

body_6(X1,X2,X3,X4,X5,X6):- ap(X1,X2,X3,X4,X5,X6), beach(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X6=0, body_6(X1,X2,X3,X4,X5,X6).
:- ap(X1,X2,X3,X4,X5,X6), X6>0, not body_6(X1,X2,X3,X4,X5,X6).
span(X1,X2,X3,X4,X5,X6):- body_6(X1,X2,X3,X4,X5,X6),X6=2. 
chn(X1,X2,X3,X4,X5,X6):- body_6(X1,X2,X3,X4,X5,X6), X6=1. 
jap(X1,X2,X3,X4,X5,X6):- body_6(X1,X2,X3,X4,X5,X6), X6=3. 
:- body_6(X1,X2,X3,X4,X5,X6), X6!=1, chn((X1,X2,X3,X4,X5,X6).
:- body_6(X1,X2,X3,X4,X5,X6), X6!=2, not chn(X1,X2,X3,X4,X5,X6), span(X1,X2,X3,X4,X5,X6).
:- body_6(X1,X2,X3,X4,X5,X6), X6!=3, not chn(X1,X2,X3,X4,X5,X6), not span(X1,X2,X3,X4,X5,X6), jap(X1,X2,X3,X4,X5,X6).


1{degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6): D1=1..3, D2=1..3, D3=1..3, D4=1..2, D5=1..3,D6=1..3}1 :- ap(X1,X2,X3,X4,X5,X6).
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X1=0, D1!=1. 
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X1>0, D1!=X1.
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X2=0, D2!=1. 
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X2>0, D2!=X2. 
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X3=0, D3!=1. 
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X3>0, D3!=X3.
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X4=0, D4!=1. 
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X4>0, D4!=X4.
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X5=0, D5!=1. 
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X5>0, D5!=X5.
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X6=0, D6!=1. 
:- degree(ap(X1,X2,X3,X4,X5,X6), D1,D2,D3,D4,D5,D6), X6>0, D6!=X6.

sum(P,N) :- degree(P,D1,D2,D3,D4,D5,D6), N=D1+D2+D3+D4. 
prf(P1,P2) :- sum(P1,N1), sum(P2,N2), N1<N2. 
pAS(X1,X2,X3,X4,X5,X6):- ap(X1,X2,X3,X4,X5,X6), {prf(P, ap(X1,X2,X3,X4,X5,X6))}0.