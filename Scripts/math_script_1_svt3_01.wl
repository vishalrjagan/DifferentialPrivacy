val = True
assgn0 = 1
assgnu10 = Integrate[(eps/(2*1))/2*assgn0*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgnu22 = Integrate[(eps/(4*1*1))/2*assgnu10*Exp[-(eps/(4*1*1))*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[1,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgn23 = Limit[assgnu22, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*lhs0=LaplaceDistribution[1,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgnu11 = Integrate[(eps/(4*1*1))/2*assgnu10*Exp[-(eps/(4*1*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[0,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgn12 = Limit[assgnu11, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*lhs0=LaplaceDistribution[0,eps/(4*1*1)]:rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn0)*(assgn0)*(assgn12))) \[LessEqual] Exp[1 * eps] * (((assgn0)*(assgn0)*(assgn23))))], Reals],Null,(Print["P(-1|0)>Exp[eps]*P(-1|1)"]; Print[FindInstance[(eps > 0 && (((assgn0)*(assgn0)*(assgn12))) > Exp[1 * eps] * (((assgn0)*(assgn0)*(assgn23)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn0)*(assgn0)*(assgn23))) \[LessEqual] Exp[1 * eps] * (((assgn0)*(assgn0)*(assgn12))))], Reals],Null,(Print["P(-1|1)>Exp[eps]*P(-1|0)"]; Print[FindInstance[(eps > 0 && (((assgn0)*(assgn0)*(assgn23))) > Exp[1 * eps] * (((assgn0)*(assgn0)*(assgn12)))), eps, Reals]]; Exit[])]
assgnu13 = Integrate[(eps/(4*1*1))/2*assgn0*Exp[-(eps/(4*1*1))*Abs[x - (1)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[1,eps/(4*1*1)]:cnst0=0:*)
assgnu14 = Integrate[(eps/(2*1))/2*assgnu13*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[1,eps/(4*1*1)]:cnst0=0:*)
assgn15 = Limit[assgnu14, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[1,eps/(4*1*1)]:cnst0=0:*)
assgnu1 = Integrate[(eps/(4*1*1))/2*assgn0*Exp[-(eps/(4*1*1))*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[0,eps/(4*1*1)]:cnst0=0:*)
assgnu2 = Integrate[(eps/(2*1))/2*assgnu1*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[0,eps/(4*1*1)]:cnst0=0:*)
assgn3 = Limit[assgnu2, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[0,eps/(4*1*1)]:cnst0=0:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn3)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn15)*(assgn0))))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|1)"]; Print[FindInstance[(eps > 0 && (((assgn3)*(assgn0))) > Exp[1 * eps] * (((assgn15)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn15)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn3)*(assgn0))))], Reals],Null,(Print["P(0|1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && (((assgn15)*(assgn0))) > Exp[1 * eps] * (((assgn3)*(assgn0)))), eps, Reals]]; Exit[])]
assgnu16 = Integrate[(eps/(4*1*1))/2*assgn0*Exp[-(eps/(4*1*1))*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[1,eps/(4*1*1)]:*)
assgn17 = assgnu16/.{x -> 0}
assgnu18 = Integrate[(eps/(2*1))/2*assgn17*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:cnst0=0:lhs0=LaplaceDistribution[1,eps/(4*1*1)]:*)
assgn19 = Limit[assgnu18, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:cnst0=0:lhs0=LaplaceDistribution[1,eps/(4*1*1)]:*)
assgnu20 = Integrate[(eps/(2*1))/2*assgnu16*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[1,eps/(4*1*1)]:*)
assgn21 = assgnu20/.{x -> 0}
assgnu4 = Integrate[(eps/(4*1*1))/2*assgn0*Exp[-(eps/(4*1*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*lhs0=LaplaceDistribution[0,eps/(4*1*1)]:*)
assgn5 = assgnu4/.{x -> 0}
assgnu6 = Integrate[(eps/(2*1))/2*assgn5*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:cnst0=0:lhs0=LaplaceDistribution[0,eps/(4*1*1)]:*)
assgn7 = Limit[assgnu6, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:cnst0=0:lhs0=LaplaceDistribution[0,eps/(4*1*1)]:*)
assgnu8 = Integrate[(eps/(2*1))/2*assgnu4*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=LaplaceDistribution[0,eps/(4*1*1)]:*)
assgn9 = assgnu8/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn7+assgn9)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn19+assgn21)*(assgn0))))], Reals],Null,(Print["P(1|0)>Exp[eps]*P(1|1)"]; Print[FindInstance[(eps > 0 && (((assgn7+assgn9)*(assgn0))) > Exp[1 * eps] * (((assgn19+assgn21)*(assgn0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn19+assgn21)*(assgn0))) \[LessEqual] Exp[1 * eps] * (((assgn7+assgn9)*(assgn0))))], Reals],Null,(Print["P(1|1)>Exp[eps]*P(1|0)"]; Print[FindInstance[(eps > 0 && (((assgn19+assgn21)*(assgn0))) > Exp[1 * eps] * (((assgn7+assgn9)*(assgn0)))), eps, Reals]]; Exit[])]
Print[val]
Exit[]
