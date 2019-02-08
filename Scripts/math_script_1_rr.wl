val = True
If[Resolve[ForAll[eps, eps > 0 && eps < 1, (((1-((1-eps)/2))) \[LessEqual] Exp[1 * eps] * (((1-eps)/2)))], Reals],Null,(Print["P(0|0)>Exp[eps]*P(0|1)"]; Print[FindInstance[(eps > 0 && eps < 1 && ((1-((1-eps)/2))) > Exp[1 * eps] * (((1-eps)/2))), eps, Reals]]; Exit[])]
If[Resolve[ForAll[eps, eps > 0 && eps < 1, ((((1-eps)/2)) \[LessEqual] Exp[1 * eps] * ((1-((1-eps)/2))))], Reals],Null,(Print["P(0|1)>Exp[eps]*P(0|0)"]; Print[FindInstance[(eps > 0 && eps < 1 && (((1-eps)/2)) > Exp[1 * eps] * ((1-((1-eps)/2)))), eps, Reals]]; Exit[])]
Print[val]
Exit[]
