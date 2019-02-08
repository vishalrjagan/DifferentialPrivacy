val = True
assgn0 = 1
assgnu4 = Integrate[(eps/(2*1))/2*assgn0*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:*)
assgn8 = assgnu4/.{x -> 0}
assgn5 = assgnu4/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn5))) \[LessEqual] Exp[1 * eps] * (((assgn8))))], Reals],Null,(Print["P(0;0|-1 -1)>Exp[eps]*P(0;0|-1 0)"]; Print[FindInstance[(eps > 0 && (((assgn5))) > Exp[1 * eps] * (((assgn8)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn8))) \[LessEqual] Exp[1 * eps] * (((assgn5))))], Reals],Null,(Print["P(0;0|-1 0)>Exp[eps]*P(0;0|-1 -1)"]; Print[FindInstance[(eps > 0 && (((assgn8))) > Exp[1 * eps] * (((assgn5)))), eps, Reals]]; Exit[])]
assgnu6 = Integrate[(eps/(2*1))/2*assgn0*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs1=0:*)
assgn7 = assgnu6/.{x -> -1}
assgnu1 = Integrate[(eps/(2*1))/2*assgn0*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, -1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=-1:lhs1=-1:*)
assgn3 = assgnu1/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn3))) \[LessEqual] Exp[1 * eps] * (((assgn7))))], Reals],Null,(Print["P(0;1|-1 -1)>Exp[eps]*P(0;1|-1 0)"]; Print[FindInstance[(eps > 0 && (((assgn3))) > Exp[1 * eps] * (((assgn7)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn7))) \[LessEqual] Exp[1 * eps] * (((assgn3))))], Reals],Null,(Print["P(0;1|-1 0)>Exp[eps]*P(0;1|-1 -1)"]; Print[FindInstance[(eps > 0 && (((assgn7))) > Exp[1 * eps] * (((assgn3)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((0))) \[LessEqual] Exp[1 * eps] * (((0))))], Reals],Null,(Print["P(1;0|-1 -1)>Exp[eps]*P(1;0|-1 0)"]; Print[FindInstance[(eps > 0 && (((0))) > Exp[1 * eps] * (((0)))), eps, Reals]]; Exit[])]
assgn2 = Limit[assgnu1, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=-1:lhs1=-1:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn2))) \[LessEqual] Exp[1 * eps] * (((assgn2))))], Reals],Null,(Print["P(1;1|-1 -1)>Exp[eps]*P(1;1|-1 0)"]; Print[FindInstance[(eps > 0 && (((assgn2))) > Exp[1 * eps] * (((assgn2)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn3))) \[LessEqual] Exp[1 * eps] * (((0))))], Reals],Null,(Print["P(0;1|-1 -1)>Exp[eps]*P(0;1|0 -1)"]; Print[FindInstance[(eps > 0 && (((assgn3))) > Exp[1 * eps] * (((0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((0))) \[LessEqual] Exp[1 * eps] * (((assgn3))))], Reals],Null,(Print["P(0;1|0 -1)>Exp[eps]*P(0;1|-1 -1)"]; Print[FindInstance[(eps > 0 && (((0))) > Exp[1 * eps] * (((assgn3)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((0))) \[LessEqual] Exp[1 * eps] * (((assgn7))))], Reals],Null,(Print["P(1;0|-1 -1)>Exp[eps]*P(1;0|0 -1)"]; Print[FindInstance[(eps > 0 && (((0))) > Exp[1 * eps] * (((assgn7)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn7))) \[LessEqual] Exp[1 * eps] * (((0))))], Reals],Null,(Print["P(1;0|0 -1)>Exp[eps]*P(1;0|-1 -1)"]; Print[FindInstance[(eps > 0 && (((assgn7))) > Exp[1 * eps] * (((0)))), eps, Reals]]; Exit[])]
assgn13 = assgnu6/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn3))) \[LessEqual] Exp[1 * eps] * (((assgn13))))], Reals],Null,(Print["P(0;1|-1 -1)>Exp[eps]*P(0;1|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn3))) > Exp[1 * eps] * (((assgn13)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn13))) \[LessEqual] Exp[1 * eps] * (((assgn3))))], Reals],Null,(Print["P(0;1|0 0)>Exp[eps]*P(0;1|-1 -1)"]; Print[FindInstance[(eps > 0 && (((assgn13))) > Exp[1 * eps] * (((assgn3)))), eps, Reals]]; Exit[])]
assgn12 = Limit[assgnu6, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=0:lhs1=0:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn2))) \[LessEqual] Exp[1 * eps] * (((assgn12))))], Reals],Null,(Print["P(1;1|-1 -1)>Exp[eps]*P(1;1|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn2))) > Exp[1 * eps] * (((assgn12)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn12))) \[LessEqual] Exp[1 * eps] * (((assgn2))))], Reals],Null,(Print["P(1;1|0 0)>Exp[eps]*P(1;1|-1 -1)"]; Print[FindInstance[(eps > 0 && (((assgn12))) > Exp[1 * eps] * (((assgn2)))), eps, Reals]]; Exit[])]
assgn11 = assgnu4/.{x -> 1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn8))) \[LessEqual] Exp[1 * eps] * (((assgn11))))], Reals],Null,(Print["P(0;0|-1 0)>Exp[eps]*P(0;0|-1 1)"]; Print[FindInstance[(eps > 0 && (((assgn8))) > Exp[1 * eps] * (((assgn11)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn11))) \[LessEqual] Exp[1 * eps] * (((assgn8))))], Reals],Null,(Print["P(0;0|-1 1)>Exp[eps]*P(0;0|-1 0)"]; Print[FindInstance[(eps > 0 && (((assgn11))) > Exp[1 * eps] * (((assgn8)))), eps, Reals]]; Exit[])]
assgnu9 = Integrate[(eps/(2*1))/2*assgn0*Exp[-(eps/(2*1))*Abs[x - (0)]], {x, x, 1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs1=1:*)
assgn10 = assgnu9/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn7))) \[LessEqual] Exp[1 * eps] * (((assgn10))))], Reals],Null,(Print["P(0;1|-1 0)>Exp[eps]*P(0;1|-1 1)"]; Print[FindInstance[(eps > 0 && (((assgn7))) > Exp[1 * eps] * (((assgn10)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn10))) \[LessEqual] Exp[1 * eps] * (((assgn7))))], Reals],Null,(Print["P(0;1|-1 1)>Exp[eps]*P(0;1|-1 0)"]; Print[FindInstance[(eps > 0 && (((assgn10))) > Exp[1 * eps] * (((assgn7)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn8))) \[LessEqual] Exp[1 * eps] * (((assgn8))))], Reals],Null,(Print["P(0;0|-1 0)>Exp[eps]*P(0;0|0 -1)"]; Print[FindInstance[(eps > 0 && (((assgn8))) > Exp[1 * eps] * (((assgn8)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn7))) \[LessEqual] Exp[1 * eps] * (((assgn13))))], Reals],Null,(Print["P(0;1|-1 0)>Exp[eps]*P(0;1|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn7))) > Exp[1 * eps] * (((assgn13)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn13))) \[LessEqual] Exp[1 * eps] * (((assgn7))))], Reals],Null,(Print["P(0;1|0 0)>Exp[eps]*P(0;1|-1 0)"]; Print[FindInstance[(eps > 0 && (((assgn13))) > Exp[1 * eps] * (((assgn7)))), eps, Reals]]; Exit[])]
assgn14 = assgnu9/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn7))) \[LessEqual] Exp[1 * eps] * (((assgn14))))], Reals],Null,(Print["P(0;1|-1 0)>Exp[eps]*P(0;1|0 1)"]; Print[FindInstance[(eps > 0 && (((assgn7))) > Exp[1 * eps] * (((assgn14)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14))) \[LessEqual] Exp[1 * eps] * (((assgn7))))], Reals],Null,(Print["P(0;1|0 1)>Exp[eps]*P(0;1|-1 0)"]; Print[FindInstance[(eps > 0 && (((assgn14))) > Exp[1 * eps] * (((assgn7)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn10))) \[LessEqual] Exp[1 * eps] * (((assgn13))))], Reals],Null,(Print["P(0;1|-1 1)>Exp[eps]*P(0;1|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn10))) > Exp[1 * eps] * (((assgn13)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn13))) \[LessEqual] Exp[1 * eps] * (((assgn10))))], Reals],Null,(Print["P(0;1|0 0)>Exp[eps]*P(0;1|-1 1)"]; Print[FindInstance[(eps > 0 && (((assgn13))) > Exp[1 * eps] * (((assgn10)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn11))) \[LessEqual] Exp[1 * eps] * (((assgn11))))], Reals],Null,(Print["P(0;0|-1 1)>Exp[eps]*P(0;0|0 1)"]; Print[FindInstance[(eps > 0 && (((assgn11))) > Exp[1 * eps] * (((assgn11)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn10))) \[LessEqual] Exp[1 * eps] * (((assgn14))))], Reals],Null,(Print["P(0;1|-1 1)>Exp[eps]*P(0;1|0 1)"]; Print[FindInstance[(eps > 0 && (((assgn10))) > Exp[1 * eps] * (((assgn14)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14))) \[LessEqual] Exp[1 * eps] * (((assgn10))))], Reals],Null,(Print["P(0;1|0 1)>Exp[eps]*P(0;1|-1 1)"]; Print[FindInstance[(eps > 0 && (((assgn14))) > Exp[1 * eps] * (((assgn10)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((0))) \[LessEqual] Exp[1 * eps] * (((assgn13))))], Reals],Null,(Print["P(0;1|0 -1)>Exp[eps]*P(0;1|0 0)"]; Print[FindInstance[(eps > 0 && (((0))) > Exp[1 * eps] * (((assgn13)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn13))) \[LessEqual] Exp[1 * eps] * (((0))))], Reals],Null,(Print["P(0;1|0 0)>Exp[eps]*P(0;1|0 -1)"]; Print[FindInstance[(eps > 0 && (((assgn13))) > Exp[1 * eps] * (((0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn13))) \[LessEqual] Exp[1 * eps] * (((assgn14))))], Reals],Null,(Print["P(0;1|0 0)>Exp[eps]*P(0;1|0 1)"]; Print[FindInstance[(eps > 0 && (((assgn13))) > Exp[1 * eps] * (((assgn14)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14))) \[LessEqual] Exp[1 * eps] * (((assgn13))))], Reals],Null,(Print["P(0;1|0 1)>Exp[eps]*P(0;1|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn14))) > Exp[1 * eps] * (((assgn13)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn12))) \[LessEqual] Exp[1 * eps] * (((assgn12))))], Reals],Null,(Print["P(1;1|0 0)>Exp[eps]*P(1;1|0 1)"]; Print[FindInstance[(eps > 0 && (((assgn12))) > Exp[1 * eps] * (((assgn12)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((0))) \[LessEqual] Exp[1 * eps] * (((assgn10))))], Reals],Null,(Print["P(1;0|0 0)>Exp[eps]*P(1;0|1 -1)"]; Print[FindInstance[(eps > 0 && (((0))) > Exp[1 * eps] * (((assgn10)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn10))) \[LessEqual] Exp[1 * eps] * (((0))))], Reals],Null,(Print["P(1;0|1 -1)>Exp[eps]*P(1;0|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn10))) > Exp[1 * eps] * (((0)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((0))) \[LessEqual] Exp[1 * eps] * (((assgn14))))], Reals],Null,(Print["P(1;0|0 0)>Exp[eps]*P(1;0|1 0)"]; Print[FindInstance[(eps > 0 && (((0))) > Exp[1 * eps] * (((assgn14)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14))) \[LessEqual] Exp[1 * eps] * (((0))))], Reals],Null,(Print["P(1;0|1 0)>Exp[eps]*P(1;0|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn14))) > Exp[1 * eps] * (((0)))), eps, Reals]]; Exit[])]
assgn16 = assgnu9/.{x -> 1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn13))) \[LessEqual] Exp[1 * eps] * (((assgn16))))], Reals],Null,(Print["P(0;1|0 0)>Exp[eps]*P(0;1|1 1)"]; Print[FindInstance[(eps > 0 && (((assgn13))) > Exp[1 * eps] * (((assgn16)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn16))) \[LessEqual] Exp[1 * eps] * (((assgn13))))], Reals],Null,(Print["P(0;1|1 1)>Exp[eps]*P(0;1|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn16))) > Exp[1 * eps] * (((assgn13)))), eps, Reals]]; Exit[])]
assgn15 = Limit[assgnu9, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*rhs0=LaplaceDistribution[0,eps/(2*1)]:lhs0=1:lhs1=1:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn12))) \[LessEqual] Exp[1 * eps] * (((assgn15))))], Reals],Null,(Print["P(1;1|0 0)>Exp[eps]*P(1;1|1 1)"]; Print[FindInstance[(eps > 0 && (((assgn12))) > Exp[1 * eps] * (((assgn15)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn15))) \[LessEqual] Exp[1 * eps] * (((assgn12))))], Reals],Null,(Print["P(1;1|1 1)>Exp[eps]*P(1;1|0 0)"]; Print[FindInstance[(eps > 0 && (((assgn15))) > Exp[1 * eps] * (((assgn12)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn14))) \[LessEqual] Exp[1 * eps] * (((assgn16))))], Reals],Null,(Print["P(0;1|0 1)>Exp[eps]*P(0;1|1 1)"]; Print[FindInstance[(eps > 0 && (((assgn14))) > Exp[1 * eps] * (((assgn16)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn16))) \[LessEqual] Exp[1 * eps] * (((assgn14))))], Reals],Null,(Print["P(0;1|1 1)>Exp[eps]*P(0;1|0 1)"]; Print[FindInstance[(eps > 0 && (((assgn16))) > Exp[1 * eps] * (((assgn14)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((0))) \[LessEqual] Exp[1 * eps] * (((assgn16))))], Reals],Null,(Print["P(0;1|1 0)>Exp[eps]*P(0;1|1 1)"]; Print[FindInstance[(eps > 0 && (((0))) > Exp[1 * eps] * (((assgn16)))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0, ((((assgn16))) \[LessEqual] Exp[1 * eps] * (((0))))], Reals],Null,(Print["P(0;1|1 1)>Exp[eps]*P(0;1|1 0)"]; Print[FindInstance[(eps > 0 && (((assgn16))) > Exp[1 * eps] * (((0)))), eps, Reals]]; Exit[])]
Print[val]
Exit[]
