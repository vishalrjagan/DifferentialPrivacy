val = True
assgn0 = 1
assgnu7 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (0)]], {x, x, -1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[0,1/eps]:cnst0=-1:*)
assgn8 = Limit[assgnu7, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=LaplaceDistribution[0,1/eps]:cnst0=-1:*)
assgnu1 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (-1)]], {x, x, -1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,1/eps]:cnst0=-1:*)
assgn2 = Limit[assgnu1, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=LaplaceDistribution[-1,1/eps]:cnst0=-1:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn2)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|-1)>Exp[eps]*P(-1|0)"]; Print[FindInstance[(eps > 0 && (((assgn2)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn8)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn2)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|0)>Exp[eps]*P(-1|-1)"]; Print[FindInstance[(eps > 0 && (((assgn8)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn2)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu9 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[0,1/eps]:cnst1=0:*)
assgn10 = assgnu9/.{x -> -1}
assgnu3 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (-1)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,1/eps]:cnst1=0:*)
assgn4 = assgnu3/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn4)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn10)*(assgn0))))], Reals],Null,(Print["P(0|-1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && (((assgn4)*(assgn0))) > Exp[1 * eps] * (((assgn10)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn10)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn4)*(assgn0))))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|-1)"]; Print[FindInstance[(eps > 0 && (((assgn10)*(assgn0))) > Exp[1 * eps] * (((assgn4)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu11 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[0,1/eps]:*)
assgn12 = assgnu11/.{x -> 0}
assgnu5 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,1/eps]:*)
assgn6 = assgnu5/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn6)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn12)*(assgn0))))], Reals],Null,(Print["P(1|-1)>Exp[eps]*P(1|0)"]; Print[FindInstance[(eps > 0 && (((assgn6)*(assgn0))) > Exp[1 * eps] * (((assgn12)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn12)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn6)*(assgn0))))], Reals],Null,(Print["P(1|0)>Exp[eps]*P(1|-1)"]; Print[FindInstance[(eps > 0 && (((assgn12)*(assgn0))) > Exp[1 * eps] * (((assgn6)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu13 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (1)]], {x, x, -1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[1,1/eps]:cnst0=-1:*)
assgn14 = Limit[assgnu13, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=LaplaceDistribution[1,1/eps]:cnst0=-1:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn8)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn14)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|0)>Exp[eps]*P(-1|1)"]; Print[FindInstance[(eps > 0 && (((assgn8)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn14)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14)*(assgn0)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0))))], Reals],Null,(Print["P(-1|1)>Exp[eps]*P(-1|0)"]; Print[FindInstance[(eps > 0 && (((assgn14)*(assgn0)*(assgn0))) > Exp[1 * eps] * (((assgn8)*(assgn0)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu15 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (1)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[1,1/eps]:cnst1=0:*)
assgn16 = assgnu15/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn10)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn16)*(assgn0))))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|1)"]; Print[FindInstance[(eps > 0 && (((assgn10)*(assgn0))) > Exp[1 * eps] * (((assgn16)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn16)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn10)*(assgn0))))], Reals],Null,(Print["P(0|1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && (((assgn16)*(assgn0))) > Exp[1 * eps] * (((assgn10)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu17 = Integrate[(1/eps)/2*assgn0*Exp[-(1/eps)*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[1,1/eps]:*)
assgn18 = assgnu17/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn12)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn18)*(assgn0))))], Reals],Null,(Print["P(1|0)>Exp[eps]*P(1|1)"]; Print[FindInstance[(eps > 0 && (((assgn12)*(assgn0))) > Exp[1 * eps] * (((assgn18)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn18)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn12)*(assgn0))))], Reals],Null,(Print["P(1|1)>Exp[eps]*P(1|0)"]; Print[FindInstance[(eps > 0 && (((assgn18)*(assgn0))) > Exp[1 * eps] * (((assgn12)*(assgn0)))), eps, Reals]]; Exit[])]
Print[val]
Exit[]
