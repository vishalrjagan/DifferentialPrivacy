val = True
assgn0 = 1
assgnu7 = Integrate[Piecewise[{{0, x<0},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (0)]], True}}], {x, x, -1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[0,eps/2]:cnst0=-1:*)
assgn8 = Limit[assgnu7, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=ExponentialDistribution[0,eps/2]:cnst0=-1:*)
assgnu1 = Integrate[Piecewise[{{0, x<-1},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (-1)]], True}}], {x, x, -1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[-1,eps/2]:cnst0=-1:*)
assgn2 = Limit[assgnu1, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=ExponentialDistribution[-1,eps/2]:cnst0=-1:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn2)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|-1)>Exp[eps]*P(-1|0)"]; Print[FindInstance[(eps > 0 && (((assgn2)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn8)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn2)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|0)>Exp[eps]*P(-1|-1)"]; Print[FindInstance[(eps > 0 && (((assgn8)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn2)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu9 = Integrate[Piecewise[{{0, x<0},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (0)]], True}}], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[0,eps/2]:cnst1=0:*)
assgn10 = assgnu9/.{x -> -1}
assgnu3 = Integrate[Piecewise[{{0, x<-1},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (-1)]], True}}], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[-1,eps/2]:cnst1=0:*)
assgn4 = assgnu3/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn4)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn10)*(assgn0))))], Reals],Null,(Print["P(0|-1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && (((assgn4)*(assgn0))) > Exp[1 * eps] * (((assgn10)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn10)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn4)*(assgn0))))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|-1)"]; Print[FindInstance[(eps > 0 && (((assgn10)*(assgn0))) > Exp[1 * eps] * (((assgn4)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu11 = Integrate[Piecewise[{{0, x<0},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (0)]], True}}], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[0,eps/2]:*)
assgn12 = assgnu11/.{x -> 0}
assgnu5 = Integrate[Piecewise[{{0, x<-1},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (-1)]], True}}], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[-1,eps/2]:*)
assgn6 = assgnu5/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn6)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn12)*(assgn0))))], Reals],Null,(Print["P(1|-1)>Exp[eps]*P(1|0)"]; Print[FindInstance[(eps > 0 && (((assgn6)*(assgn0))) > Exp[1 * eps] * (((assgn12)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn12)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn6)*(assgn0))))], Reals],Null,(Print["P(1|0)>Exp[eps]*P(1|-1)"]; Print[FindInstance[(eps > 0 && (((assgn12)*(assgn0))) > Exp[1 * eps] * (((assgn6)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu13 = Integrate[Piecewise[{{0, x<1},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (1)]], True}}], {x, x, -1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[1,eps/2]:cnst0=-1:*)
assgn14 = Limit[assgnu13, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=ExponentialDistribution[1,eps/2]:cnst0=-1:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn8)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn14)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|0)>Exp[eps]*P(-1|1)"]; Print[FindInstance[(eps > 0 && (((assgn8)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn14)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|1)>Exp[eps]*P(-1|0)"]; Print[FindInstance[(eps > 0 && (((assgn14)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu15 = Integrate[Piecewise[{{0, x<1},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (1)]], True}}], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[1,eps/2]:cnst1=0:*)
assgn16 = assgnu15/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn10)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn16)*(assgn0))))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|1)"]; Print[FindInstance[(eps > 0 && (((assgn10)*(assgn0))) > Exp[1 * eps] * (((assgn16)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn16)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn10)*(assgn0))))], Reals],Null,(Print["P(0|1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && (((assgn16)*(assgn0))) > Exp[1 * eps] * (((assgn10)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu17 = Integrate[Piecewise[{{0, x<1},{(eps/2)*assgn0*Exp[-(eps/2)*Abs[x - (1)]], True}}], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=ExponentialDistribution[1,eps/2]:*)
assgn18 = assgnu17/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn12)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn18)*(assgn0))))], Reals],Null,(Print["P(1|0)>Exp[eps]*P(1|1)"]; Print[FindInstance[(eps > 0 && (((assgn12)*(assgn0))) > Exp[1 * eps] * (((assgn18)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn18)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn12)*(assgn0))))], Reals],Null,(Print["P(1|1)>Exp[eps]*P(1|0)"]; Print[FindInstance[(eps > 0 && (((assgn18)*(assgn0))) > Exp[1 * eps] * (((assgn12)*(assgn0)))), eps, Reals]]; Exit[])]
Print[val]
Exit[]
