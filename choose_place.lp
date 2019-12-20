%Implement the following LPOD program into ASP on Clingo: 1) cinema × beach<-not hot;2)beach × cinema<-hot 3) cool× hot<-not summer

{ap(X1,X2,X4): X1=0..3, X2=0..3,X4=0..2}. :~ ap(X1,X2,X4). [-1, X1, X2,X4]


% cinema × library ×beach <-cool. 
body_1(X1,X2,X4) :- ap(X1,X2,X4), cool(X1,X2,X4).
:- ap(X1,X2,X4), X1=0, body_1(X1,X2,X4).
:- ap(X1,X2,X4), X1>0, not body_1(X1,X2,X4).
cinema(X1,X2,X4):- body_1(X1,X2,X4), X1=1. 
library(X1,X2,X4):- body_1(X1,X2,X4), X1=2.
beach(X1,X2,X4):- body_1(X1,X2,X4), X1=3. 
:- body_1(X1,X2,X4), X1!=1, cinema(X1,X2,X4).
:- body_1(X1,X2,X4), X1!=2, not cinema(X1,X2,X4), library(X1,X2,X4).
:- body_1(X1,X2,X4), X1!=3, not cinema(X1,X2,X4), not library(X1,X2,X4), beach(X1,X2,X4).

% beach × cinema× library<-hot. 
body_2(X1,X2,X4) :- ap(X1,X2,X4),hot(X1,X2,X4).
:- ap(X1,X2,X4), X2=0, body_2(X1,X2,X4).
:- ap(X1,X2,X4), X2>0, not body_2(X1,X2,X4).
beach(X1,X2,X4):- body_2(X1,X2,X4), X2=1. 
cinema(X1,X2,X4):- body_2(X1,X2,X4), X2=2. 
library(X1,X2,X4):- body_2(X1,X2,X4), X2=3. 
:- body_2(X1,X2,X4), X2!=1, beach(X1,X2,X4).
:- body_2(X1,X2,X4), X2!=2, not beach(X1,X2,X4), cinema(X1,X2,X4).
:- body_2(X1,X2,X4), X2!=3, not beach(X1,X2,X4), not cinema(X1,X2,X4), library(X1,X2,X4).

% cool× hot<-not summer. 
body_4(X1,X2,X4):- ap(X1,X2,X4),not summer(X1,X2,X4).
:- ap(X1,X2,X4), X4=0, body_4(X1,X2,X4).
:- ap(X1,X2,X4), X4>0, not body_4(X1,X2,X4).
hot(X1,X2,X4):- body_4(X1,X2,X4), X4=2. 
cool(X1,X2,X4):- body_4(X1,X2,X4), X4=1. 
:- body_4(X1,X2,X4), X4!=1, cool(X1,X2,X4).
:- body_4(X1,X2,X4), X4!=2, not cool(X1,X2,X4), hot(X1,X2,X4).


1{degree(ap(X1,X2,X4), D1, D2, D4): D1=1..3, D2=1..3, D4=1..2}1 :- ap(X1,X2,X4).
:- degree(ap(X1,X2,X4), D1, D2,D4), X1=0, D1!=1. 
:- degree(ap(X1,X2,X4), D1, D2,D4), X1>0, D1!=X1.
:- degree(ap(X1,X2,X4), D1, D2,D4), X2=0, D2!=1. 
:- degree(ap(X1,X2,X4), D1, D2,D4), X2>0, D2!=X2. 
:- degree(ap(X1,X2,X4), D1, D2,D4), X4=0, D4!=1. 
:- degree(ap(X1,X2,X4), D1, D2,D4), X4>0, D4!=X4.

sum(P,N) :- degree(P,D1,D2,D4), N=D1+D2+D4. 
prf(P1,P2) :- sum(P1,N1), sum(P2,N2), N1<N2. 
pAS(X1,X2,X4) :- ap(X1,X2,X4), {prf(P, ap(X1,X2,X4))}0.