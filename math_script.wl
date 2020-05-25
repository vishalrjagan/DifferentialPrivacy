val = True
assgn0 = 1
assgnu4 = Integrate[(eps/(2*1))/2*assgn0*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgnu10 = Integrate[(eps/(4*1*1))/2*assgnu4*Exp[-(eps/(4*1*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[0,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgn11 = Limit[assgnu10, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*lhs0=LaplaceDistribution[0,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgnu5 = Integrate[(eps/(4*1*1))/2*assgnu4*Exp[-(eps/(4*1*1))*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[-1,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgn6 = Limit[assgnu5, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*lhs0=LaplaceDistribution[-1,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn6))) \[LessEqual] Exp[1 * eps] * (((assgn11))))], Reals],Null,(Print["P(0|-1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && (((assgn6))) > Exp[1 * eps] * (((assgn11)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn11))) \[LessEqual] Exp[1 * eps] * (((assgn6))))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|-1)"]; Print[FindInstance[(eps > 0 && (((assgn11))) > Exp[1 * eps] * (((assgn6)))), eps, Reals]]; Exit[])]
assgnu7 = Integrate[(eps/(4*1*1))/2*assgn0*Exp[-(eps/(4*1*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[0,eps/(4*1*1)]:*)
assgnu8 = Integrate[(eps/(2*1))/2*assgnu7*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[0,eps/(4*1*1)]:*)
assgn9 = Limit[assgnu8, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[0,eps/(4*1*1)]:*)
assgnu1 = Integrate[(eps/(4*1*1))/2*assgn0*Exp[-(eps/(4*1*1))*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[-1,eps/(4*1*1)]:*)
assgnu2 = Integrate[(eps/(2*1))/2*assgnu1*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[-1,eps/(4*1*1)]:*)
assgn3 = Limit[assgnu2, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[-1,eps/(4*1*1)]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn3))) \[LessEqual] Exp[1 * eps] * (((assgn9))))], Reals],Null,(Print["P(1|-1)>Exp[eps]*P(1|0)"]; Print[FindInstance[(eps > 0 && (((assgn3))) > Exp[1 * eps] * (((assgn9)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn9))) \[LessEqual] Exp[1 * eps] * (((assgn3))))], Reals],Null,(Print["P(1|0)>Exp[eps]*P(1|-1)"]; Print[FindInstance[(eps > 0 && (((assgn9))) > Exp[1 * eps] * (((assgn3)))), eps, Reals]]; Exit[])]
assgnu15 = Integrate[(eps/(4*1*1))/2*assgnu4*Exp[-(eps/(4*1*1))*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[1,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgn16 = Limit[assgnu15, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*lhs0=LaplaceDistribution[1,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn11))) \[LessEqual] Exp[1 * eps] * (((assgn16))))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|1)"]; Print[FindInstance[(eps > 0 && (((assgn11))) > Exp[1 * eps] * (((assgn16)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn16))) \[LessEqual] Exp[1 * eps] * (((assgn11))))], Reals],Null,(Print["P(0|1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && (((assgn16))) > Exp[1 * eps] * (((assgn11)))), eps, Reals]]; Exit[])]
assgnu12 = Integrate[(eps/(4*1*1))/2*assgn0*Exp[-(eps/(4*1*1))*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[1,eps/(4*1*1)]:*)
assgnu13 = Integrate[(eps/(2*1))/2*assgnu12*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[1,eps/(4*1*1)]:*)
assgn14 = Limit[assgnu13, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[1,eps/(4*1*1)]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn9))) \[LessEqual] Exp[1 * eps] * (((assgn14))))], Reals],Null,(Print["P(1|0)>Exp[eps]*P(1|1)"]; Print[FindInstance[(eps > 0 && (((assgn9))) > Exp[1 * eps] * (((assgn14)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14))) \[LessEqual] Exp[1 * eps] * (((assgn9))))], Reals],Null,(Print["P(1|1)>Exp[eps]*P(1|0)"]; Print[FindInstance[(eps > 0 && (((assgn14))) > Exp[1 * eps] * (((assgn9)))), eps, Reals]]; Exit[])]
Print[val]
Exit[]
